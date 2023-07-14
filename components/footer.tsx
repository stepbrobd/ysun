import {
    IconBrandGithub,
    IconBrandLinkedin,
    IconBrandThreads,
    IconBrandTwitter,
    IconCreativeCommons,
    IconCreativeCommonsBy,
    IconCreativeCommonsNc,
    IconMail,
} from "@tabler/icons-react";

const Footer = () => {
    const sha =
        process.env.NEXT_PUBLIC_VERCEL_GIT_COMMIT_SHA ||
        "8bb25f5122731a4d6fb3ce2b5d98f7ab34c77ae9";

    return (
        <div className="flex flex-col items-center md:items-start space-y-6">
            <small className="h-5">
                &copy; {new Date().getFullYear()} Yifei Sun. Some rights
                reserved.
            </small>

            <small className="h-5">
                <a
                    href={`https://github.com/stepbrobd/ysun.co/commit/${sha}`}
                    target="_blank"
                    className="font-mono underline"
                >
                    {sha.slice(0, 25)}
                </a>
            </small>

            <div className="flex flex-row space-x-3 items-center justify-center h-5">
                <a
                    href="mailto:hi@ysun.co"
                    target="_blank"
                    className="inline-block"
                    aria-label="Mail"
                >
                    <IconMail size={20} />
                </a>
                <a
                    href="https://www.linkedin.com/in/yifei-s"
                    target="_blank"
                    className="inline-block"
                    aria-label="YouTube"
                >
                    <IconBrandLinkedin size={20} />
                </a>
                <a
                    href="https://github.com/stepbrobd"
                    target="_blank"
                    className="inline-block"
                    aria-label="GitHub"
                >
                    <IconBrandGithub size={20} />
                </a>
                <a
                    href="https://twitter.com/stepbrobd"
                    target="_blank"
                    className="inline-block"
                    aria-label="Twitter"
                >
                    <IconBrandTwitter size={20} />
                </a>
                <a
                    href="https://www.threads.net/@stepbrobd"
                    target="_blank"
                    className="inline-block"
                    aria-label="Instagram"
                >
                    <IconBrandThreads size={20} />
                </a>
            </div>

            <a
                className="flex items-center justify-center h-5"
                href="https://creativecommons.org/licenses/by-nc/4.0/"
                rel="noopener noreferrer"
                target="_blank"
            >
                <div className="flex flex-row space-x-3">
                    <IconCreativeCommons size={20} />
                    <IconCreativeCommonsBy size={20} />
                    <IconCreativeCommonsNc size={20} />
                </div>
            </a>
        </div>
    );
};

export default Footer;
