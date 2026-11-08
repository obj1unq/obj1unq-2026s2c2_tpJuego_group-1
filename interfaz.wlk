import juego.*
import jugador.*



class PersonajeInformacion {
  const property blanco = "FFFFFFFF"

  method textColor() {
    return blanco
  }

  method position() {
    return self.posicionEnPantalla()
  }

  method text() {
    return  self.valorAMostrar().toString()
  }

  method posicionEnPantalla()

  method valorAMostrar()

  method image()
}


object fondoInterfaz{

  var property position = game.at(0,11)

  method image() {
    return "interfaz.png"
  }

}


object personajeVida inherits PersonajeInformacion{

  override method posicionEnPantalla(){
    return game.at(7, 12) 
  }

  override method valorAMostrar() {
    return jugador.vidaActualmente()
  }

  override method image() {
    return "corazon.png"
  } 

}

object personajeHidratacion inherits PersonajeInformacion{

  override method valorAMostrar() {
    return  jugador.nivelDeAgua()
  }

  override method posicionEnPantalla(){
    return game.at(7, 11) 
  }

  override method image() {
    return "aguaIcono.png"
  } 
}

object personajeHilo inherits PersonajeInformacion{

  override method valorAMostrar() {
    return  jugador.hilo()
  }

  override method posicionEnPantalla(){
    return game.at(5, 11)  
  }

  override method image() {
    return "hiloIcono.png"
  }
}



object personajeMadera inherits PersonajeInformacion{

  override method valorAMostrar() {
    return  jugador.madera()
  }

  override method posicionEnPantalla(){
    return game.at(5, 12)   
  }

  override method image() {
    return "maderaIcono.png"
  }

}



object personajeInventario inherits PersonajeInformacion{

  override method valorAMostrar() {
    return " "
  }

  override method posicionEnPantalla(){
    return game.at(0, 12) 
  }

  override method image() {
    return "maderaInventarioVacio.png"
  }

}