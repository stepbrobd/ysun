import Meta from "components/meta";
import MetaDescription from "components/meta-description";
import * as defaultData from "lib/default.data";
import { getSettings } from "lib/sanity.client";

export default async function PageHead() {
  const {
    title = defaultData.title,
    description = defaultData.description,
    ogImage = {},
  } = await getSettings();
  const ogImageTitle = ogImage?.title || defaultData.ogImageTitle;

  return (
    <>
      <Meta />
      <title>{title}</title>
      <MetaDescription value={description} />
      <meta
        property="og:image"
        // Because OG images must have a absolute URL, we use the
        // `VERCEL_URL` environment variable to get the deployment’s URL.
        // More info:
        // https://vercel.com/docs/concepts/projects/environment-variables
        content={`${process.env.VERCEL_URL ? "https://" + process.env.VERCEL_URL : ""}/api/og?${new URLSearchParams({
          title: ogImageTitle,
        })}`}
      />
    </>
  );
}
