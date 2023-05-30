import Image from "../components/image";
import Meta from "../components/meta";

const Error = () => {
  return (
    <>
      <Meta
        title="404 Not Found - Yifei Sun"
        description="The page you are looking for does not exist."
        image="/assets/error/404.webp"
        keywords="404, not found, error"
        slug="/404"
      />

      <h1>404 Not Found</h1>

      <Image
        src="/assets/error/404.webp"
        alt='DALL·E: "HTTP 404 Not Found, depicted as a cute kitten hiding in a pile of newspapers, digital art."'
      />
    </>
  );
};

export default Error;
