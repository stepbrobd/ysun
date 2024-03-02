import { JSX } from "preact/jsx-runtime";

const Header = (): JSX.Element => {
  return (
    <header class="flex flex-row items-center justify-start py-4 gap-4 text-sm">
      <a href="/">Home</a>
      <span>|</span>
      <a href="/stats">Stats</a>
      <span>|</span>
      <a href="/rss">RSS</a>
    </header>
  );
};

export { Header };
