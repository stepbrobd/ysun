const withNextra = require("nextra")({
  theme: "nextra-theme-docs",
  themeConfig: "./theme.config.tsx",
  latex: true,
  staticImage: true,
  defaultShowCopyCode: true,
  readingTime: true,
});

module.exports = withNextra();
