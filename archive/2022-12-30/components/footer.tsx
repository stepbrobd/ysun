import { useEffect, useState } from "react";
import { awsRegion, referenceLocation } from "../utils/regions";
import { navigation } from "../utils/navigation";
import Image from "next/image";
import { default as NextLink } from "next/link";
import Divider from "./divider";
import Link from "./link";

const Footer = () => {
  const currentTime = () =>
    new Date().toLocaleString("en-US", {
      hour12: false,
      month: "long",
      day: "numeric",
      year: "numeric",
      hour: "numeric",
      minute: "numeric",
      second: "numeric",
      timeZoneName: "short",
    });
  const [time, setTime] = useState(currentTime);
  useEffect(() => {
    let timer = setInterval(() => {
      setTime(currentTime);
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  const defaultRegion = "Loading...";
  const [vercelRegion, setRegion] = useState(defaultRegion);
  useEffect(() => {
    fetch("/assets/misc/region.txt")
      .then((res) => res.headers.get("x-vercel-id"))
      .then((res) => setRegion(res?.substring(0, 4) || defaultRegion));
  }, []);

  return (
    <footer
      className="light-mode-border-color dark:dark-mode-border-color flex items-center justify-center border-t-[1px] py-5"
      aria-label="Footer"
    >
      <div className="mx-3.5 max-w-3xl space-y-5 overflow-hidden xl:mx-0">
        <nav className="flex flex-wrap items-center justify-center pt-2">
          {navigation.main.map((item) => (
            <NextLink key={item.name} href={item.href}>
              <a
                href={item.href}
                className="light-mode-link-color dark:dark-mode-link-color px-5 py-2 text-sm"
              >
                {item.name}
              </a>
            </NextLink>
          ))}
        </nav>

        <Divider text="Deployment" />

        <div className="flex flex-row items-center justify-between">
          <p className="text-sm">Vercel region:</p>
          <p className="text-sm" suppressHydrationWarning={true}>
            {vercelRegion}
          </p>
        </div>

        <div className="flex flex-row items-center justify-between">
          <p className="text-sm">AWS region:</p>
          <p className="text-sm" suppressHydrationWarning={true}>
            {awsRegion[vercelRegion]}
          </p>
        </div>

        <div className="flex flex-row items-center justify-between">
          <p className="text-sm">Server location:</p>
          <p className="text-sm" suppressHydrationWarning={true}>
            {referenceLocation[vercelRegion]}
          </p>
        </div>

        <div className="flex flex-row items-center justify-between">
          <p className="text-sm">Commit digest:</p>
          <p className="text-sm">
            {process.env.NEXT_PUBLIC_VERCEL_GIT_COMMIT_SHA?.substring(0, 20) ||
              "N/A"}
          </p>
        </div>

        <div className="flex flex-row items-center justify-between">
          <p className="text-sm">Client time:</p>
          <p className="text-sm" suppressHydrationWarning={true}>
            {time}
          </p>
        </div>

        <Divider text="Legal" />

        <p className="text-center text-sm">
          All images generated using OpenAI DALL·E are subject to OpenAI DALL·E
          {"'s "}
          <Link href="https://labs.openai.com/policies/terms">
            <span className="light-mode-link-color dark:dark-mode-link-color">
              Terms of Use
            </span>
          </Link>
          . Site performance, crash logs and errors are tracked and monitored with{" "}
          <Link href="https://sentry.io">
            <span className="light-mode-link-color dark:dark-mode-link-color">
              Sentry
            </span>
          </Link>
          . User interactions with this site are tracked with{" "}
          <Link href="https://heap.io">
            <span className="light-mode-link-color dark:dark-mode-link-color">
              Heap Analytics
            </span>
          </Link>{" "}
          ,{" "}
          <Link href="https://plausible.io">
            <span className="light-mode-link-color dark:dark-mode-link-color">
              Plausible Analytics
            </span>
          </Link>{" "}
          and{" "}
          <Link href="https://vercel.com/analytics">
            <span className="light-mode-link-color dark:dark-mode-link-color">
              Vercel Analytics
            </span>
          </Link>
          . All logs are anonymized and no personally identifiable information is collected.
        </p>

        <p className="text-center text-sm">
          Copyright &copy; {new Date().getFullYear()} Yifei Sun. All rights reserved.
        </p>

        <a
          className="flex h-[28px] items-center justify-center"
          href="https://creativecommons.org/licenses/by-nc/4.0/"
          rel="noopener noreferrer"
          target="_blank"
        >
          <div className="flex flex-row space-x-3">
            <div>
              <Image
                src="/assets/license/cc.svg"
                alt="CC"
                width={24}
                height={24}
              />
            </div>
            <div>
              <Image
                src="/assets/license/by.svg"
                alt="BY"
                width={24}
                height={24}
              />
            </div>
            <div>
              <Image
                src="/assets/license/nc.svg"
                alt="NC"
                width={24}
                height={24}
              />
            </div>
          </div>
        </a>
      </div>
    </footer>
  );
};

export default Footer;
