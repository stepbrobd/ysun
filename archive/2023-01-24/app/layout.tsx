import "tailwindcss/tailwind.css";
import "app/global.css";

import Providers from "app/providers";
import ThemeManager from "components/theme-manager";

const Layout = ({ children }) => {
  return (
    <html lang="en-US">
      <head />
      <body className="bg-white dark:bg-black selection:bg-highlight">
        <Providers>
          {children}
          <div className="flex justify-center items-center pb-[200px]">
            <ThemeManager />
          </div>
        </Providers>
      </body>
    </html>
  );
};

export default Layout;
