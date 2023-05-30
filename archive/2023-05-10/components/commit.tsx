type CommitProps = {
    className?: string;
};

const Commit = ({ className }: CommitProps) => {
    const provider = process.env.VERCEL_GIT_PROVIDER?.toLowerCase() || "github";
    const owner = process.env.VERCEL_GIT_REPO_OWNER?.toLowerCase() || "vercel";
    const repo = process.env.VERCEL_GIT_REPO_SLUG?.toLowerCase() || "next.js";
    const commit = process.env.VERCEL_GIT_COMMIT_SHA;
    const url = !commit ? `https://${provider}.com/${owner}/${repo}` : `https://${provider}.com/${owner}/${repo}/commit/${commit}`;
    const purl = !commit ? `${provider}:${owner}/${repo}` : `${provider}:${owner}/${repo}/${commit}`;

    return (
        <p className="truncate">
            <a href={url} target="_blank" rel="noreferrer noopener" className={className || "font-mono underline"}>
                {purl}
            </a>
        </p>
    );
};

export default Commit;
