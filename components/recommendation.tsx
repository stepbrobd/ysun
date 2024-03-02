import { Page } from "!libs/page/type.ts";
import { JSX } from "preact/jsx-runtime";

const Recommendation = (
  { current, pages }: { current: string; pages: Page[] },
): JSX.Element => {
  return (
    <>
      {pages.length > 0 && (
        <nav class="flex flex-col gap-2 text-sm">
          {pages
            .sort((a, b) => new Date(b.modified).getTime() - new Date(a.modified).getTime())
            .map((page) => (
              page.slug === current || page.slug === "/" ? null : (
                <div
                  key={page.slug}
                  class="grid grid-cols-3 md:grid-cols-5 gap-4"
                >
                  <time>{new Date(page.date).toISOString().split("T")[0]}</time>
                  <a href={page.slug} class="col-span-2 md:col-span-4">{page.title}</a>
                </div>
              )
            ))}
        </nav>
      )}
    </>
  );
};

export { Recommendation };
