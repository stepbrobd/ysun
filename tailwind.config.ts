import { type Config } from "tailwindcss";

export default {
  content: [
    "{components,islands,routes}/**/*.{ts,tsx}",
  ],
  theme: {
    extend: {
      backgroundColor: { "default": "var(--color-canvas-default)" },
      textColor: { "default": "var(--color-fg-default)" },
    },
  },
} as Config;
