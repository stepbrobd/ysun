import Router from "lume/middlewares/router.ts";
import Server from "lume/core/server.ts";
// middlewares
import cacheBusting from "lume/middlewares/cache_busting.ts";
import expires from "lume/middlewares/expires.ts";
import logger from "lume/middlewares/logger.ts";
import precompress from "lume/middlewares/precompress.ts";
import www from "lume/middlewares/www.ts";

const root = Deno.args[0];
const hostname = Deno.args[1];
const port = parseInt(Deno.args[2]);

const router = new Router();

const server = new Server({ root, hostname, port })
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
