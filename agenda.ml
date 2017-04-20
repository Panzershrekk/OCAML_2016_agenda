open Contact
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
  *******************************************************************************
  *                               *AGENDA*                               *
  *******************************************************************************
  *)


module Agenda : AGENDA =
  struct
    let addContact l c =
      if Contact.getAge (Contact.createTu c) < 0 || Contact.getAge (Contact.createTu c) > 120
        then raise (Add_Contact_With_Invalid_Data)
      else
      if Contact.getFn (Contact.createTu c) = "" ||
         Contact.getLn (Contact.createTu c) = "" ||
         String.contains (Contact.getMail (Contact.createTu c)) '@' = false ||
         String.contains_from (Contact.getMail (Contact.createTu c)) (String.index (Contact.getMail (Contact.createTu c)) '@') '.' = false ||
         String.index_from (Contact.getMail (Contact.createTu c)) 0 '@' = 0 ||
         String.rindex_from (Contact.getMail (Contact.createTu c)) (String.length (Contact.getMail (Contact.createTu c)) - 1)  '.' = (String.length (Contact.getMail (Contact.createTu c)) - 1) ||
         String.index_from (Contact.getMail (Contact.createTu c)) (String.index (Contact.getMail (Contact.createTu c)) '@') '.' = (String.index (Contact.getMail (Contact.createTu c)) '@') + 1 ||
         Contact.checkNumber (Contact.getNb (Contact.createTu c)) = false
        then raise (Add_Contact_With_Invalid_Data)
      else
        let newco = [Contact.createTu c] in List.sort (fun x y -> if x > y then 1 else 0)
                                                                  (List.append l newco);;

(*
*******************************************************************************
*                               *GETCONTACTID*                               *
*******************************************************************************
*)

    let getContactId l f s =
      let rec aux acc = function
        | [] -> -1
        | head::tail -> match f with
                        | All -> if Contact.cmp_all head s acc = true then acc else aux (acc + 1) tail
                        | Id -> if Contact.checkStr (string_of_int acc) s = true then acc else aux (acc + 1) tail
                        | FirstName -> if Contact.checkStr (Contact.getFn head) s = true then acc else aux (acc + 1) tail
                        | LastName -> if Contact.checkStr (Contact.getLn head) s = true then acc else aux (acc + 1) tail
                        | Age -> if Contact.checkStr (string_of_int (Contact.getAge head)) s = true then acc else aux (acc + 1) tail
                        | Email -> if Contact.checkStr (Contact.getMail head) s = true then acc else aux (acc + 1) tail
                        | Phone -> if Contact.checkStr (Contact.getNb head) s = true then acc else aux (acc + 1) tail
        in aux 0 l;;

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

    let replaceContact l n tuple =
      let rList = removeContact l n
      in addContact rList tuple;;

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
                        | All ->  if Contact.cmp_all head s acc = true then Contact.printAll head acc ; aux (acc + 1) tail
                        | Id -> if Contact.checkStr (string_of_int acc) s = true then Contact.printAll head acc ; aux (acc + 1) tail
                        | FirstName -> if Contact.checkStr (Contact.getFn head) s = true then Contact.printAll head acc ; aux (acc + 1) tail
                        | LastName -> if Contact.checkStr  (Contact.getLn head) s = true then Contact.printAll head acc ; aux (acc + 1) tail
                        | Age -> if Contact.checkStr (string_of_int (Contact.getAge head)) s = true then Contact.printAll head acc ; aux (acc + 1) tail
                        | Email -> if Contact.checkStr  (Contact.getMail head) s = true then Contact.printAll head acc ; aux (acc + 1) tail
                        | Phone -> if Contact.checkStr  (Contact.getNb head) s = true then Contact.printAll head acc ; aux (acc + 1) tail
      in aux 0 l;;
  end;;
