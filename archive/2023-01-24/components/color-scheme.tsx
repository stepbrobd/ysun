"use client";

import { useTheme } from "next-themes";

const ColorScheme = () => {
  const { resolvedTheme } = useTheme();
  return (
    <>
      {resolvedTheme === "light" ? (
        <meta
          name="theme-color"
          content="#fff"
          media="(prefers-color-scheme: light)"
        />
      ) : (
        <meta
          name="theme-color"
          content="#000"
          media="(prefers-color-scheme: dark)"
        />
      )}
    </>
  );
};

export default ColorScheme;
