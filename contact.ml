type contact     = (string * string * int * string * string)


let create f l a e p = (f, l, a, e, p)
let createTu (f, l, a, e, p) = (f, l, a, e, p)

let getFn (f, _, _, _, _) = f
let getLn (_, l, _, _, _) = l
let getAge (_, _, a, _, _) = a
let getMail (_, _, _, e, _) = e
let getNb (_, _, _, _, p) = p
let print (f, l, a, e, p) = Printf.printf "I m %s %s, Im %i, my email is %s and my phone is %s.\n" f l a e p
