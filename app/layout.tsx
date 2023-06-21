import "tailwindcss/tailwind.css";

import { Inter, JetBrains_Mono, Tinos } from "next/font/google";

const serif = Tinos({
    weight: ["400", "700"],
    subsets: ["latin", "latin-ext"],
    variable: "--font-tinos",
    display: "swap",
});
const sans = Inter({
    weight: ["400", "700"],
    subsets: ["latin", "latin-ext"],
    variable: "--font-inter",
    display: "swap",
});
const mono = JetBrains_Mono({
    weight: ["400", "700"],
    subsets: ["latin", "latin-ext"],
    variable: "--font-jetbrains-mono",
    display: "swap",
});

export default async function RootLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <html
            lang="en"
            className={`${mono.variable} ${sans.variable} ${serif.variable}`}
        >
            <body>{children}</body>
        </html>
    );
}
