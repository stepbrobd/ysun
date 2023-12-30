import { FreshContext } from "$fresh/server.ts";

const src: Record<string, string> = {
  "/bluesky": "https://bsky.app/profile/ysun.co",
  "/bsky": "https://bsky.app/profile/ysun.co",
  "/github": "https://github.com/stepbrobd",
  "/instagram": "https://www.instagram.com/stepbrobd",
  "/linkedin": "https://www.linkedin.com/in/yifei-s",
  "/threads": "https://threads.net/@stepbrobd",
  "/twitter": "https://twitter.com/stepbrobd",
  "/vault": "https://vault.ysun.co",
  "/world": "https://world.hey.com/ysun",
  "/x": "https://x.com/stepbrobd",
  "/youtube": "https://www.youtube.com/@stepbrobd",
};

const handler = async (_req: Request, _ctx: FreshContext): Promise<Response> => {
  // domain redirect
  if (_ctx.url.hostname !== "localhost" && _ctx.url.hostname !== "ysun.co") {
    // as10779.net
    if (
      _ctx.url.hostname.includes("as10779.net") &&
      _ctx.url.pathname !== "/geofeed" &&
      _ctx.url.pathname !== "/geofeed.csv"
    ) {
      return Response.redirect("https://ysun.co/2023/09/as10779", 308);
    }
    // metaprocessor.org
    if (_ctx.url.hostname.includes("metaprocessor.org")) {
      return Response.redirect("https://ysun.co/2023/05/metaprocessor", 308);
    }
    // xdg.sh
    if (_ctx.url.hostname.includes("xdg.sh")) {
      return Response.redirect("https://ysun.co/2023/04/xdg", 308);
    }
    // default
    return Response.redirect(_ctx.url.href.replace(_ctx.url.hostname, "ysun.co"), 308);
  }

  // path redirect
  const dst = src[_ctx.url.pathname];
  if (dst) return Response.redirect(dst, 308);
  else return await _ctx.next();
};

export { handler };
