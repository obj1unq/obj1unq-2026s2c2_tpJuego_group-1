import juego.jugador


object interfaz {

    
  var property position = game.at(0,11)

  method image() {
    return "interfaz.png"
  }


}



object personajeVida {

  var property position = game.at(7, 12) 

  method text() {
    return  (jugador.vidaActualmente()).toString()
  }

  method image() {
    return "corazon.png"
  }

  
}