open Agenda;;
open Contact;;
open Event;;
open Printf;;

printf "*********************AGENDA************************"

let c = Contact.create "Guillaume" "Collet" 25 "guillaume.collet@epitech.eu" "01 84 07 42 10";;

let d = Contact.createTu ("Mecasse", "lescouilles", 36, "mecass.lescouilles@epitech.eu", "01 84 07 42 10");;
let data = [c];;
let empty = [];;

let one_data = Agenda.addContact data ("Mécasse", "lescouilles", 16, "mecass.lescouille@h.eu", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("BILLLLLLLLLLLLLLLLLLLLLLY", "billy", 36, "billy@h.eu", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("jean-paul", "kosef", 53, "jp.josef@j.eu", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("poil", "liop", 36, "poil.liop@epitech.eu", "09 09 09 09 08");;
let one_data = Agenda.addContact one_data ("     guil     laume    ", "    cauchoix    ", 20, "guillaume.cauchoix@epitech.eu", "01 02 03 04 05");;
let one_data = Agenda.addContact one_data ("thomas", "fossaert", 20, "thomas.fossaert@epitech.eu", "02 99 67 65 76");;
let one_data = Agenda.addContact one_data ("quentin", "baudet", 21, "quentin.baudet@epitech.eu", "03 20 90 09 90");;
let one_data = Agenda.addContact one_data ("pierre-henri", "dewavrin", 26, "p.h@epitech.eu", "00 21 98 76 45");;
let one_data = Agenda.addContact one_data ("blabla", "thomas", 26, "blabla.thomas@epitech.eu", "08 51 68 80 21");;
let one_data = Agenda.addContact one_data ("guillaume", "cauchk", 53, "jp.josef@epitech.eu", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("jean-paul", "josef", 53, "jp.josef@epitech.eu", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("a", "alphabet", 53, "a@b.c", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("bilbo", "saquet", 53, "a@b.c", "02 02 02 02 02");;
let one_data = Agenda.addContact one_data ("bilba", "saquet", 53, "a@b.c", "02 02 02 02 02");;

let d = Agenda.getContactId one_data Phone "bbbbbb";;
printf "%i\n" d;;

let one_data = Agenda.replaceContact one_data 0 ("Jean", "Pierre", 12, "jeanpierre@epitech.eu", "01 84 07 42 10");;
Agenda.printContacts one_data FirstName "";;
Printf.printf "\n";;

let one_data = Agenda.removeContact one_data 2;;

Agenda.printContacts one_data LastName "BauDet";;

Agenda.printContacts one_data FirstName "Guillaume";;
Printf.printf "\n";;

Agenda.printContacts one_data Age "20f";;
Printf.printf "\n";

printf "******************EVENT****************\n";;


let event = [];;
let event = Event.addEvent event ("01/03/2011", "18.00","Rdv avec le médecin");;
let event = Event.addEvent event ("21/06/2009", "16.59","Epilation du torse");;

Event.printEvents event All "";;
