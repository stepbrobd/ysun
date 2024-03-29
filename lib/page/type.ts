interface Page {
  path: string;
  slug: string;
  title: string;
  description: string;
  date: Date;
  tags: string[];
  image: string;
  body: string;
}

export { type Page };
