import { kv } from "@vercel/kv";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";

const Views = () => {
    const { asPath, defaultLocale, locale } = useRouter();
    const key =
        "https://ysun.co" +
        (defaultLocale === locale ? asPath : `/${locale}${asPath}`).replaceAll(
            "/",
            "-"
        );

    const [views, setViews] = useState(0);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const getViews = async () => {
            const res = await kv.incr(key);
            setViews(res);
            setLoading(false);
        };
        getViews();
    }, [key]);

    if (loading) {
        return <small>Loading...</small>;
    }

    return (
        <small>
            {views} view{views === 1 ? "" : "s"}
        </small>
    );
};

export default Views;
