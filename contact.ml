type contact     = (string * string * int * string * string)

let capitalize str = String.uppercase_ascii str;;

let create f l a e p = (f, l, a, e, p)
let createTu (f, l, a, e, p) = (f, capitalize l, a, e, p)

let getFn (f, _, _, _, _) = f
let getLn (_, l, _, _, _) = l
let getAge (_, _, a, _, _) = a
let getMail (_, _, _, e, _) = e
let getNb (_, _, _, _, p) = p

let str_sub s x =
  if String.length s < x
    then s
  else
    let buff = Buffer.create 0 in Buffer.add_string buff s ; Buffer.sub buff 0 x

let printFn s =
    print_string (str_sub (getFn s) 16) ; print_string " "

let printLn s =
    print_string (str_sub (getLn s) 16)  ; print_string " "

let printAge s =
    print_string (str_sub (string_of_int (getAge s)) 4) ; print_string " "

let printMail s =
    print_string (str_sub (getMail s) 32) ; print_string " "

let printNb s =
    print_string (str_sub (getNb s) 14) ; print_endline ""

let printId i =
    print_string (str_sub (string_of_int i) 4) ; print_string " "

let printAll s i =
    printId i; printFn s ; printLn s ; printAge s ; printMail s ; printNb s
