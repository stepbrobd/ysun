import createImageUrlBuilder from "@sanity/image-url";
import { dataset, projectId } from "lib/sanity.api";

const imageBuilder = createImageUrlBuilder({ projectId, dataset });

export const urlForImage = (source) => imageBuilder.image(source).quality(75).auto("format").fit("max");
