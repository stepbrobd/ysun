import ColorScheme from "components/color-scheme";

const Meta = () => {
  return (
    <>
      <meta name="viewport" content="width=device-width,initial-scale=1.0" />
      <meta property="og:locale" content="en_US" />
      <meta property="og:type" content="website" />
      <meta property="robots" content="index, follow" />
      <link
        rel="apple-touch-icon"
        sizes="180x180"
        href="/favicon/apple-touch-icon.png"
      />
      <link
        rel="icon"
        type="image/png"
        sizes="32x32"
        href="/favicon/favicon-32x32.png"
      />
      <link
        rel="icon"
        type="image/png"
        sizes="16x16"
        href="/favicon/favicon-16x16.png"
      />
      <link rel="shortcut icon" href="/favicon/favicon.ico" />
      <ColorScheme />
    </>
  );
};

export default Meta;
