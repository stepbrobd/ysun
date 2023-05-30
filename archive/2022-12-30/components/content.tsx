import { ReactNode } from "react";
import { MDXProvider } from "@mdx-js/react";
import Image from "./image";
import Link from "./link";

type Props = {
  children?: ReactNode;
};

const components = {
  img: Image,
  a: Link,
};

const Content = ({ children }: Props) => {
  return (
    <MDXProvider components={components}>
      <main
        className="mx-3.5 flex items-center justify-center xl:mx-0"
        aria-label="Content"
      >
        <article
          className="light-mode-text-color dark:dark-mode-text-color prose-a:light-mode-link-color
                     dark:prose-a:dark-mode-link-color prose-pre:light-mode-bg-action-color prose-pre:light-mode-text-color dark:prose-pre:dark-mode-bg-action-color dark:prose-pre:dark-mode-text-color container
                     prose prose-neutral z-0 my-10 max-w-3xl dark:prose-invert prose-pre:drop-shadow-xl"
        >
          {children}
        </article>
      </main>
    </MDXProvider>
  );
};

export default Content;
