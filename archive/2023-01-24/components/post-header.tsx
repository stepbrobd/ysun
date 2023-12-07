import Avatar from "components/author-avatar";
import CoverImage from "components/cover-image";
import Date from "components/post-date";
import PostTitle from "components/post-title";
import type { Post } from "lib/sanity.queries";

export default function PostHeader(
  props: Pick<
    Post,
    | "title"
    | "coverImage"
    | "initialPostDate"
    | "lastModifiedDate"
    | "author"
    | "slug"
  >,
) {
  const { title, coverImage, initialPostDate, lastModifiedDate, author, slug } = props;
  return (
    <>
      <PostTitle>{title}</PostTitle>
      <div className="hidden md:mb-12 md:block">
        {author && <Avatar name={author.name} picture={author.picture} />}
      </div>
      <div className="mb-8 sm:mx-0 md:mb-16">
        <CoverImage title={title} image={coverImage} priority slug={slug} />
      </div>
      <div className="mx-auto max-w-2xl">
        <div className="mb-6 block md:hidden">
          {author && <Avatar name={author.name} picture={author.picture} />}
        </div>
        <div className="mb-6 text-lg">
          <Date dateString={initialPostDate} />
          <Date dateString={lastModifiedDate} />
        </div>
      </div>
    </>
  );
}
