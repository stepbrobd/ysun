import { Suspense } from "react";
import kv from "@vercel/kv";

type ViewCountProps = {
    page: string;
    className?: string;
};

const AsyncServerViewCount = async ({ page, className }: ViewCountProps) => {
    const views = await kv.incr(process.env.NODE_ENV === "production" ? page : `dev-${page}`);
    return <p className={className}>{Intl.NumberFormat("en-us").format(views)} views</p>;
};

const ViewCount = ({ page, className }: ViewCountProps) => {
    return (
        <Suspense fallback={<p className={className}>Loading...</p>}>
            {/* @ts-expect-error Async Server Component */}
            <AsyncServerViewCount page={page} className={className} />
        </Suspense>
    );
};

export default ViewCount;
