import { FreshContext, RouteConfig } from "$fresh/server.ts";

const config: RouteConfig = {
  routeOverride: "/geofeed(.csv)?",
};

const geofeed = [
  {
    prefix: "23.161.104.0/24",
    country: "CH",
    region: "CH-ZH",
    city: "Zurich",
    postal: "8001",
  },
  {
    prefix: "2620:BE:A000::/48",
    country: "CH",
    region: "CH-ZH",
    city: "Zurich",
    postal: "8001",
  },
];

const handler = (_req: Request, _ctx: FreshContext): Response => {
  return new Response(
    geofeed.map(
      (d) => `${d.prefix},${d.country},${d.region},${d.city},${d.postal}`,
    ).join("\n"),
    { headers: { "Content-Type": "text/csv" } },
  );
};

export { config, handler };
