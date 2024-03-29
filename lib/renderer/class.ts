import { Renderer as R } from "$gfm";

class Renderer extends R {
  image(src: string, title: string | null, alt: string | null) {
    // ![alt](/path/to/image.jpg/s:<width>)
    // ![alt](/path/to/image.jpg/s::<height>)
    // ![alt](/path/to/image.jpg/s:<width>:<height>)
    const [url, size] = src.split("/s:");
    const [width, height] = size?.split(":") ?? [];
    return `<figure>
    <img src="${url}" alt="${alt ?? ""}" title="${title ?? ""}"
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
    if (!href.startsWith("http")) {
      return `<a href="${href}"${titleAttr}>${text}</a>`;
    }
    return `<a href="${href}"${titleAttr} rel="noopener noreferrer" target="_blank">${text}</a>`;
  }
}

export { Renderer };
