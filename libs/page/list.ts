import { get } from "!libs/page/get.ts";
import { type Page } from "!libs/page/type.ts";
import { walk } from "$std/fs/walk.ts";
import { join } from "$std/path/join.ts";

const list = async (): Promise<Page[]> => {
  const path = join(Deno.cwd(), "static/contents");
  const promises = [];
  for await (const entry of walk(path, { exts: ["md"] })) {
    if (entry.isFile) {
      promises.push(get(entry.path));
    }
  }
  const paged = await Promise.all(promises) as Page[];
  paged.sort((a, b) => b.modified.getTime() - a.modified.getTime());
  return paged;
};

export { list };