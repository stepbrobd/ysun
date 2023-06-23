const Head = ({
  url,
  title,
  description,
}: {
  url: string;
  title: string;
  description: string;
}) => {
  return (
    <>
      <meta property="og:locale" content="en_US" />
      <meta property="og:url" content={url || "https://ysun.co"} />
      <meta property="og:title" content={title || "Yifei Sun"} />
      <meta
        property="og:description"
        content={
          description ||
          `
      Yifei Sun is a graduate student at Northeastern University studying computer science.

      His research interests are: 
          - Formal verification for distributed systems and database systems. 
          - Programming language and concurrent data structure related formal verification and fuzz testing. 
          - IMU data feature extraction and machine learning for robotic systems and healthcare applications.
      
      During free time, he most likely would laze around watching anime or browsing YouTube or HackerNews.
      
      He is pretty darn good at swimming, archery and ping pong.
      
      You might want to try:
          - Nix/NixOS: https://nixos.org
          - Tailscale: https://tailscale.com
          - Fly.io: https://fly.io
          - Vercel: https://vercel.com
          - Heap: https://heap.io
      
      Wanna get in touch?
          - LinkedIn: https://www.linkedin.com/in/yifei-s
          - GitHub: https://github.com/stepbrobd
          - Twitter: https://twitter.com/stepbrobd
      `
        }
      />
      <meta property="og:image" content="https://ysun.co/portrait.webp" />
    </>
  );
};

export default Head;
