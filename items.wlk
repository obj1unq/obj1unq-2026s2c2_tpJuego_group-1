import jugador.*
import wollok.game.*


class Item { //Clase Super/General De todos los tipos de items
    method image()

    method position()

    method interactuarConJugador(jugador)

}

class ItemEquipable inherits Item{ //Clase Particular de item que es equipable por el jugador

  var posicion = self.posicionOriginalEnJuego() 

  method puedeTalar() {
    return false
  }

  override method position() {
    return posicion
  }

  method posicionOriginalEnJuego() 

  method volverAPosicion() {
    posicion = self.posicionOriginalEnJuego()
  }

  override method interactuarConJugador(jugador) {
    jugador.agregarAlInventario(self)
    posicion = self.posicionEnInventario()
  }

  method posicionEnInventario()

}

object telaDeAraña inherits Item{
  override method image() = "telaArana.png"
  
  override method position() = game.at(2,4)

  override method interactuarConJugador(jugador) {
    jugador.agregarHilo()
    game.removeVisual(self)
  }

}

object serrucho inherits ItemEquipable{
  
  override method puedeTalar() {
    return true
  }

  override method posicionOriginalEnJuego() {
    return game.at(8,4)
  }

  override method posicionEnInventario() {
    return  game.at(0,12)
  }

  override method image() = "serrucho.png"

}

object llave inherits ItemEquipable{
  override method image() = "llave.png"

  override method posicionEnInventario(){
    return game.at(1,12)
  }
  override method posicionOriginalEnJuego() {
    return game.at(3, 2)
  }
}