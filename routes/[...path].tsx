import { Recommendation } from "!components/recommendation.tsx";
import { Layout } from "!components/layout.tsx";
import { FreshContext, RouteConfig } from "$fresh/server.ts";
import { render } from "$gfm";
import { list } from "!lib/page/list.ts";
import { Renderer } from "!lib/renderer/class.ts";
import { JSX } from "preact/jsx-runtime";

const config: RouteConfig = {
  routeOverride: "*",
};

const page = async (_req: Request, _ctx: FreshContext): Promise<JSX.Element | Response> => {
  const pages = await list();
  const path = _ctx.url.pathname;

  const page = pages.find((page) => page.slug === path);
  if (!page) {
    return _ctx.renderNotFound();
  }

  return (
    <Layout title={page.title} description={page.description}>
      <>
        <h1 class="text-2xl font-bold pb-2 mb-2 border-b border-[#d8dee4] dark:border-[#21262d]">{page.title}</h1>

        <details class="mt-4 pb-4">
          <summary class="m-0 cursor-help">
            <p class="tracking-tighter font-light text-[0.675rem]/[0.75rem] text-neutral-600 dark:text-neutral-400">
              Last updated on{" "}
              <time>
                {new Date(page.date).toLocaleDateString("en-us", {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                })}
              </time>
            </p>
          </summary>
          <div class="markdown-body mt-4 cursor-text">
            <pre>
              <span class="text-gray-500 dark:text-gray-400">
                # Use
                {" "}<a href="https://github.com/charmbracelet/glow" target="_blank" rel="noopener noreferrer">Glow</a>{" "}
                to view this page in your terminal
              </span>
              <br />
              <span class="text-green-700 dark:text-green-400">glow </span>
              <span class="text-indigo-600 dark:text-indigo-300">
                <a class="no-underline" href={_ctx.url.origin + page.path} target="_blank" rel="noopener noreferrer">
                {`${_ctx.url.origin + page.path}`}
                </a>
                </span>
              <br />
                <span class="text-gray-500 dark:text-gray-400">
                # If you have
                {" "}<a href="https://github.com/determinatesystems/nix-installer" target="_blank" rel="noopener noreferrer">Nix</a>{" "}
                on your system
              </span>
              <br />
              <span class="text-green-700 dark:text-green-400">nix </span>
              <span>--extra-experimental-features </span>
              <span class="text-red-600 dark:text-red-400">"nix-command flakes" </span>
              <span>run </span>
              <span class="text-red-600 dark:text-red-400">"nixpkgs#glow" </span>
              <span>-- </span>
              <span class="text-indigo-600 dark:text-indigo-300">
                <a class="no-underline" href={_ctx.url.origin + page.path} target="_blank" rel="noopener noreferrer">
                {`${_ctx.url.origin + page.path}`}
                </a>
              </span>
            </pre>
          </div>
        </details>

        <article
          class="markdown-body pb-4"
          dangerouslySetInnerHTML={{
            __html: render(page.body, { allowMath: true, renderer: new Renderer({ allowMath: true }) }),
          }}
        />

        <section class="pt-4 border-t border-[#d8dee4] dark:border-[#21262d]">
          <Recommendation
            current={path}
            pages={pages}
          />
        </section>
      </>
    </Layout>
  );
};

export { config };
export default page;
