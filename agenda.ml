type field = All | Id | FirstName | LastName | Age | Email | Phone;;
exception Remove_Using_An_Invalid_Id of string;;
exception Remove_Impossible_On_An_Empty_List of string


module type AGENDA =
  sig
    val addContact     : Contact.contact list -> string * string * int * string * string -> Contact.contact list
    (*val getContactId   : Contact.contact list -> field -> string -> int*)
    val removeContact  : Contact.contact list -> int -> Contact.contact list
    val replaceContact : Contact.contact list -> int -> string * string * int * string * string -> Contact.contact list
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

    let rec removeContact l n =
      if n < 0 || n > List.length l
        then raise (Remove_Using_An_Invalid_Id "Invalid ID")
      else
      if List.length l <= 0
        then raise (Remove_Impossible_On_An_Empty_List "Empty")
      else
        match l with
          | [] -> []
          | head::tail -> if n = 0 then tail else head::removeContact tail (n-1);;

    let rec replaceContact l n tuple = match l with
      | [] -> l
      | head::tail -> if n = 0 then (Contact.createTu tuple)::tail else replaceContact tail (n-1) tuple;;


    let rec printContacts l f s = match l with
      | [] -> Printf.printf "\n"
      | head::tail -> match f with
                      | All -> Printf.printf "%i %s %s %i %s %s\n" 0 (Contact.getLn head) (Contact.getFn head) (Contact.getAge head) (Contact.getMail head) (Contact.getNb head); printContacts tail f s
                      | Id -> print_endline (Contact.getLn head) ; printContacts tail f s
                      | FirstName -> print_endline (Contact.getFn head) ; printContacts tail f s
                      | LastName -> print_endline (Contact.getLn head) ; printContacts tail f s
                      | Age -> print_int (Contact.getAge head) ; print_endline ""; printContacts tail f s
                      | Email -> print_endline (Contact.getMail head) ; printContacts tail f s
                      | Phone -> print_endline (Contact.getNb head) ; printContacts tail f s;;
  end;;
