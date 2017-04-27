open Agenda;;
open Contact;;
open Event;;
open Printf;;

printf "*********************AGENDA************************\n"

let data = [];;
let empty = [];;

let one_data = Agenda.addContact data ("Guillaume", "collet", 36, "Guillaume.collet@h.eu", "02 54 05 72 11");;
let one_data = Agenda.addContact one_data ("Matthieu-Victorien", "DE LA JARDINIERE", 12, "matthieu-victorien.jardiniere@epitech.eu", "01 41 14 92 25");;
let one_data = Agenda.addContact one_data ("jo", "la frite", 42, "jo.lafrite@epitech.eu", "08 34 07 78 10");;

let d = Agenda.printContacts one_data All "";;

printf "%i\n" (Agenda.getContactId one_data All "Matthieu");;
