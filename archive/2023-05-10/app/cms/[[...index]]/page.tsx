"use client";

import { NextStudio } from "next-sanity/studio";
import config from "@/lib/cms/sanity.config";

export default function StudioPage() {
  return <NextStudio config={config} />;
}
