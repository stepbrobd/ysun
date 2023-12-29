import { JSX } from "preact/jsx-runtime";

const Header = (): JSX.Element => {
  return (
    <header class="flex flex-row items-center justify-between py-4">
      <a href="/" aria-label="Home">
        <img class="m-0 w-5 h-5 rounded-full" width="20px" height="20px" src="/images/ysun.webp" alt="Home" />
      </a>
      <a href="https://world.hey.com/ysun" aria-label="World" target="_blank" rel="noopener noreferrer">
        <img class="m-0 w-5 h-5 rounded-full" width="20px" height="20px" src="/images/world.webp" alt="World" />
      </a>
    </header>
  );
};

export { Header };
