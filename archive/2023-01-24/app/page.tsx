import IndexPage from "components/index-page";
import PreviewIndexPage from "components/preview-index-page";
import { PreviewSuspense } from "components/preview-suspense";
import { getAllPosts, getSettings } from "lib/sanity.client";
import { previewData } from "next/headers";

export default async function IndexRoute() {
  const [settings, posts] = await Promise.all([getSettings(), getAllPosts()]);

  if (previewData()) {
    const token = previewData().token || null;

    return (
      <PreviewSuspense
        fallback={
          <IndexPage loading preview posts={posts} settings={settings} />
        }
      >
        <PreviewIndexPage token={token} />
      </PreviewSuspense>
    );
  }

  return <IndexPage posts={posts} settings={settings} />;
}
