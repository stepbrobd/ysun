import lumeCMS from "lume/cms/mod.ts";
import GitHub from "lume/cms/storage/github.ts";
import { Octokit } from "octokit";

const user = Deno.env.get("USER");
const pass = Deno.env.get("PASS");

const cms = lumeCMS({
  site: { name: "CMS" },
  auth: {
    method: "basic",
    users: { [user]: pass },
  },
});

cms.storage(
  "gh",
  new GitHub({
    client: new Octokit({ auth: Deno.env.get("TOKEN") }),
    owner: "stepbrobd",
    repo: "ysun",
  }),
);

cms.collection("pages", "gh:pages/*.md", [
  { name: "title", type: "text", attributes: { required: true } },
  { name: "date", type: "datetime", value: new Date(), attributes: { required: true } },
  { name: "content", type: "markdown", attributes: { required: true } },
]);

cms.upload("images", "gh:assets/static/img");
cms.upload("documents", "gh:assets/static/doc");

export default cms;
