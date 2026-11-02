import wollok.game.*
import juego.*
import jugador.*
import enemigos.*
import interfaz.*

const timerDiaYNoche = game.tick(20000, {controladorDeDiaNoche.cambiarEstado()}, false)
const timerDesidratacion = game.tick(2000, {jugador.consumirAgua()}, false)

object pantalla {

  var pantallaActual = pantallaDeInicio

  method image() {
    return pantallaActual.imagen()
  }

  method cambiarA(pantallaNueva) {
    pantallaActual = pantallaNueva
  }

  method interactuar() {
    pantallaActual.interactuar()
  }

  method position() {
    return pantallaActual.position()
  }

  method sinImagen() {
    pantallaActual = sinPantalla
  }
}


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


  method interactuar() {
    pantalla.sinImagen()
    game.addVisual(jugador)
    jugador.empezarPartida()
    timerDiaYNoche.start()
    timerDesidratacion.start()
/*     keyboard.left().onPressDo({jugador.mover(izquierdaJugador)})
    keyboard.right().onPressDo({jugador.mover(derechaJugador)})
    keyboard.up().onPressDo({jugador.mover(arribaJugador)})
    keyboard.down().onPressDo({jugador.mover(abajoJugador)})
 */
    game.onCollideDo(jugador, {objeto => objeto.interactuarConJugador(jugador)})
  }

  method imagen() {
    return "pantallaDeInicio.png"
  }

  method position() {
    return game.at(0,0)
  }
}


object pantallaDeMuerte {


  method interactuar() {
    timerDiaYNoche.stop()
    timerDesidratacion.stop()
    pantalla.cambiarA(pantallaDeInicio)
  }

  method imagen() {
    return "pantallaDeMuerte.png"
  }

  method position() {
    return game.at(0,0)
  }
}

object sinPantalla {

  method imagen() {
    return "sinPantalla.png"
  }

  method position() {
    return game.at(0,0)
  }

  
  method interactuar() {
  }

  
}