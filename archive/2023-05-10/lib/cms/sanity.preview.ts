import { dataset, projectId } from "@/lib/cms/sanity.api";
import { definePreview } from "next-sanity/preview";

let alerted = false;
export const usePreview = definePreview({
  projectId: projectId || "",
  dataset: dataset || "",
  onPublicAccessOnly: () => {
    if (!alerted) {
      // eslint-disable-next-line no-alert
      alert("You are not logged in. You will only see public data.");
      alerted = true;
    }
  },
});
