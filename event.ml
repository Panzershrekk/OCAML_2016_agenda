type field = All | Id | What
type event = string
exception Remove_Using_An_Invalid_Id;;
exception Remove_Impossible_On_An_Empty_List;;

let getEvent e = e

let str_sub s x =
  if String.length s < x
    then s
  else
    let buff = Buffer.create 0 in Buffer.add_string buff s ; Buffer.sub buff 0 x

let printEvent event =
    print_string (getEvent event); print_string "\n"

let printId i =
    print_string (str_sub (string_of_int i) 4) ; print_string " "

let printAll s i =
    printId i; printEvent s

let unsentive_cmp fstr sstr =
    if String.compare (String.lowercase_ascii fstr) (String.lowercase_ascii sstr) = 0 then true else false;;

let string_to_int_cmp str default =
    try
      (int_of_string str)
    with
      | Failure _ -> default

let cmp_all curr s i =
  if unsentive_cmp (getEvent curr) s = true ||
     i = (string_to_int_cmp s ~-1)
     then true
      else false;;

module type EVENT =
  sig
    val addEvent     : event list -> string -> event list
    val getEventId   : event list -> field -> string -> int
    val removeEvent  : event list -> int -> event list
    val printEvents  : event list -> field -> string -> unit
  end

module Event : EVENT =
  struct

  let addEvent l e =
      let newev = [e] in List.append l newev;;

  let getEventId l f s =
      let rec aux acc = function
        | [] -> -1
        | head::tail -> match f with
                        | All -> if cmp_all head s acc = true then acc else aux (acc + 1) tail
                        | Id -> if acc = int_of_string s then acc else aux (acc + 1) tail
                        | What -> if String.compare (getEvent head) s = 0 then acc else aux (acc + 1) tail
          in aux 0 l;;

  let rec removeEvent l n =
      if n < 0 || n > List.length l
        then raise (Remove_Using_An_Invalid_Id)
      else
      if List.length l <= 0
        then raise (Remove_Impossible_On_An_Empty_List)
      else
      match l with
          | [] -> []
          | head::tail -> if n = 0 then tail else head::removeEvent tail (n-1);;

    let printEvents l f s =
      let rec aux acc = function
          | [] -> print_string ""
          | head::tail when s = "" -> printAll head acc ; aux (acc + 1) tail
          | head::tail -> match f with
                          | All ->  if cmp_all head s acc = true then printAll head acc ; aux (acc + 1) tail
                          | Id -> if acc = (string_to_int_cmp s ~-1) then printAll head acc ; aux (acc + 1) tail
                          | What -> if unsentive_cmp (getEvent head) s = true then printAll head acc ; aux (acc + 1) tail
            in aux 0 l;;
  end;;
