import juego.jugador


object interfaz {

    
  var property position = game.at(0,11)

  method image() {
    return "interfaz.png"
  }


}



object personajeVida {

  var property position = game.at(7, 12) 
  const property blanco = "FFFFFFFF"

  method text() {
    return  (jugador.vidaActualmente()).toString()
  }

  method textColor() {
    return blanco
  }

  method image() {
    return "corazon.png"
  } 
}