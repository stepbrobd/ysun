import site from "config";
import Router from "lume/middlewares/router.ts";
import Server from "lume/core/server.ts";
// middlewares
import cacheBusting from "lume/middlewares/cache_busting.ts";
import expires from "lume/middlewares/expires.ts";
import logger from "lume/middlewares/logger.ts";
import precompress from "lume/middlewares/precompress.ts";
import www from "lume/middlewares/www.ts";

const bind = Deno.args[0];
const port = Deno.args[1];

const router = new Router();

const server = new Server({
  hostname: bind,
  port: parseInt(port),
  root: site.writer.dest,
})
  .addEventListener("start", () => {
    console.log(`Server listening on ${server.options.hostname}:${server.options.port}`);
  })
  .use(cacheBusting())
  .use(expires())
  .use(logger())
  .use(precompress())
  .use(router.middleware())
  .use(www({ add: false }));

server.start();
