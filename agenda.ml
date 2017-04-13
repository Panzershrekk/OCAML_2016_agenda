type field = All | Id | FirstName | LastName | Age | Email | Phone;;

module type AGENDA =
  sig
    val addContact     : Contact.contact list -> string * string * int * string * string -> Contact.contact list
    (*val getContactId   : Contact.contact list -> field -> string -> int*)
    val removeContact  : Contact.contact list -> int -> Contact.contact list
    (*val replaceContact : Contact.contact list -> int -> string * string * int * string * string -> Contact.contact list*)
    val printContacts  : Contact.contact list -> field -> string -> unit
  end

module Agenda : AGENDA =
  struct
    let addContact l c =
      let newco = [Contact.createTu c] in List.append l newco;;

    (*let getContactId l f s =
      let rec aux i = function
        | [] -> -1
        | head::tail -> match f with
                        | FirstName -> if String.compare s (Contact.getFn head) = 0 then i else -1(*head::aux (i+1) tail*)
                        | LastName -> if String.compare s (Contact.getFn head) = 0 then i else -1(*head::aux (i+1) t*)
                        | Age -> if String.compare s (Contact.getFn head) = 0 then i else -1(*head::aux (i+1) t*)
                        | Email -> if String.compare s (Contact.getFn head) = 0 then i else -1(*head::aux (i+1) t*)
                        | Phone -> if String.compare s (Contact.getFn head) = 0 then i else -1(*head::aux (i+1) t*)
      in aux i l;;*)

      let rec removeContact l n = match l with
       | [] -> []
       | head::tail -> if n = 0 then tail else head::removeContact tail (n-1);;

    let rec printContacts l f s = match l with
      | [] -> Printf.printf "\n"
      | head::tail -> match f with
                      | All -> Printf.printf "%i %s %s %i %s %s\n" 0 (Contact.getLn head) (Contact.getFn head) (Contact.getAge head) (Contact.getMail head) (Contact.getNb head); printContacts tail f s
                      | Id -> Printf.printf "%s\n" (Contact.getLn head) ; printContacts tail f s
                      | FirstName -> Printf.printf "%s\n" (Contact.getFn head) ; printContacts tail f s
                      | LastName -> Printf.printf "%s\n" (Contact.getLn head) ; printContacts tail f s
                      | Age -> Printf.printf "%i\n" (Contact.getAge head) ; printContacts tail f s
                      | Email -> Printf.printf "%s\n" (Contact.getMail head) ; printContacts tail f s
                      | Phone -> Printf.printf "%s\n" (Contact.getNb head) ; printContacts tail f s;;
  end;;
