//
//  main.swift
//  Generador de datos
//
//  Created by Juan Casado Ballesteros on 10/22/18.
//  Copyright © 2018 Juan Casado Ballesteros. All rights reserved.
//

import Foundation

let separadorTupla = "\n"
let separadorDato = ","
let cantidadGrupos = 2
let cantidadDiscos = 10
let cancionesPorDisco = 12
let cantidadMusicos = 10
let cantidadConciertos = 20
let cantidadTickets = 40
let cantidadConcietosPorGrupo = 10
let generos = ["clásica", "blues", "jazz", "rock&roll", "góspel", "soul", "rock", "metal", "funk", "disco", "techno", "pop", "reggae",              "hiphop", "salsa"]
let paises = ["España", "Francia", "Reino Unido", "Alemania", "Italia", "Australia", "Estados Unidos", "Irlanda", "Grecia", "Portugal",             "Mexico", "Argentina", "Brasil", "Luxemburgo", "Andorra", "Bélgica", "Holanda", "Dinamarca", "Canadá", "Noruega"]
let formatos = ["CD", "Vinilo", "Digital"]
let hash = ["T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"]

func dniLetter (of dni: Int) -> String{
    var sum = 0
    var dni = dni
    while dni != 0 {
        sum += dni%10
        dni /= 10
    }
    return hash[sum % hash.count]
}

func save (data :String, in file :String){
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(file)
        do {
            try data.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {}
    }
}

func generateDisc(with disc :Int) -> String{                        //Disco
    var str = ""
    let disc_str = String(disc)
    str += disc_str + separadorDato                                 //Número disco
    str += "Titulo: " + disc_str + separadorDato                    //Título
    str += String(Int.random(in: 1980...2018)) + "-" +
        String(Int.random(in: 1...12)) + "-" +
        String(Int.random(in: 1...28)) + separadorDato              //Fecha
    str += generos.randomElement()! + separadorDato                 //Genero
    str += formatos[disc % formatos.count] + separadorDato          //Formato
    str += String((disc % cantidadGrupos) + 1) + separadorTupla     //Grupo
    return str
}

func generateSong (with song :Int) -> String{                       //Cancion
    var str = ""
    let song_str = String(song)
    str += song_str + separadorDato                                 //Numero cancion
    str += "Nombre: " + song_str + separadorDato                    //Nombre
    str += "Compositor: " + song_str + separadorDato                //Compositor
    str += String(Int.random(in: 1980..<2019)) + "-" +
        String(Int.random(in: 1..<13)) + "-" +
        String(Int.random(in: 1..<29)) + separadorDato              //Fecha
    str += "00:"+String(Int.random(in: 2...6)) + ":" +
        String(Int.random(in: 0...59))  + separadorDato             //Duracion
    str += String(song % cantidadDiscos + 1) + separadorTupla       //Numero disco
    return str
}

func generateGroup(with group :Int) -> String{                      //Grupo
    var str = ""
    let group_str = String(group)
    str += group_str + separadorDato                                //Numero grupo
    str += "Grupo: " + group_str + separadorDato                    //Nombre grupo
    str += generos.randomElement()! + separadorDato                 //Genero
    str += String(Int.random(in: 1...500)) + separadorDato          //Pais
    str += "http://www.Grupo:" +
        group_str + ".com" + separadorTupla                         //Web
    return str
}

func generateMusician(with musician :Int) -> String{                //Musico
    var str = ""
    let musician_str = String(musician)
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumIntegerDigits = 8
    str +=  musician_str + separadorDato                            //Numero musico
    str += numberFormatter.string(from: NSNumber(value: musician))!
        + dniLetter(of: musician) + separadorDato                   //DNI
    str += "Nombre: " + musician_str + separadorDato                //Nombre
    str += "Direccion: " + musician_str + separadorDato             //Direccion
    str += String(Int.random(in: 10000...99999))
        + separadorDato                                             //CP
    str += "Ciudad: " + musician_str + separadorDato                //Ciudad
    str += "Provincia: " + musician_str + separadorDato             //Provincia
    str += String(Int.random(in: 100000000...999999999))
        + separadorDato                                             //Teléfono
    str += "Instrumento: " + musician_str + separadorDato           //Provincia
    str += String((musician%cantidadGrupos)+1) + separadorTupla     //Grupo
    return str
}
func generateMusicianR(with musician :Int) -> String{               //MusicoR
    var str = ""
    let musician_str = String(musician)
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumIntegerDigits = 8
    str +=  musician_str + separadorDato                            //Numero musico
    str += numberFormatter.string(from: NSNumber(value: musician))!
        + dniLetter(of: musician) + separadorDato                   //DNI
    str += "Nombre: " + musician_str + separadorDato                //Nombre
    str += "Direccion: " + musician_str + separadorDato             //Direccion
    str += String(Int.random(in: 10000...99999))
        + separadorDato                                             //CP
    str += "Ciudad: " + musician_str + separadorDato                //Ciudad
    str += "Provincia: " + musician_str + separadorDato             //Provincia
    str += String(Int.random(in: 100000000...999999999))
        + separadorDato                                             //Teléfono
    str += "Instrumento: " + musician_str + separadorDato           //Provincia
    str += String(Int.random(in: 1...cantidadGrupos)) + separadorTupla//Grupo
    return str
}

func generateConcert(with concert: Int) -> String{                  //Concierto
    var str = ""
    let concert_str = String(concert)
    str += concert_str + separadorDato                              //Numero concierto
    str += String(Int.random(in: 1980..<2019)) + "-" +
        String(Int.random(in: 1..<13)) + "-" +
        String(Int.random(in: 1..<29)) + separadorDato              //Fecha
    str += paises[concert%paises.count] + separadorDato             //País
    str += "Ciudad: " + concert_str + separadorDato                 //Ciudad
    str += "Recinto: " + concert_str + separadorTupla               //Recinto
    return str
}

func generatePlay(with play : Int) -> String{                        //Plays
    var str = ""
    str += String(((play +
        (play/cantidadConciertos)) % cantidadGrupos + 1))
        + separadorDato                                                 //Grupo
    str += String((play % cantidadConciertos + 1)) + separadorTupla //Concierto
    return str
}

func generateTicket(with ticket: Int) -> String{                    //Tickets
    var str = ""
    let play_str = String (ticket)
    str += play_str + separadorDato                                 //Numero
    str += "Localidad: " + play_str + separadorDato                 //Localidad
    str += String(Int.random(in: 20...100)) + separadorDato         //Precio
    str += "Usuario: " + play_str + separadorDato                   //Usuario
    str += String(Int.random(in: 1...cantidadConciertos))           //Concierto
        + separadorTupla
    return str
}

func generateDiscs(){
    var discos = ""
    for disco in 1...cantidadDiscos{
        discos += generateDisc(with: disco)
    }
    save (data: discos, in: "discos.txt")
}

func generateSongs(){
    var canciones = ""
    for cancion in 1...cantidadDiscos*cancionesPorDisco{
        canciones += generateSong(with: cancion)
    }
    save (data: canciones, in: "canciones.txt")
}

func generateGroups(){
    var groups = ""
    for group in 1...cantidadGrupos{
        groups += generateGroup(with: group)
    }
    save (data: groups, in: "grupos.txt")
}

func generateMusicians(){
    var musicians = ""
    for musician in 1...cantidadGrupos{
        musicians += generateMusician(with: musician)
    }
    for musician in cantidadGrupos+1...cantidadMusicos{
        musicians += generateMusicianR(with: musician)
    }
    save (data: musicians, in: "musicos.txt")
}

func generateConcerts(){
    var concerts = ""
    for concert in 1...cantidadConciertos{
        concerts += generateConcert(with: concert)
    }
    save (data: concerts, in: "conciertos.txt")
}

func generatePlays(){
    var plays = ""
    for play in 1...cantidadGrupos * cantidadConcietosPorGrupo{
        plays += generatePlay(with: play)
    }
    save (data: plays, in: "plays.txt")
}

func generateTickets(){
    var tickets = ""
    for ticket in 1...cantidadTickets{
        tickets += generateTicket(with: ticket)
    }
    save (data: tickets, in: "tickets.txt")
}


generateDiscs()
generateSongs()
generateGroups()
generateMusicians()
generateConcerts()
generatePlays()
generateTickets()
