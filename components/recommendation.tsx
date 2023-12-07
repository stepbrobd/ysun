import { Page } from "!libs/page/type.ts";
import { JSX } from "preact/jsx-runtime";

const Recommendation = (
  { current, pages }: { current: string; pages: Page[] },
): JSX.Element => {
  return (
    <>
      {pages.length > 0 && (
        <nav class="flex flex-col gap-4">
          {pages
            .sort((a, b) => new Date(b.modified).getTime() - new Date(a.modified).getTime())
            .map((page) => (
              page.slug === current || page.slug === "/" ? null : (
                <a
                  key={page.slug}
                  class="flex flex-col gap-1 p-2 rounded-md no-underline bg-[#f6f8fa] dark:bg-[#161b22]"
                  href={page.slug}
                >
                  <span class="text-base font-medium">{page.title}</span>
                  <p class="font-light text-xs text-neutral-600 dark:text-neutral-400">
                    <time>
                      {new Date(page.modified).toLocaleDateString("en-us", {
                        year: "numeric",
                        month: "long",
                        day: "numeric",
                      })}
                    </time>
                    {", "}
                    {page.content.split(" ").length} words, {Math.ceil(page.content.split(" ").length / 200)} min read
                  </p>
                  <p class="text-xs">{page.description.slice(0, 97) + "..."}</p>
                </a>
              )
            ))}
        </nav>
      )}
    </>
  );
};

export { Recommendation };
