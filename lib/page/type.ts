interface Page {
  path: string;
  slug: string;
  title: string;
  description: string;
  date: Date;
  tags: string[];
  image: string;
  metadata: { name: string; content: string }[];
  body: string;
}

export { type Page };
