import Balancer from "react-wrap-balancer";

export default function PostTitle({ children }) {
  return (
    <Balancer>
      <h1 className="mb-12 text-center text-6xl font-bold leading-tight tracking-tighter md:text-left md:text-7xl md:leading-none lg:text-8xl">
        {children}
      </h1>
    </Balancer>
  );
}
