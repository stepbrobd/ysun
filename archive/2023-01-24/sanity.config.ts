import { codeInput } from "@sanity/code-input";
import { visionTool } from "@sanity/vision";
import CMSLogo from "components/cms-logo";
import {
  apiVersion,
  dataset,
  previewSecretId,
  projectId,
} from "lib/sanity.api";
import { previewDocumentNode } from "plugins/previewPane";
import { productionUrl } from "plugins/productionUrl";
import { settingsPlugin, settingsStructure } from "plugins/settings";
import { createAuthStore, defineConfig } from "sanity";
import { deskTool } from "sanity/desk";
import { unsplashImageAsset } from "sanity-plugin-asset-source-unsplash";
import { latexInput } from "sanity-plugin-latex-input";
import { media } from "sanity-plugin-media";
import { muxInput } from "sanity-plugin-mux-input";
import authorType from "schemas/author";
import postType from "schemas/post";
import settingsType from "schemas/settings";

const title =
  process.env.NEXT_PUBLIC_SANITY_PROJECT_TITLE || "Content Management System";

export default defineConfig({
  basePath: "/cms",
  projectId,
  dataset,
  auth: createAuthStore({
    projectId: projectId,
    dataset: dataset,
    mode: "replace",
    loginMethod: "dual",
    redirectOnSingle: false,
    providers: [
      {
        name: "google",
        title: "Google",
        url: "https://api.sanity.io/v1/auth/login/google",
      },
    ],
  }),
  title,
  studio: { components: { logo: CMSLogo } },
  schema: {
    // If you want more content types, you can add them to this array
    types: [authorType, postType, settingsType],
  },
  plugins: [
    deskTool({
      structure: settingsStructure(settingsType),
      // `defaultDocumentNode` is responsible for adding a “Preview” tab to the document pane
      defaultDocumentNode: previewDocumentNode({ apiVersion, previewSecretId }),
    }),
    // Configures the global "new document" button, and document actions, to suit the Settings document singleton
    settingsPlugin({ type: settingsType.name }),
    // Add the "Open preview" action
    productionUrl({
      apiVersion,
      previewSecretId,
      types: [postType.name, settingsType.name],
    }),
    unsplashImageAsset(),
    media(),
    muxInput({ mp4_support: "standard" }),
    visionTool({ defaultApiVersion: apiVersion }),
    codeInput(),
    latexInput(),
  ],
});
