"use client";

import "katex/dist/katex.min.css";

import KaTeX from "katex";
import React, { useMemo, useState } from "react";

export interface LaTeXProps {
  body?: string;
}

const LaTeX = (props: LaTeXProps) => {
  const latex = props?.body || "";
  const isInline = !latex.split("\n")[0].includes("block");
  const [html, setHtml] = useState<string>("");
  const createHtml = () => {
    setHtml(
      KaTeX.renderToString(latex, {
        displayMode: !isInline,
        throwOnError: false,
      }),
    );
  };

  useMemo(createHtml, [latex, isInline]);
  return (
    <>
      {isInline
        ? (
          // eslint-disable-next-line react/no-danger
          <span dangerouslySetInnerHTML={{ __html: html }} />
        )
        : (
          // eslint-disable-next-line react/no-danger
          <div dangerouslySetInnerHTML={{ __html: html }} />
        )}
    </>
  );
};

export default LaTeX;
