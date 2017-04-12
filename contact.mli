type contact

val create : string -> string -> int -> string -> string -> contact
val createTu : string * string * int * string * string -> contact
val getFn : contact -> string
val getLn : contact -> string
val getAge : contact -> int
val getMail : contact -> string
val getNb : contact -> string
val print: contact -> unit
