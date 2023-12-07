import { JSX } from "preact/jsx-runtime";

const Header = ({ links }: { links: { href: string; aria: string; icon: JSX.Element }[] }): JSX.Element => {
  return (
    <header class="flex flex-row items-center justify-between py-4">
      <a href="/" aria-label="Home">
        <img class="m-0 w-5 h-5" width="20px" height="20px" src="/images/ysun.webp" alt="Yifei Sun" />
      </a>

      {links && (
        <nav class="flex flex-row items-center justify-center gap-4">
          {links.map((link) => (
            <a href={link.href} aria-label={link.aria} f-client-nav={false}>
              {link.icon}
            </a>
          ))}
        </nav>
      )}
    </header>
  );
};

export { Header };
