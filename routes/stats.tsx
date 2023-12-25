import { Layout } from "!components/layout.tsx";
import { JSX } from "preact/jsx-runtime";

const page = (): JSX.Element => {
  return (
    <Layout title="Stats" description="Visitor stats tracked by self-hosted Plausible Analytics">
      <div class="markdown-body">
        <h1>Stats</h1>
        <iframe
          plausible-embed
          src="https://stats.ysun.co/share/ysun.co?auth=klGcRmSwwwUUJfBM1R1MB&embed=true&theme=system&background=transparent"
          scrolling="no"
          loading="lazy"
          class="min-w-full min-h-screen border-0"
          title="Plausible Analytics"
        >
        </iframe>
        <script async src="https://stats.ysun.co/js/embed.host.js"></script>
      </div>
    </Layout>
  );
};

export default page;
