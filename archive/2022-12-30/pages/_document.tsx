import { Head, Html, Main, NextScript } from "next/document";

const Document = () => {
  return (
    <Html lang="en-US">
      <Head>
        <meta charSet="UTF-8" />
        <link
          href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
          rel="stylesheet"
        />
      </Head>
      <body>
        <Main />
        <NextScript />
      </body>
    </Html>
  );
};

export default Document;
