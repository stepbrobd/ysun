import { apiVersion, dataset, previewSecretId, projectId } from "@/lib/cms/sanity.api";
import { singleton } from "@/lib/cms/plugins/singleton";
import { createAuthStore, defineConfig } from "sanity";
import { deskTool } from "sanity/desk";
import { visionTool } from "@sanity/vision";

export default defineConfig({
  title: "Content Management System",
  basePath: "/cms",
  projectId,
  dataset,

  auth: createAuthStore({
    projectId: projectId,
    dataset: dataset,
    mode: "replace",
    loginMethod: "dual",
    redirectOnSingle: true,
    providers: [
      {
        name: "google",
        title: "Google",
        url: "https://api.sanity.io/v1/auth/login/google",
      },
    ],
  }),

  schema: {
    types: [],
  },

  plugins: [
    singleton([]),

    deskTool({}),
    visionTool({
      defaultApiVersion: apiVersion,
    }),
  ],
});
