import { Layout } from "!components/layout.tsx";
import { PageProps } from "$fresh/server.ts";
import { JSX } from "preact/jsx-runtime";

const page = ({ error }: PageProps): JSX.Element => {
  return (
    <Layout title="Internal Server Error" description="The page you were looking for caused an internal server error.">
      <div class="markdown-body">
        <h1>Internal Server Error</h1>
        <p>The page you were looking for caused an internal server error.</p>
        <pre>{(error as Error).message}</pre>
      </div>
    </Layout>
  );
};

export default page;
