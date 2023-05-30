import "../styles/tailwind.css";

import { AppProps } from "next/app";
import { Analytics } from "@vercel/analytics/react";
import { ThemeProvider } from "next-themes";
import Script from "next/script";
import NextNProgress from "nextjs-progressbar";
import Layout from "../components/layout";

const App = ({ Component, pageProps }: AppProps) => {
  return (
    <>
      <>
        <ThemeProvider
          attribute="class"
          defaultTheme="light"
          disableTransitionOnChange
        >
          <NextNProgress
            color="#f81ce5"
            height={2}
            nonce=""
            startPosition={0.1}
            stopDelayMs={250}
            showOnShallow={true}
            options={{ showSpinner: false, easing: "ease", speed: 250 }}
          />
          <Layout>
            <Component {...pageProps} />
          </Layout>
        </ThemeProvider>
      </>
      <>
        <Analytics />
        <Script
          defer
          id="plausible-analytics"
          strategy="afterInteractive"
          data-domain="yifei.md"
          src={"https://plausible.io/js/plausible.js"}
        />
        <Script defer id="heap-analytics" strategy="afterInteractive">
          {`window.heap=window.heap||[],heap.load=function(e,t){window.heap.appid=e,window.heap.config=t=t||{};var r=document.createElement("script");r.type="text/javascript",r.async=!0,r.src="https://cdn.heapanalytics.com/js/heap-"+e+".js";var a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(r,a);for(var n=function(e){return function(){heap.push([e].concat(Array.prototype.slice.call(arguments,0)))}},p=["addEventProperties","addUserProperties","clearEventProperties","identify","resetIdentity","removeEventProperty","setEventProperties","track","unsetEventProperty"],o=0;o<p.length;o++)heap[p[o]]=n(p[o])};
          heap.load("4225002481");`}
        </Script>
      </>
    </>
  );
};

export default App;
