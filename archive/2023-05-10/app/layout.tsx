import "./globals.css";
import { Tinos, Inter, JetBrains_Mono } from "next/font/google";
import { ClientProviders } from "@/app/client-providers";
import { ServerProviders } from "@/app/server-providers";
import { Analytics } from "@/app/analytics";

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

export const metadata = {
    title: {
        default: "Yifei Sun",
        template: "%s - Yifei Sun",
    },
    description: "Yifei Sun's homepage",
    themeColor: [
        { media: "(prefers-color-scheme: light)", color: "#ffffff" },
        { media: "(prefers-color-scheme: dark)", color: "#000000" },
    ],
    robots: {
        index: true,
        follow: true,
    },
};

const Layout = ({ children }: { children: React.ReactNode }) => {
    return (
        <ServerProviders>
            <html lang="en" className={`${serif.variable} ${sans.variable} ${mono.variable}`}>
                <body>
                    <ClientProviders>{children}</ClientProviders>
                    <Analytics />
                </body>
            </html>
        </ServerProviders>
    );
};

export default Layout;
