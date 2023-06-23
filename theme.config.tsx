import React from "react";

import { useRouter } from "next/router";
import { DocsThemeConfig, useConfig } from "nextra-theme-docs";

import Logo from "components/logo";
import Head from "components/head";
import Footer from "components/footer";

const config: DocsThemeConfig = {
  navigation: false,

  darkMode: true,
  nextThemes: {
    defaultTheme: "system",
  },

  search: {
    placeholder: "Looking for something?",
  },

  sidebar: {
    autoCollapse: true,
  },

  toc: {
    float: true,
  },

  logo: <Logo />,
  logoLink: "/",

  useNextSeoProps() {
    const { asPath } = useRouter();
    if (asPath !== "/") {
      return {
        titleTemplate: "%s – Yifei Sun",
      };
    }
  },

  head: () => {
    const { asPath, defaultLocale, locale } = useRouter();
    const { frontMatter } = useConfig();
    const url =
      "https://ysun.co" +
      (defaultLocale === locale ? asPath : `/${locale}${asPath}`);

    return (
      <Head
        url={url}
        title={frontMatter.title}
        description={frontMatter.description}
      />
    );
  },

  footer: {
    text: <Footer />,
  },
};

export default config;
