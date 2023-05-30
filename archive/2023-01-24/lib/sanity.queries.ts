import { groq } from "next-sanity";

const postFields = groq`
  _id,
  title,
  "slug": slug.current,
  initialPostDate,
  lastModifiedDate,
  excerpt,
  "coverImage": coverImage{
    "lqip": asset->metadata.lqip,
    ...
  },
  "author": author->{
    name,
    picture{
      "lqip": asset->metadata.lqip,
      ...
    }
  }
`;

const contentFields = groq`
"content": content [] {
  _type == "image" => {
  "lqip": asset->metadata.lqip,
  ...
  },
  _type == "video" => {
    "payload": asset.asset->,
    ...
  },
  ...
}
`;

export const settingsQuery = groq`*[_type == "settings"][0]`;

export const indexQuery = groq`
*[_type == "post"] | order(lastModifiedDate desc, _updatedAt desc) {
  ${postFields}
}`;

export const postAndMoreStoriesQuery = groq`
{
  "post": *[_type == "post" && slug.current == $slug] | order(_updatedAt desc) [0] {
    ${contentFields},
    ${postFields}
  },
  "morePosts": *[_type == "post" && slug.current != $slug] | order(lastModifiedDate desc, _updatedAt desc) [0...2] {
    ${contentFields},
    ${postFields}
  }
}`;

export const postSlugsQuery = groq`
*[_type == "post" && defined(slug.current)][].slug.current
`;

export const postBySlugQuery = groq`
*[_type == "post" && slug.current == $slug][0] {
  ${postFields}
}
`;

export interface Author {
  name?: string;
  picture?: any;
  preview?: boolean;
}

export interface Post {
  _id: string;
  title?: string;
  slug?: string;
  initialPostDate?: string;
  lastModifiedDate?: string;
  excerpt?: string;
  coverImage?: any;
  author?: Author;
  content?: any;
}

export interface Settings {
  title?: string;
  description?: any[];
  ogImage?: {
    title?: string;
  };
}
