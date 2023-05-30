"use client";

import MuxPlayer from "@mux/mux-player-react/lazy";

type VideoProps = {
  title: string;
  payload: any;
};

const Video = ({ title, payload }: VideoProps) => {
  return (
    <span className="z-0 block">
      <span className="z-10 block min-w-full items-center justify-center overflow-hidden rounded-md text-center">
        <span className="flex items-center justify-center">
          <MuxPlayer
            className="scale-y-105 border-none"
            stream-type="on-demand"
            playbackId={payload.playbackId}
            title={title}
            metadata={{
              video_id: payload.data.id,
              video_title: title,
            }}
          />
        </span>
      </span>
      <span
        className="flex items-center justify-center px-4 pt-4 text-sm
                  text-neutral-600 dark:text-neutral-400"
      >
        <span>
          Video: {title} ({payload.data.aspect_ratio}{" "}
          {payload.data.max_stored_resolution} @{" "}
          {payload.data.max_stored_frame_rate} FPS)
        </span>
      </span>
    </span>
  );
};

export default Video;
