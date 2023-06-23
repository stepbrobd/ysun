import "styles/tailwind.css";

import { AppProps } from "next/app";
import Script from "next/script";

import { Inter, JetBrains_Mono, Tinos } from "next/font/google";

const serif = Tinos({
  preload: true,
  weight: ["400", "700"],
  subsets: ["latin", "latin-ext"],
  variable: "--font-tinos",
  display: "swap",
});
const sans = Inter({
  preload: true,
  weight: ["400", "700"],
  subsets: ["latin", "latin-ext"],
  variable: "--font-inter",
  display: "swap",
});
const mono = JetBrains_Mono({
  preload: true,
  weight: ["400", "700"],
  subsets: ["latin", "latin-ext"],
  variable: "--font-jetbrains-mono",
  display: "swap",
});

export default function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <main className={`${mono.variable} ${sans.variable} ${serif.variable}`}>
        <Component {...pageProps} />
      </main>
      <Script
        defer
        id="plausible-analytics"
        strategy="afterInteractive"
        data-domain="ysun.co"
        src="https://plausible.io/js/script.js"
      />
    </>
  );
}
