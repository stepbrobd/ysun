import IconCreativeCommons from "$icons/creative-commons.tsx";
import IconCreativeCommonsBy from "$icons/creative-commons-by.tsx";
import IconCreativeCommonsNc from "$icons/creative-commons-nc.tsx";
import { JSX } from "preact/jsx-runtime";

const Footer = (): JSX.Element => {
  return (
    <footer class="flex flex-col gap-4 py-4">
      <div class="flex flex-row justify-between">
        <small class="tracking-tighter font-light text-xs text-neutral-600 dark:text-neutral-400">
          &copy; {new Date().getFullYear()}
        </small>
        <a
          href="https://creativecommons.org/licenses/by-nc/4.0/"
          class="flex flex-row gap-2"
          aria-label="CC BY-NC License"
        >
          <IconCreativeCommons class="w-4 h-4" />
          <IconCreativeCommonsBy class="w-4 h-4" />
          <IconCreativeCommonsNc class="w-4 h-4" />
        </a>
      </div>
    </footer>
  );
};

export { Footer };
