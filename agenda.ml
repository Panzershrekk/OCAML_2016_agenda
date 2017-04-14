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
    *******************************************************************************
    *                               *REMOVECONTACT*                               *
    *******************************************************************************
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
    *******************************************************************************
    *                               *REPLACECONTACT*                               *
    *******************************************************************************
    *)

    let rec replaceContact l n tuple = match l with
      | [] -> l
      | head::tail -> if n = 0 then (Contact.createTu tuple)::tail else head::replaceContact tail (n-1) tuple;;

    (*
    *******************************************************************************
    *                               *PRINTCONTACTS*                               *
    *******************************************************************************
    *)


    let printContacts l f s =
      let rec aux acc = function
        | [] -> print_string ""
        | head::tail when s = "" -> Contact.printAll head acc ; aux (acc + 1) tail
        | head::tail -> match f with
                        | All ->  if String.compare (Contact.getFn head) s = 0 then Contact.printAll head acc else aux (acc + 1) tail
                        | Id -> if acc = int_of_string s then Contact.printAll head acc else aux (acc + 1) tail
                        | FirstName -> if String.compare (Contact.getFn head) s = 0 then Contact.printAll head acc else aux (acc + 1) tail
                        | LastName -> if String.compare (Contact.getLn head) s = 0 then Contact.printAll head acc else aux (acc + 1) tail
                        | Age -> if Contact.getAge head = int_of_string s then Contact.printAll head acc else aux (acc + 1) tail
                        | Email -> if String.compare (Contact.getMail head) s = 0 then Contact.printAll head acc else aux (acc + 1) tail
                        | Phone -> if String.compare (Contact.getNb head) s = 0 then Contact.printAll head acc else aux (acc + 1) tail
      in aux 0 l;;
  end;;
