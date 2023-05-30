import Image from "next/image";

const CMSLogo = () => {
  return (
    <span className="mx-2 flex h-[35px] min-h-[35px] items-center justify-center">
      <Image
        src="/favicon/apple-touch-icon.png"
        alt="Logo"
        width={20}
        height={20}
        className="mr-1"
      />
      <span className="ml-1 text-lg font-bold">CMS</span>
    </span>
  );
};

export default CMSLogo;
