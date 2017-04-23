open Agenda;;
open Contact;;
open Event;;
open Printf;;

printf "*********************AGENDA************************\n"

let c = Contact.create "Guillaume" "Collet" 25 "guillaume.collet@epitech.eu" "01 84 07 42 10";;

let d = Contact.createTu ("Guillaume", "collet", 36, "Guillaume.collet@h.eu", "02 54 05 72 11");;
let e = Contact.createTu ("Matthieu-Victorien", "DE LA JARDINIERE", 12, "matthieu-victorien.jardiniere@epitech.eu", "01 41 14 92 25");;
let f = Contact.createTu ("jo", "la frite", 42, "jo.lafrite@epitech.eu", "08 34 07 78 10");;

let data = [d;e;f];;
let empty = [];;

(*let one_data = Agenda.addContact data ("Guillaume", "collet", 36, "Guillaume.collet@h.eu", "02 54 05 72 11");;
let one_data = Agenda.addContact one_data ("Matthieu-Victorien", "DE LA JARDINIERE", 12, "matthieu-victorien.jardiniere@epitech.eu", "01 41 14 92 25");;
let one_data = Agenda.addContact one_data ("jo", "la frite", 42, "jo.lafrite@epitech.eu", "08 34 07 78 10");;*)

let d = Agenda.printContacts data All "";;

printf "%i\n" (Agenda.getContactId data All "Matthieu");;

printf "******************EVENT****************\n";;
(*

let event = [];;
let event = Event.addEvent event ("01/03/2011", "18.00","Rdv avec le médecin");;
let event = Event.addEvent event ("31/12/2201", "09.12","Nourir le chien");;
let event = Event.addEvent event ("21/06/2009", "16.59","Epilation du torse");;

Event.printEvents event All "";;
*)
