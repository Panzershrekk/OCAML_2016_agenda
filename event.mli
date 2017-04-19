type field = All | Id | Date | Hour |What
type event = (string * string * string)

val createTu : string * string * string -> event
val getEvent : event -> string
val getHour : event -> string
val getDate : event -> string
val str_sub : string -> int -> string
val unsentive_cmp: string -> string -> bool
val string_to_int_cmp : string -> int -> int
val cmp_all : event -> string -> int -> bool
val printDate: event -> unit
val printHour: event -> unit
val printEvent: event -> unit
val printId: int -> unit
val printAll: event -> int -> unit
val isValid: string list -> bool
val validHour: string -> bool
val isValidDate: string list -> bool
val validDate: string -> bool

module type EVENT =
  sig
    val addEvent     : event list -> string * string * string -> event list
    val getEventId   : event list -> field -> string -> int
    val removeEvent  : event list -> int -> event list
    val printEvents  : event list -> field -> string -> unit
  end

module Event : EVENT
