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

const nextConfig = {
    reactStrictMode: true,

    eslint: {
        ignoreDuringBuilds: true,
    },

    i18n: {
        locales: ["en-US"],
        defaultLocale: "en-US",
    },

    async redirects() {
        return [
            {
                permanent: true,
                source: "/publications/:path*",
                destination: "/publication/:path*",
            },
            {
                permanent: true,
                source: "/writings/:path*",
                destination: "/writing/:path*",
            },
        ];
    },
};

export default withNextra(nextConfig);
