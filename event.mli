type field = All | Id | What

module type EVENT =
  sig
    val addEvent     : Event.event list -> string -> Event.event list
    val getEventId   : Event.event list -> field -> string -> int
    val removeEvent  : Event.event list -> int -> Event.contact list
    val printEvents  : Event.event list -> field -> string -> unit
  end

module Event : EVENT
