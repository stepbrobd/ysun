import "server-only";

import { apiVersion, dataset, projectId, useCdn } from "@/lib/cms/sanity.api";
import { regionQuery } from "@/lib/cms/sanity.queries";
import { createClient } from "next-sanity";
import type { Region } from "@/lib/cms/sanity.types";

const sanityClient = (token?: string | null) => {
  return projectId ? createClient({ projectId, dataset, apiVersion, useCdn, token: token! }) : null;
};

export async function getRegion(
  { token }: { token?: string | null },
): Promise<Region | undefined> {
  return await sanityClient(token)?.fetch(regionQuery);
}
