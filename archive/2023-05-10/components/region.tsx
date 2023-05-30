import { headers } from "next/headers";
import { AvailabilityZone as AZ, ReferenceLocation as RL } from "@/lib/region";

const Region = () => {
    const all = headers();
    const region = all.get("x-vercel-id")?.split("::")[0] || "unknown";
    const az = AZ[region];
    const rl = RL[region];

    return (
        <a href="https://vercel.com/docs/concepts/edge-network/regions" target="_blank" rel="noreferrer noopener">
            <div className="flex flex-col items-center justify-center">
                <div>{region}</div>
                <div>{az}</div>
                <div>{rl}</div>
            </div>
        </a>
    );
};

export default Region;
