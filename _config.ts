import lume from "lume/mod.ts";
// builtins
import checkUrls from "lume/plugins/check_urls.ts";
import date from "lume/plugins/date.ts";
import feed from "lume/plugins/feed.ts";
import katex from "lume/plugins/katex.ts";
import metas from "lume/plugins/metas.ts";
import minifyHTML from "lume/plugins/minify_html.ts";
import nav from "lume/plugins/nav.ts";
import postcss from "lume/plugins/postcss.ts";
import readingInfo from "lume/plugins/reading_info.ts";
import redirects from "lume/plugins/redirects.ts";
import sitemap from "lume/plugins/sitemap.ts";
import slugifyUrls from "lume/plugins/slugify_urls.ts";
import terser from "lume/plugins/terser.ts";
// markdown
import footnotes from "lume/plugins/markdown/footnotes.ts";
import image from "lume/plugins/markdown/image.ts";
import figure from "lume/plugins/markdown/figure.ts";
import title from "lume/plugins/markdown/title.ts";
import toc from "lume/plugins/markdown/toc.ts";
// highlighting
import shiki from "shiki/mod.ts";
// typography
import tailwindcss from "lume/plugins/tailwindcss.ts";
import typography from "npm:@tailwindcss/typography";

const markdown = {
  plugins: [
    [figure, { decoding: true, figure: true, image_size: true, base_path: Deno.cwd() }],
  ],
};

// setup + markdown preprocessing
const site = lume({ location: new URL("https://ysun.co"), src: ".", includes: "assets/layout", dest: "./outputs" }, {
  markdown,
})
  .use(redirects())
  .use(metas())
  .use(slugifyUrls({ extensions: "*" }))
  .use(readingInfo())
  .use(date())
  .use(nav())
  .use(toc())
  .use(title())
  .use(image())
  .use(footnotes());

// ignore readme and license
site
  .ignore("flake.nix")
  .ignore("flake.lock")
  .ignore("parts")
  .ignore("license.txt")
  .ignore("readme.md");

// /pages/* -> /*
site.preprocess([".html"], (pages) => {
  for (const page of pages) {
    if (page.src.path.startsWith("/pages/")) {
      page.data.url = page.data.url.replace("/pages/", "/");
    }
  }
});

// styling
site
  .use(katex())
  .use(shiki({ highlighter: { themes: ["nord"] }, theme: "nord" }))
  .use(tailwindcss({
    options: {
      theme: {
        extend: {
          // https://nordtheme.com
          colors: {
            "nord-0": "#2E3440",
            "nord-1": "#3B4252",
            "nord-2": "#434C5E",
            "nord-3": "#4C566A",
            "nord-4": "#D8DEE9",
            "nord-5": "#E5E9F0",
            "nord-6": "#ECEFF4",
            "nord-7": "#8FBCBB",
            "nord-8": "#88C0D0",
            "nord-9": "#81A1C1",
            "nord-10": "#5E81AC",
            "nord-11": "#BF616A",
            "nord-12": "#D08770",
            "nord-13": "#EBCB8B",
            "nord-14": "#A3BE8C",
            "nord-15": "#B48EAD",
          },
          // https://systemfontstack.com
          fontFamily: {
            sans: [
              "-apple-system",
              "BlinkMacSystemFont",
              '"avenir next"',
              "avenir",
              '"segoe ui"',
              '"helvetica neue"',
              "helvetica",
              "Cantarell",
              "Ubuntu",
              "roboto",
              "noto",
              "arial",
              "sans-serif",
            ],
            serif: [
              '"Iowan Old Style"',
              '"Apple Garamond"',
              "Baskerville",
              '"Times New Roman"',
              '"Droid Serif"',
              "Times",
              '"Source Serif Pro"',
              "serif",
              '"Apple Color Emoji"',
              '"Segoe UI Emoji"',
              '"Segoe UI Symbol"',
            ],
            mono: [
              "Menlo",
              "Consolas",
              "Monaco",
              '"Liberation Mono"',
              '"Lucida Console"',
              "monospace",
            ],
          },
        },
      },
      plugins: [typography],
    },
  }))
  .use(postcss());

// geofeed
site.copy("assets/static/geofeed.csv", "geofeed.csv");

// /pages/* -> /*
site.copyRemainingFiles(
  (path: string) => (path.startsWith("/pages/") ? path.replace("/pages/", "/") : path),
);

// sitemap/rss generation
site
  .use(minifyHTML({ extensions: [".css", ".html", ".js"] }))
  .use(terser())
  .use(sitemap())
  .use(feed({
    output: ["feed.rss", "feed.json"],
    limit: 25,
    sort: "date=desc",
    query: "hidden=false title!='Yifei Sun'",
    info: { title: "Yifei Sun", description: "Yifei Sun", generator: false },
    items: { title: "=title", description: "=description", published: "=date" },
  }));

// check for broken links
site.use(checkUrls({
  external: true,
  output: (broken) => {
    console.log(`Found ${broken.size} broken links:`);
    for (const [link, pages] of broken) {
      console.log(`+ ${link} found in:`);
      for (const p of pages) {
        console.log(`  - ./pages${p.slice(0, -1)}.md`);
      }
    }
  },
}));

export default site;
