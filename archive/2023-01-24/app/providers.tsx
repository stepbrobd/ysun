"use client";

import { ThemeProvider } from "next-themes";
import NextNProgress from "nextjs-progressbar";
import { Provider as WrapProvider } from "react-wrap-balancer";

const Providers = ({ children }) => {
  return (
    <ThemeProvider
      attribute="class"
      defaultTheme="system"
      disableTransitionOnChange
    >
      <NextNProgress
        color="#f81ce5"
        height={2}
        nonce=""
        startPosition={0.1}
        stopDelayMs={250}
        showOnShallow={true}
        options={{ showSpinner: false, easing: "ease", speed: 250 }}
      />
      <WrapProvider>{children}</WrapProvider>
    </ThemeProvider>
  );
};

export default Providers;
