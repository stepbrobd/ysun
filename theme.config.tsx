import Footer from "components/footer";
import Head from "components/head";
import Logo from "components/logo";
import { useRouter } from "next/router";
import { DocsThemeConfig, useConfig } from "nextra-theme-docs";
import React from "react";

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
    return {
      titleTemplate: "%s – Yifei Sun",
    };
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
        title={`${frontMatter.title} - Yifei Sun`}
        description={frontMatter.description}
      />
    );
  },

  footer: {
    text: <Footer />,
  },
};

export default config;
