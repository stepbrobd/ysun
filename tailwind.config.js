/** @type {import("tailwindcss").Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  darkMode: "class",
  theme: {
    fontFamily: {
      serif: ["var(--font-tinos)"],
      sans: ["var(--font-inter)"],
      mono: ["var(--font-jetbrains-mono)"],
    },
  },
  plugins: [],
};
