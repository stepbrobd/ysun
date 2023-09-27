import {
    IconBrandGithub,
    IconBrandLinkedin,
    IconBrandX,
    IconCreativeCommons,
    IconCreativeCommonsBy,
    IconCreativeCommonsNc,
    IconMail,
    IconWorldHeart,
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
                    href="mailto:ysun@hey.com"
                    target="_blank"
                    className="inline-block"
                    aria-label="Mail"
                >
                    <IconMail size={20} />
                </a>
                <a
                    href="https://ysun.co/linkedin"
                    target="_blank"
                    className="inline-block"
                    aria-label="LinkedIn"
                >
                    <IconBrandLinkedin size={20} />
                </a>
                <a
                    href="https://ysun.co/github"
                    target="_blank"
                    className="inline-block"
                    aria-label="GitHub"
                >
                    <IconBrandGithub size={20} />
                </a>
                <a
                    href="https://ysun.co/x"
                    target="_blank"
                    className="inline-block"
                    aria-label="X"
                >
                    <IconBrandX size={20} />
                </a>
                <a
                    href="https://ysun.co/world"
                    target="_blank"
                    className="inline-block"
                    aria-label="HEY World"
                >
                    <IconWorldHeart size={20} />
                </a>
            </div>

            <a
                className="flex items-center justify-center h-5"
                href="https://creativecommons.org/licenses/by-nc/4.0/"
                rel="noopener noreferrer"
                target="_blank"
                aria-label="CC BY-NC 4.0"
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
