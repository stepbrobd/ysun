import { type Page } from "!libs/page/type.ts";
import { extract } from "$std/front_matter/any.ts";
import { join } from "$std/path/join.ts";

const get = async (path: string): Promise<Page> => {
  const text = await Deno.readTextFile(path);
  const { attrs, body } = extract(text);
  return {
    path: path
      .replace(join(Deno.cwd(), "static"), ""),
    slug: path
      .replace(join(Deno.cwd(), "static/contents"), "")
      .replace(".md", "")
      .replace(/index$/, ""),
    title: attrs.title as string,
    description: attrs.description as string,
    modified: new Date(attrs.modified as string),
    content: body,
  };
};

export { get };
