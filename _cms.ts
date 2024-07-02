import lumeCMS, { GitHub } from "lume/cms/mod.ts";
import { Octokit } from "octokit";

const cms = lumeCMS({
  site: { name: "CMS" },
  auth: {
    method: "basic",
    users: {
      "ysun@hey.com": "password1",
    },
  },
});

export default cms;
