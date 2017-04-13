open Agenda;;
open Contact;;

let c = Contact.create "Guillaume" "Collet" 25 "guillaume.collet@epitech.eu" "01 84 07 42 10";;

let d = Contact.createTu ("Mecasse", "lescouilles", 36, "mecass.lescouilles@epitech.eu", "OSEF");;
let data = [c];;
let empty = [];;

let one_data = Agenda.addContact data ("Mecasse", "lescouilles", 36, "mecass.lescouilles@epitech.eu", "OSEF");;
let one_data = Agenda.addContact one_data ("billy", "billy", 36, "billy@epitech.eu", "OSEF");;
let one_data = Agenda.addContact one_data ("poil", "liop", 36, "poil.liop@epitech.eu", "09 09 09 09 08 12");;


Agenda.replaceContact one_data 2 ("Jean", "Pierre", 12, "jeanpierre@epitech.eu", "PERNAUD");;
Agenda.printContacts one_data All "s";;
Printf.printf "\n";;

let one_data = Agenda.removeContact empty 0;;

Agenda.printContacts one_data LastName "s";;
Agenda.printContacts one_data Age "s";;
Agenda.printContacts one_data FirstName "s";;
Agenda.printContacts one_data Email "s";;
Agenda.printContacts one_data Phone "s";;

Agenda.printContacts one_data All "s";;
