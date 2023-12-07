import Container from "components/blog-container";
import BlogHeader from "components/blog-header";
import Layout from "components/blog-layout";
import MoreStories from "components/more-stories";
import PostBody from "components/post-body";
import PostHeader from "components/post-header";
import PostTitle from "components/post-title";
import SectionSeparator from "components/section-separator";
import * as defaultData from "lib/default.data";
import type { Post, Settings } from "lib/sanity.queries";
import { notFound } from "next/navigation";

export default function PostPage(props: {
  preview?: boolean;
  loading?: boolean;
  data: { post: Post; morePosts: Post[] };
  settings: Settings;
}) {
  const { preview, loading, data, settings } = props;
  const { post = {} as any, morePosts = [] } = data || {};
  const { title = defaultData.title } = settings || {};

  const slug = post?.slug;

  if (!slug && !preview) {
    notFound();
  }

  return (
    <Layout preview={preview} loading={loading}>
      <Container>
        <BlogHeader title={title} level={2} />
        {preview && !post ? <PostTitle>Loading…</PostTitle> : (
          <>
            <article>
              <PostHeader
                title={post.title}
                coverImage={post.coverImage}
                initialPostDate={post.initialPostDate}
                lastModifiedDate={post.lastModifiedDate}
                author={post.author}
              />
              <PostBody content={post.content} />
            </article>
            <SectionSeparator />
            {morePosts?.length > 0 && <MoreStories posts={morePosts} />}
          </>
        )}
      </Container>
    </Layout>
  );
}
