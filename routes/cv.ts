import { FreshContext, RouteConfig } from "$fresh/server.ts";

const config: RouteConfig = {
  routeOverride: "/(pdfs)?/cv(.pdf)?",
};

const handler = async (_req: Request, _ctx: FreshContext): Promise<Response> => {
  if (_ctx.url.pathname != "/pdfs/cv.pdf") return Response.redirect(_ctx.url.origin + "/pdfs/cv.pdf", 308);
  try {
    const res = await fetch("https://api.github.com/repos/stepbrobd/cv/releases/latest");
    const jsn = await res.json();
    const url = jsn.assets[0].browser_download_url;
    const pdf = await (await fetch(url)).arrayBuffer();
    return new Response(pdf, {
      headers: {
        "Content-Type": "application/pdf",
        "Content-Disposition": "inline; filename=cv.pdf",
      },
    });
  } catch (err) {
    return new Response(
      "When fetching the latest CV release from GitHub: " + err,
      { status: 500 },
    );
  }
};

export { config, handler };
