import wollok.game.*
import juego.*
import jugador.*
import enemigos.*
import interfaz.*

object controladorDeDiaNoche {
    var estado = 1
  method estado() {
    return estado
  }

  method cambiarEstado() {
    if (estado == 6){
      estado = 1
    }else{
      estado += 1
    }
  }

  method position() {
    return game.at(0, 0)
  }

  method image() {
    return "arenaDia" + estado + ".png"
  }
}

object pantallaDeInicio {


  method jugar() {
    game.removeVisual(self)
    game.onTick(20000, "cambirEstado", {=> controladorDeDiaNoche.cambiarEstado()})
    game.onTick(2000, "descontarAgua", {=> jugador.consumirAgua()})
    keyboard.left().onPressDo({jugador.mover(izquierdaJugador)})
    keyboard.right().onPressDo({jugador.mover(derechaJugador)})
    keyboard.up().onPressDo({jugador.mover(arribaJugador)})
    keyboard.down().onPressDo({jugador.mover(abajoJugador)})

    game.onCollideDo(jugador, {objeto => objeto.interactuarConJugador(jugador)})
  }

  method image() {
    return "pantallaDeInicio.png"
  }

  method position() {
    return game.at(0,0)
  }
}