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
      <span className="block mb-4">
        <LaTeX body={value.body} />
      </span>
    );
};

const PostCode = ({ value }) => {
  return (
    <span className="block mb-4">
      {" "}
      <Code language={value.language} code={value.code} />
    </span>
  );
};

const PostImage = ({ value }) => {
  const { width, height } = getImageDimensions(value);
  return (
    <span className="block mb-4">
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
    <span className="block mb-4">
      {" "}
      <Link href={urlForAsset(value)}>{value.name}</Link>
    </span>
  );
};

const PostVideo = ({ value }) => {
  return (
    <span className="block mb-4">
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
      <blockquote className="text blockquote mb-4 bg-action">
        {props.children}
      </blockquote>
    ),
    h1: (props) => (
      <h1 className="heading text text-6xl mt-16 mb-4">
        <Balancer>{props.children}</Balancer>
      </h1>
    ),
    h2: (props) => (
      <h2 className="heading text text-5xl mt-12 mb-4">
        <Balancer>{props.children}</Balancer>
      </h2>
    ),
    h3: (props) => (
      <h3 className="heading text text-4xl mt-8 mb-4">
        <Balancer>{props.children}</Balancer>
      </h3>
    ),
    h4: (props) => (
      <h4 className="heading text text-3xl mt-6 mb-4">
        <Balancer>{props.children}</Balancer>
      </h4>
    ),
    h5: (props) => (
      <h5 className="heading text text-2xl mt-5 mb-4">
        <Balancer>{props.children}</Balancer>
      </h5>
    ),
    h6: (props) => (
      <h6 className="heading text text-xl mt-4 mb-4">
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
      <ul className="list-disc pl-8 mb-4">{props.children}</ul>
    ),
    number: (props) => (
      <ol className="list-decimal pl-8 mb-4">{props.children}</ol>
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
