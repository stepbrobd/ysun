(** Resolvers are used to resolve the various paths (to reach the source, the
    target and to generate URLs within the application).

    A resolver is parameterised by a [target] path, which allows the generation
    artefacts to be described {i or built}, and a [root] URL used to build
    canonical/absolute URLs. Source paths resolve relative to the current
    working directory, which must be the repository root. *)

module Make (_ : Sigs.RESOLVABLE) : Sigs.RESOLVER
