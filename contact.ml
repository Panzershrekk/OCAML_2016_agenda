module type CONTACT =
  sig
    type contact = (string * string * int * string * string)

    val create : string -> string -> int -> string -> string -> contact
    val createTu : string * string * int * string * string -> contact
    val getFn : contact -> string
    val getLn : contact -> string
    val getAge : contact -> int
    val getMail : contact -> string
    val getNb : contact -> string

    val capitalize : string -> string
    val capitalize_n : string -> string
    val str_sub : string -> int -> string
    val addString : string -> int -> string
    val printElema : string -> int -> string

    val printFn: contact -> unit
    val printLn: contact -> unit
    val printAge: contact -> unit
    val printMail: contact -> unit
    val printNb: contact -> unit
    val printId: int -> unit
    val printAll: contact -> int -> unit

    val unsentive_cmp: string -> string -> bool
    val string_to_int_cmp : string -> int -> int
    val cmp_all : contact -> string -> int -> bool
    val nbrValidity : string -> int -> bool
    val checkNumber : string -> bool

    val checkStr2 : string -> string -> bool
    val checkStr : string -> string -> bool
  end

module Contact : CONTACT =
  struct

type contact = (string * string * int * string * string)

let capitalize str = String.uppercase_ascii str;;
let capitalize_n str = String.mapi (fun i c -> if i = 0 || String.get str (i-1) = '-' || String.get str (i-1) = '\'' || String.get str (i-1) = ' ' then Char.uppercase_ascii c else c) str;;

let create f l a e p = (f, l, a, e, p)
let createTu (f, l, a, e, p) = (capitalize_n (String.lowercase_ascii (String.trim f)), capitalize (String.trim l), a, e, p)

let getFn (f, _, _, _, _) = f
let getLn (_, l, _, _, _) = l
let getAge (_, _, a, _, _) = a
let getMail (_, _, _, e, _) = e
let getNb (_, _, _, _, p) = p

let    str_sub s x =
  if String.length s < x
    then s
  else
    let buff = Buffer.create 0
  in Buffer.add_string buff s ; Buffer.sub buff 0 x

let addString str x =
  let buff = Buffer.create 0
in Buffer.add_string buff str ;
Buffer.add_string buff "                                    " ; Buffer.sub buff 0 x

let printElema str x =
  if x < String.length str
    then str_sub str x
  else
    addString str x


let printFn s =
    print_string (printElema (getFn s) 16);;

let printLn s =
    print_string (printElema (getLn s) 16);;

let printAge s =
    print_string (printElema (string_of_int (getAge s)) 4);;

let printMail s =
    print_string (printElema (getMail s) 32);;

let printNb s =
    print_string (printElema (getNb s) 14) ; print_endline ""

let printId i =
    print_string (printElema (string_of_int i) 4);;

let printAll s i =
    printId i; printFn s ; printLn s ; printAge s ; printMail s ; printNb s

let unsentive_cmp fstr sstr =
    if String.compare (String.lowercase_ascii fstr) (String.lowercase_ascii sstr) = 0 then true else false;;

let string_to_int_cmp str default =
  try
    (int_of_string str)
  with
    | Failure _ -> default

let checkStr2 str comp =
    if String.equal (String.lowercase_ascii str) (String.lowercase_ascii comp) = true then true else false;;

let checkStr str comp =
    let rec aux acc = match acc with
      | acc when acc > String.length str -> false
      | acc when String.length str < String.length comp -> false
      | acc when String.length str = String.length comp && String.equal (String.lowercase_ascii str) (String.lowercase_ascii comp) = false -> false
      | acc when String.length str - acc < String.length comp -> false
      | _  -> if checkStr2 (String.sub str acc (String.length comp)) comp = true then true else aux (acc+1)
    in aux 0;;

let cmp_all curr s i =
  if checkStr (getFn curr) s = true ||
     checkStr (getLn curr) s = true ||
     checkStr (getMail curr) s = true ||
     checkStr (getNb curr) s = true ||
     checkStr (string_of_int (getAge curr)) s = true ||
     checkStr (string_of_int i) s = true
  then true
  else false;;

let rec nbrValidity str i = match String.get str i with
  | '0' .. '9' when i = 13 -> true
  | '0' .. '9' -> true && nbrValidity str (i+1)
  | ' ' when i = 2 || i = 5 || i = 8 || i = 11 -> true && nbrValidity str (i+1)
  | _ -> false


let checkNumber str =
  if String.length str = 14 &&
     String.index_from str 0 '0' = 0 &&
     nbrValidity str 0 = true
     then true
  else false;;
end;;
