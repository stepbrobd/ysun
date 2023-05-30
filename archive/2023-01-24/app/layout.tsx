import "tailwindcss/tailwind.css";
import "app/global.css";

import Providers from "app/providers";
import ThemeManager from "components/theme-manager";

const Layout = ({ children }) => {
  return (
    <html lang="en-US">
      <head />
      <body className="bg-white selection:bg-highlight dark:bg-black">
        <Providers>
          {children}
          <div className="flex items-center justify-center pb-[200px]">
            <ThemeManager />
          </div>
        </Providers>
      </body>
    </html>
  );
};

export default Layout;
