import Meta from "components/meta";
import * as defaultData from "lib/default.data";
import { getPostBySlug, getSettings } from "lib/sanity.client";
import { urlForImage } from "lib/sanity.image";

export default async function SlugHead({
  params,
}: {
  params: { slug: string };
}) {
  const [{ title = defaultData.title }, post] = await Promise.all([
    getSettings(),
    getPostBySlug(params.slug),
  ]);
  return (
    <>
      <Meta />
      <title>{post.title ? `${post.title} | ${title}` : title}</title>
      {post.coverImage?.asset?._ref && (
        <meta
          property="og:image"
          content={urlForImage(post.coverImage)
            .width(1200)
            .height(627)
            .fit("crop")
            .url()}
        />
      )}
    </>
  );
}
