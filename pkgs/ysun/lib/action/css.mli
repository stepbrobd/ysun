(** An action that compiles the tailwind stylesheet into the target. The
    dependency list must contain every template and page file, since tailwind
    emits utility classes by scanning them. *)

val run : (module Sigs.RESOLVER) -> Yocaml.Path.t list -> Yocaml.Action.t
