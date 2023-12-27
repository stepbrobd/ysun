import { type PageProps } from "$fresh/server.ts";
import { asset, Partial } from "$fresh/runtime.ts";
import { CSS, KATEX_CSS } from "$gfm";
import { JSX } from "preact/jsx-runtime";

(() => {
  for (
    const lang of [
      "c",
      "cpp",
      "css",
      "csv",
      "bash",
      "diff",
      "dns-zone-file",
      "docker",
      "go",
      "go-module",
      "haskell",
      "latex",
      "log",
      "python",
      "nix",
    ]
  ) {
    import(`prism/components/prism-${lang}?no-check`);
  }
})();

const app = ({ Component }: PageProps): JSX.Element => {
  return (
    <html lang="en-US">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href={asset("/assets/styles.css")} />
        <style>{CSS}</style>
        <style>{KATEX_CSS}</style>
        <link rel="icon" href={asset("/assets/favicon.ico")} />
        <meta property="og:image" content={asset("/assets/og.webp")} />
        <script defer data-domain="ysun.co" src="https://stats.ysun.co/js/script.js" />
      </head>
      <body
        class="selection:bg-[#aaffec] dark:selection:bg-[#f81ce5]"
        data-color-mode="auto"
        data-light-theme="light"
        data-dark-theme="dark"
        f-client-nav
      >
        <Partial name="body">
          <Component />
        </Partial>
      </body>
    </html>
  );
};

export default app;
