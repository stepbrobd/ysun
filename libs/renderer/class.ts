import { Renderer as R } from "$gfm";

class Renderer extends R {
  image(src: string, title: string | null, alt: string | null) {
    // ![alt](/path/to/image.jpg|width=300&height=200)
    let width, height;
    const dimensionMatch = src.match(/\|width=(\d+)&height=(\d+)$/);
    if (dimensionMatch) {
      width = dimensionMatch[1];
      height = dimensionMatch[2];
      src = src.split("|")[0];
    }
    return `<figure>
    <img src="${src}" alt="${alt ?? ""}" title="${title ?? ""}"
    ${width ? `width="${width}"` : ""} ${height ? `height="${height}"` : ""}
    loading="lazy" decoding="async"></img>
    ${alt ? `<figcaption>${alt}</figcaption>` : ""}</figure>`;
  }

  link(href: string, title: string | null, text: string) {
    const titleAttr = title ? ` title="${title}"` : "";
    if (this.baseUrl) {
      try {
        href = new URL(href, this.baseUrl).href;
      } catch (_) {
        //
      }
    }
    if (href.startsWith("#")) {
      return `<a href="${href}"${titleAttr}>${text}</a>`;
    }
    if (href.match(/\.[a-z0-9]+$/i)) {
      return `<a href="${href}"${titleAttr} target="_blank" f-client-nav="false">${text}</a>`;
    }
    return `<a href="${href}"${titleAttr} rel="noopener noreferrer" target="_blank">${text}</a>`;
  }
}

export { Renderer };
