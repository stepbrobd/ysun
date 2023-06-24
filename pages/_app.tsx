import "styles/tailwind.css";

import { AppProps } from "next/app";
import { Inter, JetBrains_Mono, Tinos } from "next/font/google";
import Script from "next/script";

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

      <Script
        defer
        id="heap-analytics"
        strategy="afterInteractive"
        data-domain="ysun.co"
      >
        {`window.heap=window.heap||[],heap.load=function(e,t){window.heap.appid=e,window.heap.config=t=t||{};var r=document.createElement("script");r.type="text/javascript",r.async=!0,r.src="https://cdn.heapanalytics.com/js/heap-"+e+".js";var a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(r,a);for(var n=function(e){return function(){heap.push([e].concat(Array.prototype.slice.call(arguments,0)))}},p=["addEventProperties","addUserProperties","clearEventProperties","identify","resetIdentity","removeEventProperty","setEventProperties","track","unsetEventProperty"],o=0;o<p.length;o++)heap[p[o]]=n(p[o])};heap.load("4225002481");`}
      </Script>
    </>
  );
}
