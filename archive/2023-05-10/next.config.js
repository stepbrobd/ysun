/** @type {import("next").NextConfig} */
const nextConfig = {
  pageExtensions: ["ts", "tsx"],
  experimental: {
    appDir: true,
    serverActions: true,
    typedRoutes: true,
  },
};

module.exports = nextConfig;
