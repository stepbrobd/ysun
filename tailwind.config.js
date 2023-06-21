const { theme } = require("@sanity/demo/tailwind");

/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./app/**/*.{js,ts,jsx,tsx}",
        "./components/**/*.{js,ts,jsx,tsx}",
    ],
    theme: {
        ...theme,
        fontFamily: {
            serif: ["var(--font-tinos)"],
            sans: ["var(--font-inter)"],
            mono: ["var(--font-jetbrains-mono)"],
        },
    },
    plugins: [require("@tailwindcss/typography")],
};
