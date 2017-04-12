open Agenda

let c = Contact.create "Guillaume" "Collet" 25 "guillaume.collet@epitech.eu" "01 84 07 42 10";;

let d = Contact.createTu ("Mecasse", "lescouilles", 36, "mecass.lescouilles@epitech.eu", "OSEF");;
let data = [c];;

let one_data = Agenda.addContact data ("Mecasse", "lescouilles", 36, "mecass.lescouilles@epitech.eu", "OSEF");;

Agenda.printContacts one_data LastName "s";;
