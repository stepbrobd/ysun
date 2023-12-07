import {
  BookIcon,
  CodeBlockIcon,
  DocumentVideoIcon,
  FolderIcon,
  ImageIcon,
  LaunchIcon,
  LinkIcon,
  NumberIcon,
} from "@sanity/icons";
import { format, parseISO } from "date-fns";
import { defineField, defineType } from "sanity";

import authorType from "./author";

/**
 * This file is the schema definition for a post.
 *
 * Here you'll be able to edit the different fields that appear when you
 * create or edit a post in the studio.
 *
 * Here you can see the different schema types that are available:

  https://www.sanity.io/docs/schema-types

 */

export default defineType({
  name: "post",
  title: "Blog Posts",
  icon: BookIcon,
  type: "document",
  fields: [
    defineField({
      name: "title",
      title: "Title",
      type: "string",
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "slug",
      title: "Slug",
      type: "slug",
      options: {
        source: "title",
        maxLength: 96,
        isUnique: (value, context) => context.defaultIsUnique(value, context),
      },
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "author",
      title: "Author",
      type: "reference",
      to: [{ type: authorType.name }],
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "initialPostDate",
      title: "Initial Post Date",
      type: "datetime",
      initialValue: () => new Date().toISOString(),
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "lastModifiedDate",
      title: "Last Modified Date",
      type: "datetime",
      initialValue: () => new Date().toISOString(),
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "coverImage",
      title: "Cover Image",
      type: "image",
      options: { metadata: ["lqip"], hotspot: true },
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "excerpt",
      title: "Excerpt",
      type: "text",
      validation: (rule) => rule.required(),
    }),

    defineField({
      name: "content",
      title: "Content",
      description: 'Note: LaTeX content must always start with either "%inline" or "%block".',
      type: "array",
      of: [
        {
          type: "block",
          of: [{ type: "latex", title: "Inline LaTeX", icon: NumberIcon }],
          marks: {
            annotations: [
              {
                name: "internalLink",
                type: "object",
                title: "Internal Link",
                icon: LinkIcon,
                fields: [
                  {
                    name: "reference",
                    type: "reference",
                    title: "Reference",
                    to: [
                      { type: "post" },
                      // other types
                    ],
                  },
                  {
                    name: "slug",
                    type: "slug",
                    title: "Slug",
                  },
                ],
              },
              {
                name: "externalLink",
                type: "object",
                title: "External Link",
                icon: LaunchIcon,
                fields: [
                  {
                    name: "href",
                    type: "url",
                    title: "URL",
                  },
                  {
                    name: "blank",
                    type: "boolean",
                    title: "Open in new tab",
                  },
                ],
              },
            ],
          },
        },
        { type: "latex", title: "Block LaTeX", icon: NumberIcon },
        {
          type: "code",
          icon: CodeBlockIcon,
          options: { theme: "github", darkTheme: "terminal" },
        },
        {
          type: "image",
          icon: ImageIcon,
          options: { metadata: ["lqip"], hotspot: true },
          fields: [{ name: "alt", title: "Image Description", type: "string" }],
        },
        {
          type: "object",
          name: "video",
          title: "Video",
          icon: DocumentVideoIcon,
          fields: [
            {
              type: "string",
              name: "title",
              title: "Title",
            },
            {
              type: "mux.video",
              name: "asset",
              title: "Video",
            },
          ],
        },
        {
          type: "file",
          icon: FolderIcon,
          fields: [{ name: "name", title: "File Name", type: "string" }],
        },
      ],
      validation: (rule) => rule.required(),
    }),
  ],
  preview: {
    select: {
      title: "title",
      author: "author.name",
      initialPostDate: "initialPostDate",
      lastModifiedDate: "lastModifiedDate",
      media: "coverImage",
    },
    prepare({ title, media, author, initialPostDate, lastModifiedDate }) {
      const subtitles = [
        author && `Author: ${author},`,
        initialPostDate &&
        `Posted on ${format(parseISO(initialPostDate), "LLL d, yyyy")},`,
        lastModifiedDate &&
        `Modified on ${format(parseISO(lastModifiedDate), "LLL d, yyyy")}.`,
      ].filter(Boolean);

      return { title, media, subtitle: subtitles.join(" ") };
    },
  },
});
