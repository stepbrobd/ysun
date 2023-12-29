const cwd = Deno.mainModule
  .replace(/\/[^\/]+$/, "")
  .replace("file://", "");

export { cwd };
