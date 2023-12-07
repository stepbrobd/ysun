import { FreshContext, RouteConfig } from "$fresh/server.ts";

const config: RouteConfig = {
  routeOverride: "/geofeed(.csv)?",
};

const geofeed = [
  {
    prefix: "23.161.104.0/25",
    country: "US",
    region: "US-MA",
    city: "Boston",
    postal: "02115",
  },
  {
    prefix: "23.161.104.128/28",
    country: "US",
    region: "US-VA",
    city: "Ashburn",
    postal: "20147",
  },
  {
    prefix: "23.161.104.144/28",
    country: "US",
    region: "US-IA",
    city: "Council Bluffs",
    postal: "51501",
  },
  {
    prefix: "23.161.104.160/28",
    country: "US",
    region: "US-CA",
    city: "Los Angeles",
    postal: "90012",
  },
  {
    prefix: "23.161.104.176/28",
    country: "CH",
    region: "CH-ZH",
    city: "Zurich",
    postal: "8001",
  },
  {
    prefix: "23.161.104.192/28",
    country: "FR",
    region: "FR-IDF",
    city: "Paris",
    postal: "75001",
  },
  {
    prefix: "23.161.104.208/28",
    country: "JP",
    region: "JP-13",
    city: "Tokyo",
    postal: "100-0001",
  },
  {
    prefix: "23.161.104.224/28",
    country: "CN",
    region: "CN-HK",
    city: "Hong Kong",
    postal: "000",
  },
  {
    prefix: "23.161.104.240/28",
    country: "IN",
    region: "IN-MH",
    city: "Mumbai",
    postal: "400001",
  },
  {
    prefix: "2620:BE:A000::/48",
    country: "US",
    region: "US-MA",
    city: "Boston",
    postal: "02115",
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
