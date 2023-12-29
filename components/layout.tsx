import { Header } from "!components/header.tsx";
import { Footer } from "!components/footer.tsx";
import { Head } from "$fresh/runtime.ts";
import { JSX } from "preact/jsx-runtime";

const Layout = (
  { title, description, children }: { title: string; description: string; children: JSX.Element },
): JSX.Element => {
  return (
    <>
      <Head>
        <title>{title}</title>
        <meta name="description" content={description} />
      </Head>

      <Header />

      <main class="container py-4 border-y border-[#d8dee4] dark:border-[#21262d]">
        {children}
      </main>

      <Footer />
    </>
  );
};

export { Layout };
