import { FreshContext } from "$fresh/server.ts";

const src: Record<string, string> = {
  "/bluesky": "https://bsky.app/profile/ysun.co",
  "/bsky": "https://bsky.app/profile/ysun.co",
  "/github": "https://github.com/stepbrobd",
  "/instagram": "https://www.instagram.com/stepbrobd",
  "/linkedin": "https://www.linkedin.com/in/yifei-s",
  "/orcid": "https://orcid.org/0000-0002-1591-7458",
  "/osu": "https://osu.ppy.sh/users/stepbrobd",
  "/rss": "https://prose.ysun.co/rss",
  "/scholar": "https://scholar.google.com/citations?user=TIVaLaMAAAAJ",
  "/threads": "https://threads.net/@stepbrobd",
  "/twitter": "https://twitter.com/stepbrobd",
  "/world": "https://world.hey.com/ysun",
  "/x": "https://x.com/stepbrobd",
  "/youtube": "https://www.youtube.com/@stepbrobd",
};

const handler = async (_req: Request, _ctx: FreshContext): Promise<Response> => {
  const dst = src[_ctx.url.pathname];
  if (dst) return Response.redirect(dst, 308);
  else return await _ctx.next();
};

export { handler };
