import { groq } from "next-sanity";

export const regionQuery = groq`
  *[_type == "region"]{
    _id,
    region,
    az,
    rl,
`;
