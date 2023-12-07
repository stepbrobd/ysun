"use client";

import { useTheme } from "next-themes";
import { PrismAsyncLight as SyntaxHighlighter } from "react-syntax-highlighter";
import { vs, vscDarkPlus } from "react-syntax-highlighter/dist/esm/styles/prism";

type CodeProps = {
  language: string;
  code: string;
};

const Code = ({ language, code }: CodeProps) => {
  const { resolvedTheme } = useTheme();
  return (
    <SyntaxHighlighter
      language={language}
      style={resolvedTheme === "dark" ? vscDarkPlus : vs}
      customStyle={{ borderRadius: "0.5rem", padding: "1rem" }}
    >
      {code}
    </SyntaxHighlighter>
  );
};

export default Code;
