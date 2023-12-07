import PostPage from "components/post-page";
import PreviewPostPage from "components/preview-post-page";
import { PreviewSuspense } from "components/preview-suspense";
import { getAllPostsSlugs, getPostAndMoreStories, getSettings } from "lib/sanity.client";
import { previewData } from "next/headers";

export async function generateStaticParams() {
  return await getAllPostsSlugs();
}

export default async function SlugRoute({
  params,
}: {
  params: { slug: string };
}) {
  // Start fetching settings early, so it runs in parallel with the post query
  const settings = getSettings();

  if (previewData()) {
    const token = previewData().token || null;
    const data = getPostAndMoreStories(params.slug, token);
    return (
      <PreviewSuspense
        fallback={
          <PostPage
            loading
            preview
            data={await data}
            settings={await settings}
          />
        }
      >
        <PreviewPostPage token={token} slug={params.slug} />
      </PreviewSuspense>
    );
  }

  const data = getPostAndMoreStories(params.slug);
  return <PostPage data={await data} settings={await settings} />;
}
