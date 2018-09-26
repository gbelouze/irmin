module type S = sig
  type store

  val schema : store -> unit Graphql_lwt.Schema.schema
  val start_server : ?port:int -> store -> unit Lwt.t
end

module type STORE = sig
  include Irmin.S
  val remote: Irmin_unix.Resolver.Store.remote_fn
end

module Make(Store : STORE) : S with type store = Store.t
