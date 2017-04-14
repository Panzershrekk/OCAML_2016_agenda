open Agenda;;
open Contact;;
open Printf

let c = Contact.create "Guillaume" "Collet" 25 "guillaume.collet@epitech.eu" "01 84 07 42 10";;

let d = Contact.createTu ("Mecasse", "lescouilles", 36, "mecass.lescouilles@epitech.eu", "OSEF");;
let data = [c];;
let empty = [];;

let one_data = Agenda.addContact data ("Mécasse", "lescouilles", 16, "mecass.lescouilles@epitech.eu", "OSEF");;
let one_data = Agenda.addContact one_data ("BILLLLLLLLLLLLLLLLLLLLLLY", "billy", 36, "billy@epitech.eu", "OSEF");;
let one_data = Agenda.addContact one_data ("poil", "liop", 36, "poil.liop@epitech.eu", "09 09 09 09 08 12");;
let one_data = Agenda.addContact one_data ("guillaume", "cauchoix", 20, "guillaume.cauchoix@epitech.eu", "01 02 03 04 05");;
let one_data = Agenda.addContact one_data ("thomas", "fossaert", 20, "thomas.fossaert@epitech.eu", "02 99 67 65 76");;
let one_data = Agenda.addContact one_data ("quentin", "baudet", 21, "quentin.baudet@epitech.eu", "03 20 90 03 911");;
let one_data = Agenda.addContact one_data ("pierre-henri", "dewavrin", 26, "p.h@epitech.eu", "90 21 98 76 45");;
let one_data = Agenda.addContact one_data ("blabla", "thomas", 26, "blabla.thomas@epitech.eu", "08 51 68 80 21");;


let d = Agenda.getContactId one_data Phone "bbbbbb";;
printf "%i\n" d;;

(*Agenda.replaceContact one_data 2 ("Jean", "Pierre", 12, "jeanpierre@epitech.eu", "PERNAUD");;*)
Agenda.printContacts one_data FirstName "";;
Printf.printf "\n";;

let one_data = Agenda.removeContact one_data 2;;

Agenda.printContacts one_data LastName "BauDet";;

Agenda.printContacts one_data FirstName "Guillaume";;
Printf.printf "\n";;

Agenda.printContacts one_data Age "20f";;
Printf.printf "\n";;
