"use client";

import { Listbox, Transition } from "@headlessui/react";
import {
  CheckmarkIcon,
  DesktopIcon,
  MoonIcon,
  SelectIcon,
  SunIcon,
} from "@sanity/icons";
import { useTheme } from "next-themes";
import { Fragment, useEffect, useState } from "react";

const themes = ["light", "dark", "system"];
const options = [
  {
    Name: "Light",
    Value: "light",
    Icon: SunIcon,
  },
  {
    Name: "Dark",
    Value: "dark",
    Icon: MoonIcon,
  },
  {
    Name: "System",
    Value: "system",
    Icon: DesktopIcon,
  },
];

const classNames = (...classes) => {
  return classes.filter(Boolean).join(" ");
};

const ThemeManager = () => {
  const [mounted, setMounted] = useState(false);
  const { theme, setTheme } = useTheme();
  const [selected, setSelected] = useState(options[themes.indexOf(theme)]);

  useEffect(() => {
    setMounted(true);
  }, []);

  if (!mounted) {
    return null;
  }

  return (
    <Listbox
      value={selected}
      onChange={(e) => {
        setSelected(e);
        setTheme(e.Value);
      }}
    >
      {({ open }) => (
        <>
          <div className="relative w-[150px] min-w-[150px]">
            <Listbox.Button className="relative rounded-md border border-color py-1.5 px-2 text-center w-[150px] min-w-[150px] focus:outline-none">
              <span className="flex flex-row items-center justify-center">
                <selected.Icon className="absolute left-[10px]" />
                <span className="block truncate">{selected.Name}</span>
                <SelectIcon className="absolute right-[10px]" />
              </span>
            </Listbox.Button>
            <Transition
              show={open}
              as={Fragment}
              leave="transition ease-in duration-100"
              leaveFrom="opacity-100"
              leaveTo="opacity-0"
            >
              <Listbox.Options className="absolute overflow-auto rounded-md border-x border-b border-color divide-y divide-color focus:outline-none w-[150px] min-w-[150px] flex flex-col items-center justify-center">
                {options.map((theme) => (
                  <Listbox.Option
                    key={theme.Value}
                    className="relative select-none w-[150px] min-w-[150px]"
                    value={theme}
                  >
                    {({ selected, active }) => (
                      <div
                        className={classNames(
                          active ? "bg-action" : "",
                          "flex flex-row items-center justify-center py-1.5 px-2 w-[150px] min-w-[150px]"
                        )}
                      >
                        <theme.Icon className="absolute left-[10px]" />
                        <span key={theme.Value} className="block truncate">
                          {theme.Name}
                        </span>
                        {selected ? (
                          <CheckmarkIcon className="absolute right-[10px]" />
                        ) : (
                          <div className="h-[16px] min-h-[16px] w-[16px] min-w-[16px] absolute right-[10px]" />
                        )}
                      </div>
                    )}
                  </Listbox.Option>
                ))}
              </Listbox.Options>
            </Transition>
          </div>
        </>
      )}
    </Listbox>
  );
};

export default ThemeManager;
