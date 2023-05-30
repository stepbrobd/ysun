import { default as NextLink } from "next/link";

type LinkProps = {
  href: string;
  children: React.ReactNode;
  newTab?: boolean;
};

const Link = (props: LinkProps) => {
  return (
    <>
      {props.href.startsWith("http") ||
      props.href.startsWith("mailto") ||
      props.href.startsWith("tel") ? (
        <a
          className="inline link"
          href={props.href}
          rel="noopener noreferrer"
          target={props.newTab ? "_blank" : "_self"}
        >
          {props.children}
          <span className="max-h-[39px] min-h-[39px] min-w-[39px] max-w-[39px]">
            <svg
              fill="none"
              height="24"
              shapeRendering="geometricPrecision"
              stroke="currentColor"
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="1.5"
              viewBox="0 0 24 24"
              width="24"
              className="inline max-h-[15px] min-h-[15px] min-w-[15px] max-w-[15px] pb-[0.14rem] pl-[0.14rem]"
            >
              <path d="M18 13v6a2 2 0 01-2 2H5a2 2 0 01-2-2V8a2 2 0 012-2h6" />
              <path d="M15 3h6v6" />
              <path d="M10 14L21 3" />
            </svg>
          </span>
        </a>
      ) : (
        <NextLink href={props.href} className="inline link">
          {props.children}
          <span className="max-h-[39px] min-h-[39px] min-w-[39px] max-w-[39px]">
            <svg
              fill="none"
              height="24"
              shapeRendering="geometricPrecision"
              stroke="currentColor"
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="1.5"
              viewBox="0 0 24 24"
              width="24"
              className="inline max-h-[15px] min-h-[15px] min-w-[15px] max-w-[15px] pl-[0.14rem]"
            >
              <path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z" />
              <path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z" />
            </svg>
          </span>
        </NextLink>
      )}
    </>
  );
};

export default Link;
