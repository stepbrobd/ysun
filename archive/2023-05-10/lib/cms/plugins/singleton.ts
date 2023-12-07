export const singleton = (types: string[]) => {
  return {
    name: "singleton",
    document: {
      newDocumentOptions: (prev: any, { creationContext }: any) => {
        if (creationContext.type === "global") {
          return prev.filter((templateItem: any) => !types.includes(templateItem.templateId));
        }
        return prev;
      },
      actions: (prev: any, { schemaType }: any) => {
        if (types.includes(schemaType)) {
          return prev.filter(({ action }: any) => action !== "duplicate");
        }
        return prev;
      },
    },
  };
};
