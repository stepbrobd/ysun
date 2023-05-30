import Image from "components/image";
import { urlForImage } from "lib/sanity.image";
import type { Author } from "lib/sanity.queries";

export default function AuthorAvatar(props: Author) {
  const { name, picture, preview } = props;
  return (
    <div className="flex items-center">
      <div className="relative mr-4 h-12 w-12">
        <Image
          className="rounded-full"
          src={urlForImage(picture).height(96).width(96).fit("crop").url()}
          height={96}
          width={96}
          alt={`Avatar for ${name}`}
          disableBlur={preview}
          lqip={picture.lqip}
          imageOnly={true}
        />
      </div>
      <div className="text-xl font-bold">{name}</div>
    </div>
  );
}
