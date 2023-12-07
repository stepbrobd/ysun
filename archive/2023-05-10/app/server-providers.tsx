import { ServerThemeProvider } from "next-themes";

const ServerProviders = ({ children }: { children: React.ReactNode }) => {
  return (
    <ServerThemeProvider
      attribute="class"
      defaultTheme="system"
      disableTransitionOnChange
    >
      {children}
    </ServerThemeProvider>
  );
};

export { ServerProviders };
