import { MetadataRoute } from "next";

const robots = (): MetadataRoute.Robots => ({
  rules: {
    userAgent: "*",
    allow: "/",
  },

  sitemap: process.env.VERCEL_URL
    ? `https://${process.env.VERCEL_URL}/sitemap.xml`
    : `http://localhost:${process.env.PORT || 3000}/sitemap.xml`,
  host: process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : `http://localhost:${process.env.PORT || 3000}`,
});

export default robots;
