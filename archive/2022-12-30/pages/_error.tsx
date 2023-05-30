import * as Sentry from "@sentry/nextjs";
import NextErrorComponent, { ErrorProps } from "next/error";
import Image from "../components/image";
import Meta from "../components/meta";

const Error = (props: ErrorProps) => {
  return (
    <>
      <Meta
        title={`${props.statusCode} Internal Server Error - Yifei Sun`}
        description="The page you are looking for caused an error on the server."
        image="/assets/error/500.webp"
        keywords="500, 50x, internal server error, error"
        slug="/{statusCode}"
      />

      <h1>{props.statusCode} Internal Server Error</h1>

      <Image
        src="/assets/error/500.webp"
        alt='DALL·E: "HTTP 500 Internal Server Error, depicted as a cute, happy kitten tearing down wires in a computer, digital art."'
      />
    </>
  );
};

Error.getInitialProps = async (contextData: any) => {
  await Sentry.captureUnderscoreErrorException(contextData);
  return NextErrorComponent.getInitialProps(contextData);
};

export default Error;
