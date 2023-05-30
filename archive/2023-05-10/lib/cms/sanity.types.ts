export type Region = {
    _type: string;
    region?: string; // Vercel region ID
    az?: string; // AWS availability zone ID
    rl?: string; // Reference location
};
