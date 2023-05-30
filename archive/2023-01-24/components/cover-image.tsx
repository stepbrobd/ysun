import cn from "classnames";
import Image from "components/image";
import { urlForImage } from "lib/sanity.image";
import Link from "next/link";

interface CoverImageProps {
  title: string;
  slug?: string;
  image: any;
  priority?: boolean;
}

export default function CoverImage(props: CoverImageProps) {
  const { title, slug, image: source, priority } = props;
  const coverImage = (
    <Image
      imageOnly
      className="h-auto w-full rounded-md"
      src={urlForImage(source).height(1000).width(2000).url()}
      width={2000}
      height={1000}
      alt={`Cover Image for ${title}`}
      lqip={props.image.lqip}
      sizes="100vw"
      priority={priority}
    />
  );
  return (
    <div className="sm:mx-0">
      {slug ? (
        <Link href={`/blog/${slug}`} aria-label={title}>
          {coverImage}
        </Link>
      ) : (
        coverImage
      )}
    </div>
  );
}
