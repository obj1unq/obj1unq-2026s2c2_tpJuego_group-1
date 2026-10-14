import juego.*
import jugador.*


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

object personajeHidratacion {

  var property position = game.at(7, 11) 
  const property blanco = "FFFFFFFF"

  method text() {
    return  (jugador.nivelDeAgua()).toString()
  }

  method textColor() {
    return blanco
  }

  method image() {
    return "agua.png"
  } 
}