import { PortableText } from "@portabletext/react";
import { getImageDimensions } from "@sanity/asset-utils";
import Code from "components/code";
import Image from "components/image";
import LaTeX from "components/latex";
import Link from "components/link";
import Video from "components/video";
import { urlForAsset } from "lib/sanity.asset";
import { urlForImage } from "lib/sanity.image";
import Balancer from "react-wrap-balancer";

const PostLaTeX = ({ value }) => {
  const isInline = !value.body.split("\n")[0].includes("block");
  if (isInline) {
    return <LaTeX body={value.body} />;
  } else
    return (
      <span className="mb-4 block">
        <LaTeX body={value.body} />
      </span>
    );
};

const PostCode = ({ value }) => {
  return (
    <span className="mb-4 block">
      {" "}
      <Code language={value.language} code={value.code} />
    </span>
  );
};

const PostImage = ({ value }) => {
  const { width, height } = getImageDimensions(value);
  return (
    <span className="mb-4 block">
      {" "}
      <Image
        src={urlForImage(value).url()}
        alt={value.alt}
        width={width}
        height={height}
        lqip={value.lqip}
      />
    </span>
  );
};

const PostLink = ({ value }) => {
  return (
    <span className="mb-4 block">
      {" "}
      <Link href={urlForAsset(value)}>{value.name}</Link>
    </span>
  );
};

const PostVideo = ({ value }) => {
  return (
    <span className="mb-4 block">
      {" "}
      <Video title={value.title} payload={value.payload} />
    </span>
  );
};

const components = {
  types: {
    latex: PostLaTeX,
    code: PostCode,
    image: PostImage,
    file: PostLink,
    video: PostVideo,
  },

  block: {
    normal: (props) => <p className="text mb-4">{props.children}</p>,
    blockquote: (props) => (
      <blockquote className="text blockquote bg-action mb-4">
        {props.children}
      </blockquote>
    ),
    h1: (props) => (
      <h1 className="heading text mb-4 mt-16 text-6xl">
        <Balancer>{props.children}</Balancer>
      </h1>
    ),
    h2: (props) => (
      <h2 className="heading text mb-4 mt-12 text-5xl">
        <Balancer>{props.children}</Balancer>
      </h2>
    ),
    h3: (props) => (
      <h3 className="heading text mb-4 mt-8 text-4xl">
        <Balancer>{props.children}</Balancer>
      </h3>
    ),
    h4: (props) => (
      <h4 className="heading text mb-4 mt-6 text-3xl">
        <Balancer>{props.children}</Balancer>
      </h4>
    ),
    h5: (props) => (
      <h5 className="heading text mb-4 mt-5 text-2xl">
        <Balancer>{props.children}</Balancer>
      </h5>
    ),
    h6: (props) => (
      <h6 className="heading text mb-4 mt-4 text-xl">
        <Balancer>{props.children}</Balancer>
      </h6>
    ),
  },

  marks: {
    em: (props) => <em className="italic">{props.children}</em>,
    strong: (props) => <strong className="font-bold">{props.children}</strong>,
    code: (props) => <code className="code">{props.children}</code>,
    underline: (props) => <u>{props.children}</u>,
    "strike-through": (props) => (
      <s className="line-through">{props.children}</s>
    ),
    internalLink: (props) => (
      <Link href={props.value.slug.current}>{props.children}</Link>
    ),
    externalLink: (props) => (
      <Link href={props.value.href} newTab={props.value.blank}>
        {props.children}
      </Link>
    ),
  },

  list: {
    bullet: (props) => (
      <ul className="mb-4 list-disc pl-8">{props.children}</ul>
    ),
    number: (props) => (
      <ol className="mb-4 list-decimal pl-8">{props.children}</ol>
    ),
  },

  listItem: {
    bullet: (props) => <li className="text mb-2">{props.children}</li>,
    number: (props) => <li className="text mb-2">{props.children}</li>,
  },
};

export default function PostBody({ content }) {
  return (
    <div className="mx-auto max-w-2xl">
      <PortableText value={content} components={components} />
    </div>
  );
}
