import { cwd } from "!lib/page/cwd.ts";
import { get } from "!lib/page/get.ts";
import { type Page } from "!lib/page/type.ts";
import { walk } from "$std/fs/walk.ts";
import { join } from "$std/path/join.ts";

const list = async (): Promise<Page[]> => {
  const path = join(cwd, "static/txts");
  const promises = [];
  for await (const entry of walk(path, { exts: ["md"] })) {
    if (!entry.isDirectory) {
      promises.push(get(entry.path));
    }
  }
  const paged = await Promise.all(promises) as Page[];
  paged.sort((a, b) => b.date.getTime() - a.date.getTime());
  return paged;
};

export { list };
