type contact = (string * string * int * string * int);;

let create f l a e p = (f, l, a, e, p);;
let print s = Printf.printf "%s" s
