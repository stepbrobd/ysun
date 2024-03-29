import { cwd } from "!lib/page/cwd.ts";
import IconCreativeCommons from "$icons/creative-commons.tsx";
import IconCreativeCommonsBy from "$icons/creative-commons-by.tsx";
import IconCreativeCommonsNc from "$icons/creative-commons-nc.tsx";
import { JSX } from "preact/jsx-runtime";

const Footer = (): JSX.Element => {
  return (
    <footer class="flex flex-col gap-4 py-4">
      <div class="markdown-body">
        <pre>
          <span>DENO_DEPLOYMENT_ID</span>
          <span class="text-indigo-600 dark:text-indigo-300">=</span>
          <span class="text-red-600 dark:text-red-400">
            <a class="no-underline" href={`https://github.com/stepbrobd/ysun/commit/${Deno.env.get("DENO_DEPLOYMENT_ID")}`} target="_blank" rel="noopener noreferrer">
              "{Deno.env.get("DENO_DEPLOYMENT_ID")}"
            </a>
          </span>
          <span>{" "}</span>
          <span class="text-green-700 dark:text-green-400">
            <a class="no-underline" href={`https://github.com/stepbrobd/ysun/blob/${Deno.env.get("DENO_DEPLOYMENT_ID")}/flake.nix`} target="_blank" rel="noopener noreferrer">
              {Deno.realPathSync(cwd)}/ysun
            </a>
          </span>
        </pre>
      </div>
      <div class="flex flex-row justify-between text-neutral-600 dark:text-neutral-400">
        <small class="tracking-tighter font-light text-xs">
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
