import Region from "@/components/region";
import Commit from "@/components/commit";
import ViewCount from "@/components/view-count";

const Page = () => {
    return (
        <main>
            <ViewCount page={__filename} className="text-neutral-500" />
            <Commit />
            <Region />
        </main>
    );
};

export default Page;
