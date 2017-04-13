type field = All | Id | FirstName | LastName | Age | Email | Phone;;

(*
**
** Exception
**
*)

exception Remove_Using_An_Invalid_Id;;
exception Remove_Impossible_On_An_Empty_List;;
exception Add_Contact_With_Invalid_Data;;


module type AGENDA =
  sig
    val addContact     : Contact.contact list -> string * string * int * string * string -> Contact.contact list
    val getContactId   : Contact.contact list -> field -> string -> int
    val removeContact  : Contact.contact list -> int -> Contact.contact list
    val replaceContact : Contact.contact list -> int -> string * string * int * string * string -> Contact.contact list
    val printContacts  : Contact.contact list -> field -> string -> unit
  end

(*
*************************************************************************************************************************************
*************************************************************************************************************************************
*)

module Agenda : AGENDA =
  struct
    let addContact l c =
      if Contact.getAge (Contact.createTu c) < 0 || Contact.getAge (Contact.createTu c) > 120
        then raise (Add_Contact_With_Invalid_Data)
      else
        let newco = [Contact.createTu c] in List.append l newco;;

    (*
    *************************************************************************************************************************************
    *************************************************************************************************************************************
    *)

    let getContactId l f s =
      let rec aux l acc = match l with
        | [] -> -1
        | head::tail -> match f with
                        | All -> if String.compare (Contact.getFn head) s = 0 then acc else aux tail acc + 1
                        | Id -> if acc = int_of_string s then acc else aux tail acc + 1
                        | FirstName -> if String.compare (Contact.getFn head) s = 0 then acc else aux tail acc + 1
                        | LastName -> if String.compare (Contact.getLn head) s = 0 then acc else aux tail acc + 1
                        | Age -> if Contact.getAge head = int_of_string s then acc else aux tail acc + 1
                        | Email -> if String.compare (Contact.getMail head) s = 0 then acc else aux tail acc + 1
                        | Phone -> if String.compare (Contact.getNb head) s = 0 then acc else aux tail acc + 1
        in aux l 0;;

    (*
    *************************************************************************************************************************************
    *************************************************************************************************************************************
    *)

    let rec removeContact l n =
      if n < 0 || n > List.length l
        then raise (Remove_Using_An_Invalid_Id)
      else
      if List.length l <= 0
        then raise (Remove_Impossible_On_An_Empty_List)
      else
        match l with
          | [] -> []
          | head::tail -> if n = 0 then tail else head::removeContact tail (n-1);;

    (*
    *************************************************************************************************************************************
    *************************************************************************************************************************************
    *)

    let rec replaceContact l n tuple = match l with
      | [] -> l
      | head::tail -> if n = 0 then (Contact.createTu tuple)::tail else replaceContact tail (n-1) tuple;;

    (*
    *************************************************************************************************************************************
    *************************************************************************************************************************************
    *)


    let rec printContacts l f s = match l with
      | [] -> Printf.printf "\n"
      | head::tail -> match f with
                      | All -> Printf.printf "%i %s %s %i %s %s\n" 0 (Contact.getLn head) (Contact.getFn head) (Contact.getAge head) (Contact.getMail head) (Contact.getNb head); printContacts tail f s
                      | Id -> print_endline (Contact.getLn head) ; printContacts tail f s
                      | FirstName -> print_endline (Contact.getFn head) ; printContacts tail f s
                      | LastName -> print_endline (Contact.getLn head) ; printContacts tail f s
                      | Age -> print_endline (string_of_int (Contact.getAge head)) ; printContacts tail f s
                      | Email -> print_endline (Contact.getMail head) ; printContacts tail f s
                      | Phone -> print_endline (Contact.getNb head) ; printContacts tail f s;;
  end;;
