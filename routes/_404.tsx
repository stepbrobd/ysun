import { Layout } from "!components/layout.tsx";
import { JSX } from "preact/jsx-runtime";

const page = (): JSX.Element => {
  return (
    <Layout title="Not Found" description="The page you were looking for doesn't exist.">
      <div class="markdown-body">
        <h1>Not Found</h1>
        <p>The page you are looking for doesn't exist.</p>
      </div>
    </Layout>
  );
};

export default page;
