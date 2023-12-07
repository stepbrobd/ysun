interface Page {
  path: string;
  slug: string;
  title: string;
  description: string;
  modified: Date;
  content: string;
}

export { type Page };
