import Container from "components/blog-container";
import BlogHeader from "components/blog-header";
import Layout from "components/blog-layout";
import HeroPost from "components/hero-post";
import MoreStories from "components/more-stories";
import * as defaultData from "lib/default.data";
import type { Post, Settings } from "lib/sanity.queries";

export default function IndexPage(props: {
  preview?: boolean;
  loading?: boolean;
  posts: Post[];
  settings: Settings;
}) {
  const { preview, loading, posts, settings } = props;
  const [heroPost, ...morePosts] = posts || [];
  const { title = defaultData.title, description = defaultData.description } = settings || {};

  return (
    <>
      <Layout preview={preview} loading={loading}>
        <Container>
          <BlogHeader title={title} description={description} level={1} />
          {heroPost && (
            <HeroPost
              title={heroPost.title}
              coverImage={heroPost.coverImage}
              initialPostDate={heroPost.initialPostDate}
              lastModifiedDate={heroPost.lastModifiedDate}
              author={heroPost.author}
              slug={heroPost.slug}
              excerpt={heroPost.excerpt}
            />
          )}
          {morePosts.length > 0 && <MoreStories posts={morePosts} />}
        </Container>
      </Layout>
    </>
  );
}
