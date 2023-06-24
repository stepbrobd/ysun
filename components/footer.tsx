import Image from "next/image";

const Footer = () => {
    return (
        <div className="flex flex-col items-center sm:items-start space-y-6">
            <small>
                &copy; {new Date().getFullYear()} Yifei Sun. Some rights
                reserved.
            </small>
            <a
                className="flex items-center justify-center"
                href="https://creativecommons.org/licenses/by-nc/4.0/"
                rel="noopener noreferrer"
                target="_blank"
            >
                <div className="flex flex-row space-x-2">
                    <Image src="/cc.svg" alt="CC" width={20} height={20} />
                    <Image src="/by.svg" alt="BY" width={20} height={20} />
                    <Image src="/nc.svg" alt="NC" width={20} height={20} />
                </div>
            </a>
        </div>
    );
};

export default Footer;
