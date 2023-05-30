import AuthorAvatar from "components/author-avatar";
import CoverImage from "components/cover-image";
import Date from "components/post-date";
import type { Post } from "lib/sanity.queries";
import Link from "next/link";

export default function HeroPost(
  props: Pick<
    Post,
    | "title"
    | "coverImage"
    | "initialPostDate"
    | "lastModifiedDate"
    | "excerpt"
    | "author"
    | "slug"
  >
) {
  const {
    title,
    coverImage,
    initialPostDate,
    lastModifiedDate,
    excerpt,
    author,
    slug,
  } = props;
  return (
    <section>
      <div className="mb-8 md:mb-16">
        <CoverImage slug={slug} title={title} image={coverImage} priority />
      </div>
      <div className="mb-20 md:mb-28 md:grid md:grid-cols-2 md:gap-x-16 lg:gap-x-8">
        <div>
          <h3 className="mb-4 text-4xl leading-tight lg:text-6xl">
            <Link href={`/blog/${slug}`} className="hover:underline">
              {title || "Untitled"}
            </Link>
          </h3>
          <div className="mb-4 text-lg md:mb-0">
            <Date dateString={initialPostDate} />
            <Date dateString={lastModifiedDate} />
          </div>
        </div>
        <div>
          {excerpt && <p className="mb-4 text-lg leading-relaxed">{excerpt}</p>}
          {author && (
            <AuthorAvatar name={author.name} picture={author.picture} />
          )}
        </div>
      </div>
    </section>
  );
}
