import { dataset, projectId } from "lib/sanity.api";

export const urlForAsset = (source) => {
  return `https://cdn.sanity.io/files/${projectId}/${dataset}/${
    source.asset._ref.split("-")[1]
  }.${source.asset._ref.split("-")[2]}`;
};
