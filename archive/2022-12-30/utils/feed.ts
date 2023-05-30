import { Feed } from "feed";
import fs from "fs";
import { blog } from "./blog";

export const generateFeed = async () => {
  const baseURL = "https://yifei.md";
  const author = {
    name: "Yifei Sun",
    email: "yifei@email.com",
    link: "https://yifei.md",
  };
  const date = new Date();

  const feed = new Feed({
    title: "Yifei Sun",
    description: "Yifei Sun's feed.",
    id: baseURL,
    link: baseURL,
    image: `${baseURL}/assets/image/portrait.webp`,
    favicon: `${baseURL}/assets/favicon/favicon.ico`,
    copyright: `Copyright © ${new Date().getFullYear()} Yifei Sun. All rights reserved.`,
    updated: date,
    generator: "Feed",
    feedLinks: {
      rss2: `${baseURL}/assets/misc/feed.xml`,
      json: `${baseURL}/assets/misc/feed.json`,
      atom: `${baseURL}/assets/misc/feed.atom`,
    },
    author,
  });

  blog.main.forEach((post) => {
    var url = "";
    if (post.href.startsWith("http")) {
      url = post.href;
    } else {
      url = `${baseURL}${post.href}`;
    }

    feed.addItem({
      title: post.title,
      id: url,
      link: url,
      description: post.description,
      content: post.description,
      author: [author],
      contributor: [author],
      date: new Date(post.date),
    });
  });

  fs.writeFileSync("./public/assets/misc/feed.rss", feed.rss2());
  fs.writeFileSync("./public/assets/misc/feed.json", feed.json1());
  fs.writeFileSync("./public/assets/misc/feed.atom", feed.atom1());
};
