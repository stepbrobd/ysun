import Avatar from "components/author-avatar";
import CoverImage from "components/cover-image";
import Date from "components/post-date";
import type { Post } from "lib/sanity.queries";
import Link from "next/link";

export default function PostPreview({
  title,
  coverImage,
  initialPostDate,
  lastModifiedDate,
  excerpt,
  author,
  slug,
}: Omit<Post, "_id">) {
  return (
    <div>
      <div className="mb-5">
        <CoverImage
          slug={slug}
          title={title}
          image={coverImage}
          priority={false}
        />
      </div>
      <h3 className="mb-3 text-3xl leading-snug">
        <Link href={`/blog/${slug}`} className="hover:underline">
          {title}
        </Link>
      </h3>
      <div className="mb-4 text-lg">
        <Date dateString={initialPostDate} />
      </div>
      <div className="mb-4 text-lg">
        <Date dateString={lastModifiedDate} />
      </div>
      {excerpt && <p className="mb-4 text-lg leading-relaxed">{excerpt}</p>}
      {author && <Avatar name={author.name} picture={author.picture} />}
    </div>
  );
}
