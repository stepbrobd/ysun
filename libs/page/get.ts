import { cwd } from "!libs/page/cwd.ts";
import { type Page } from "!libs/page/type.ts";
import { extract } from "$std/front_matter/any.ts";
import { join } from "$std/path/join.ts";

const get = async (path: string): Promise<Page> => {
  const text = await Deno.readTextFile(path);
  const { attrs, body } = extract(text);
  return {
    path: path
      .replace(join(cwd, "static"), ""),
    slug: path
      .replace(join(cwd, "static/txts"), "")
      .replace(".md", "")
      .replace(/index$/, ""),
    title: attrs.title as string,
    description: attrs.description as string,
    date: new Date(attrs.date as string),
    tags: attrs.tags as string[],
    image: attrs.image as string,
    body: body,
  };
};

export { get };
