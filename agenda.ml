(*open Contact;;*)
type field = All | Id | FirstName | LastName | Age | Email | Phone;;

module type AGENDA =
  sig
    val addContact     : Contact.contact list -> string * string * int * string * string -> Contact.contact list
    (*val getContactId   : Contact.contact list -> field -> string -> int
    val removeContact  : Contact.contact list -> int -> Contact.contact list
    val replaceContact : Contact.contact list -> int -> string * string * int * string * string -> Contact.contact list*)
    val printContacts  : Contact.contact list -> field -> string -> unit
  end

module Agenda : AGENDA =
  struct
    let addContact l c =
      let newco = [Contact.createTu c] in List.append l newco;;

    (*let printContacts l f s = match f with
      | All -> Printf.printf("bonjour")
      | Id -> Printf.printf("id")
      | FirstName -> Printf.printf("fn")
      | LastName -> Printf.printf("ln")
      | Age -> Printf.printf("ag")
      | Email -> Printf.printf("mail")
      | Phone -> Printf.printf("phone")*)

      let rec printContacts l f s = match l with
        | head::tail -> Printf.printf "%s\n" (Contact.getLn head) ; printContacts tail f s
        | [] -> Printf.printf "Done\n"
  end;;
