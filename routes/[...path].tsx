import { Recommendation } from "!components/recommendation.tsx";
import { Layout } from "!components/layout.tsx";
import { FreshContext, RouteConfig } from "$fresh/server.ts";
import { render } from "$gfm";
import { list } from "!libs/page/list.ts";
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
        <article
          class="markdown-body"
          dangerouslySetInnerHTML={{ __html: render(page.content, { allowMath: true }) }}
        />

        <section class="markdown-body mt-3 pb-4">
          <p>
            Use{" "}
            <a href="https://github.com/charmbracelet/glow">
              Glow
            </a>{" "}
            to view this page in your terminal:{"  "}<code>{`glow ${_ctx.url.origin + page.path}`}</code>.
          </p>
          <p class="text-right font-light text-xs text-neutral-600 dark:text-neutral-400">
            Last updated on{" "}
            <time>
              {new Date(page.modified).toLocaleDateString("en-us", {
                year: "numeric",
                month: "long",
                day: "numeric",
              })}
            </time>
          </p>
        </section>

        <section class="pt-4 border-t border-[##d8dee4] dark:border-[#21262d]">
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
