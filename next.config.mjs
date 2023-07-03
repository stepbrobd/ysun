import nextra from "nextra";

const withNextra = nextra({
    theme: "nextra-theme-docs",
    themeConfig: "./theme.config.tsx",
    staticImage: true,
    readingTime: true,
    defaultShowCopyCode: true,
    latex: true,
    flexsearch: {
        codeblocks: true,
    },
});

export default withNextra({
    reactStrictMode: true,
    eslint: {
        ignoreDuringBuilds: true,
    },
});
