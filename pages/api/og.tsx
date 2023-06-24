/* eslint-disable @next/next/no-img-element */

import { ImageResponse } from "@vercel/og";
import { NextRequest } from "next/server";

export const config = {
    runtime: "edge",
};

const image = fetch(new URL("./og.png", import.meta.url)).then((res) =>
    res.arrayBuffer()
);

export default async function handler(request: NextRequest) {
    try {
        const imageData = await image;

        const { searchParams } = new URL(request.url);

        // ?text=<text>
        const hasText = searchParams.has("text");
        const text = hasText
            ? searchParams.get("text")?.slice(0, 100)
            : "Yifei Sun";

        return new ImageResponse(
            (
                <div
                    style={{
                        height: "100%",
                        width: "100%",
                        display: "flex",
                        flexDirection: "column",
                        alignItems: "center",
                        justifyContent: "center",
                        backgroundColor: "black",
                    }}
                >
                    <img
                        alt="Yifei Sun"
                        width="1200"
                        height="630"
                        // @ts-ignore
                        src={imageData}
                        style={{ marginTop: -125 }}
                    />
                    <div
                        style={{
                            fontSize: 36,
                            fontStyle: "normal",
                            color: "white",
                            marginTop: -100,
                            whiteSpace: "pre-wrap",
                        }}
                    >
                        {text}
                    </div>
                </div>
            ),
            {
                width: 1200,
                height: 630,
            }
        );
    } catch (e: any) {
        console.log(`${e.message}`);
        return new Response(`Failed to generate open graph image`, {
            status: 500,
        });
    }
}
