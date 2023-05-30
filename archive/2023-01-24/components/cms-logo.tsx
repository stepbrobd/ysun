import Image from "next/image";

const CMSLogo = () => {
  return (
    <span className="h-[35px] min-h-[35px] flex justify-center items-center mx-2">
      <Image
        src="/favicon/apple-touch-icon.png"
        alt="Logo"
        width={20}
        height={20}
        className="mr-1"
      />
      <span className="ml-1 font-bold text-lg">CMS</span>
    </span>
  );
};

export default CMSLogo;
