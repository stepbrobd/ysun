import { default as NextImage } from "next/image";

type ImageProps = {
  src: string;
  alt: string;
  width: number;
  height: number;
  sizes?: string;
  lqip: string;
  priority?: boolean;
  imageOnly?: boolean;
  className?: string;
  disableBlur?: boolean;
};

const Image = ({
  src,
  alt,
  width,
  height,
  sizes,
  lqip,
  priority,
  imageOnly,
  className,
  disableBlur,
}: ImageProps) => {
  return (
    <span className="z-0 block">
      <span className="z-10 block min-w-full rounded-md text-center">
        <NextImage
          className={className || "rounded-md"}
          src={src}
          alt={alt}
          width={width}
          height={height}
          sizes={sizes}
          quality={75}
          placeholder={disableBlur ? "empty" : "blur"}
          blurDataURL={disableBlur ? undefined : lqip}
          loading={priority ? undefined : "lazy"}
          priority={priority}
        />
      </span>
      {!imageOnly && (
        <span className="flex items-center justify-center px-4 pt-4 text-sm
                  text-neutral-600 dark:text-neutral-400">
          <span>Image: {alt}</span>
        </span>
      )}
    </span>
  );
};

export default Image;
