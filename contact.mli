type contact

val create : string -> string -> int -> string -> string -> contact
val createTu : string * string * int * string * string -> contact
val getFn : contact -> string
val getLn : contact -> string
val getAge : contact -> int
val getMail : contact -> string
val getNb : contact -> string

val capitalize : string -> string
val str_sub : string -> int -> string

val printFn: contact -> unit
val printLn: contact -> unit
val printAge: contact -> unit
val printMail: contact -> unit
val printNb: contact -> unit
val printId: int -> unit
val printAll: contact -> int -> unit
