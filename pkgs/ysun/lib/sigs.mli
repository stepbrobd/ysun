module type RESOLVABLE = sig
  val source : Yocaml.Path.t
  val target : Yocaml.Path.t
  val root : string
end

module type RESOLVER = sig
  include RESOLVABLE

  val track_common_dependencies : (unit, unit) Yocaml.Task.t

  module Source : sig
    val root : Yocaml.Path.t
    val executable : Yocaml.Path.t
    val pages : Yocaml.Path.t
    val assets : Yocaml.Path.t
    val css : Yocaml.Path.t
    val static : Yocaml.Path.t
    val doc : Yocaml.Path.t
    val img : Yocaml.Path.t
    val favicon : Yocaml.Path.t
    val template : Yocaml.Path.fragment -> Yocaml.Path.t
  end

  module Target : sig
    val root : Yocaml.Path.t
    val cache : Yocaml.Path.t
    val assets : Yocaml.Path.t
    val static : Yocaml.Path.t
    val doc : Yocaml.Path.t
    val img : Yocaml.Path.t
    val css : Yocaml.Path.t
    val index : Yocaml.Path.t
    val feed : Yocaml.Path.t
    val geofeed : Yocaml.Path.t
    val sitemap : Yocaml.Path.t
    val robots : Yocaml.Path.t
    val favicon : Yocaml.Path.t
  end

  module Url : sig
    (** Canonical site URL with all trailing slashes stripped. Suitable for
        concatenation with absolute paths beginning with [/]. *)
    val site : string

    (** [absolute path] returns [site ^ path]. The caller is responsible for
        ensuring [path] starts with ['/']. *)
    val absolute : string -> string

    (** Absolute URL of the default Open Graph image. *)
    val og_image : string
  end
end
