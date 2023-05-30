import { default as NextLink } from "next/link";
import Meta from "../../components/meta";
import Image from "../../components/image";
import Link from "../../components/link";
import { blog } from "../../utils/blog";

const Blog = () => {
  return (
    <>
      <Meta
        title="Blog - Yifei Sun"
        description="Yifei Sun's blog."
        image="/assets/image/toc.webp"
        keywords="Yifei Sun, blog, computer science, research, personal site, portfolio"
        slug="/blog"
      />

      <h1>Blog</h1>

      <p>
        All content licensed under the Creative Commons
        Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) license.
      </p>

      <Image
        src="/assets/image/toc.webp"
        alt={`DALL·E: "a white cat writing a book's table of contents, abstract digital art."`}
      />

      <h2>Table of Content</h2>

      <p>In reverse chronological order.</p>

      <div className="space-y-8">
        {blog.main.map((post) => (
          <NextLink key={post.title} href={post.href} passHref>
            <section
              className="hover:light-mode-bg-action-color hover:dark:dark-mode-bg-action-color
                       active:light-mode-bg-action-color active:dark:dark-mode-bg-action-color
                       rounded-xl bg-neutral-200
                       p-4 drop-shadow-xl dark:bg-neutral-800"
            >
              <div className="flex flex-col space-y-3">
                <p className="m-0 text-xl	font-semibold">{post.title}</p>
                <p className="m-0 text-xs text-neutral-500 dark:text-neutral-400">
                  Last modified: {post.date}
                </p>
                <p className="m-0 text-xs text-neutral-500 dark:text-neutral-400">
                  Read time: {post.time}
                </p>
                <p className="m-0 text-base text-neutral-500 dark:text-neutral-400">
                  {post.description.slice(0, 92).trim()}...
                </p>
              </div>
            </section>
          </NextLink>
        ))}
      </div>

      <p>
        Other than the above, I also have something else just for fun{" "}
        <Link href="https://thoughts.yifei.md">here</Link>. The contents are
        hosted on <Link href="https://www.notion.so">Notion</Link> and I used{" "}
        <Link href="https://super.so">Super</Link> with{" "}
        <Link href="https://cosmos.super.site">Cosmos</Link> theme by{" "}
        <Link href="https://www.joshmillgate.co.uk/">Josh Millgate</Link> to
        deploy it.
      </p>

      <h2>Feed</h2>
      <p>
        If you think reading these posts are quite fun, here are three feeds
        available (same content) for subscription:{" "}
        <Link href="/assets/misc/feed.atom" passHref>
          Atom
        </Link>
        ,{" "}
        <Link href="/assets/misc/feed.rss" passHref>
          RSS 2
        </Link>
        , and{" "}
        <Link href="/assets/misc/feed.json" passHref>
          JSON
        </Link>
        .
      </p>
    </>
  );
};

export default Blog;
