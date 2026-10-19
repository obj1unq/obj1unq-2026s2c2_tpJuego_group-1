import juego.*
import jugador.*


object fondoInterfaz {

    
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
    return "aguaIcono.png"
  } 
}

object personajeHilo {

  var property position = game.at(2, 11) 
  const property blanco = "FFFFFFFF"

  method text() {
    return  (jugador.hilo()).toString()
  }

  method textColor() {
    return blanco
  }

  method image() {
    return "telaArana.png"
  }
}



  object personajeMadera {

  var property position = game.at(5, 12) 
  const property blanco = "FFFFFFFF"

  method text() {
    return  (jugador.madera()).toString()
  }

  method textColor() {
    return blanco
  }

  method image() {
    return "maderaIcono.png"
  }

}