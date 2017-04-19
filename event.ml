type field = All | Id | Date | Hour | What
type event = (string * string * string)
exception Remove_Using_An_Invalid_Id;;
exception Remove_Impossible_On_An_Empty_List;;
exception Add_Event_With_Invalid_Data;;

let createTu (d, h, e) = (d, h, e)

let getEvent (_, _, e) = e
let getHour (_, h, _) = h
let getDate (d, _, _) = d

let str_sub s x =
  if String.length s < x
    then s
  else
    let buff = Buffer.create 0 in Buffer.add_string buff s ; Buffer.sub buff 0 x

let printDate date =
    print_string (getDate date); print_string " "

let printHour hour =
    print_string (getHour hour); print_string " "

let printEvent event =
    print_string (getEvent event); print_string "\n"

let printId i =
    print_string (str_sub (string_of_int i) 4) ; print_string " "

let printAll s i =
    printId i; printDate s; printHour s ; printEvent s

let unsentive_cmp fstr sstr =
    if String.compare (String.lowercase_ascii fstr) (String.lowercase_ascii sstr) = 0 then true else false;;

let string_to_int_cmp str default =
    try
      (int_of_string str)
    with
      | Failure _ -> default

let cmp_all curr s i =
  if unsentive_cmp (getEvent curr) s = true ||
     unsentive_cmp (getDate curr) s = true ||
     unsentive_cmp (getDate curr) s = true ||
     i = (string_to_int_cmp s ~-1)
     then true
      else false;;

let isValid my_list =
if (string_to_int_cmp (List.hd my_list) ~-1) >= 0 && (string_to_int_cmp (List.hd my_list) ~-1) <= 24 &&
   (string_to_int_cmp (List.nth my_list 1) ~-1) >= 0 && (string_to_int_cmp (List.nth my_list 1) ~-1) <= 59
    then true
   else
    false;;

let validHour str =
  if isValid (String.split_on_char '.' str) = true
    then true
  else
    false;;

let isValidDate my_list =
  if (string_to_int_cmp (List.hd my_list) ~-1) >= 1 && (string_to_int_cmp (List.hd my_list) ~-1) <= 31 &&
     (string_to_int_cmp (List.nth my_list 1) ~-1) >= 1 && (string_to_int_cmp (List.nth my_list 1) ~-1) <= 12 &&
     (string_to_int_cmp (List.nth my_list 2) ~-1) >= 0 && (string_to_int_cmp (List.nth my_list 2) ~-1) <= 9999
    then true else false;;

let validDate str =
  if isValidDate (String.split_on_char '/' str) = true
    then true
  else
    false;;

module type EVENT =
  sig
    val addEvent     : event list -> string * string *string -> event list
    val getEventId   : event list -> field -> string -> int
    val removeEvent  : event list -> int -> event list
    val printEvents  : event list -> field -> string -> unit
  end

module Event : EVENT =
  struct

  let addEvent l e =
    if String.contains (getHour (createTu e)) '.' = false ||
       String.contains_from (getDate (createTu e)) 0 '/' = false ||
       String.contains_from (getDate (createTu e)) 4 '/' = false ||
       validHour (getHour (createTu e)) = false ||
       validDate (getDate (createTu e)) = false
      then raise (Add_Event_With_Invalid_Data)
    else
      let newev = [createTu e] in List.sort (fun x y -> if x < y then 1 else 0) (List.append l newev);;

  let getEventId l f s =
      let rec aux acc = function
        | [] -> -1
        | head::tail -> match f with
                        | All -> if cmp_all head s acc = true then acc else aux (acc + 1) tail
                        | Id -> if acc = int_of_string s then acc else aux (acc + 1) tail
                        | What -> if String.compare (getEvent head) s = 0 then acc else aux (acc + 1) tail
                        | Hour -> if String.compare (getHour head) s = 0 then acc else aux (acc + 1) tail
                        | Date -> if String.compare (getDate head) s = 0 then acc else aux (acc + 1) tail
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
                          | Hour -> if unsentive_cmp (getHour head) s = true then printAll head acc ; aux (acc + 1) tail
                          | Date -> if unsentive_cmp (getDate head) s = true then printAll head acc ; aux (acc + 1) tail
            in aux 0 l;;
  end;;
