Without --image-root no image file is opened, so rendering depends only on the
document.

  $ omd << "MD"
  > ![a picture](/img/missing.png)
  > MD
  <figure><img src="/img/missing.png" alt="" loading="lazy" decoding="async" /><figcaption>a picture</figcaption>
  </figure>

With --image-root a site local destination that does not resolve stops the
build rather than silently rendering without width and height.

  $ omd --image-root . << "MD"
  > ![a picture](/img/missing.png)
  > MD
  Error: Omd.Image_error(io_error(./img/missing.png: No such file or directory) for "/img/missing.png" at "./img/missing.png")
  [1]

Remote destinations are never opened, so they are not an error.

  $ omd --image-root . << "MD"
  > ![a picture](https://example.com/img.png)
  > MD
  <figure><img src="https://example.com/img.png" alt="" loading="lazy" decoding="async" /><figcaption>a picture</figcaption>
  </figure>

  $ omd --image-root . << "MD"
  > ![a picture](//example.com/img.png)
  > MD
  <figure><img src="//example.com/img.png" alt="" loading="lazy" decoding="async" /><figcaption>a picture</figcaption>
  </figure>
