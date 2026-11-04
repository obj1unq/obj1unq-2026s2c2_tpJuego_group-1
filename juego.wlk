import jugador.*
import wollok.game.*



object telaDeAraña {
  method image() = "telaArana.png"
  
  method position() = game.at(2,4)

  method puedeTalar() {
    return false
  }

  method interactuarConJugador(jugador) {
    jugador.agregarHilo()
    //jugador.agregarAlInventario(self)
    game.removeVisual(self)
  }


}

class Arbol {
  var property estado = sinTalar
  //const x = 0.randomUpTo(game.width()).truncate(0)
  //const y = 0.randomUpTo(game.height()).truncate(0)
  //por ahora esto no es necesario, pero eventualmente podriamos hacer esto: const property maderaQueDa = 3
  var property position = game.center() //game.center()

  
  method image() = "arbol_" + estado.completarImagen() + ".png"


  method interactuarConJugador(jugador) {
    if (jugador.tieneHerramientaQueCortaArbol()){
      jugador.agregarMadera(5)
      estado = talado
    }
  }

  method reiniciarArbol() {
    estado = sinTalar
  }
}

object talado {

  method completarImagen() {
    return "taladon"
  }  
  
}

object sinTalar {
  method completarImagen() {
    return "sinTalarn"
  }
}



object bote {
  method image() = "bote.png"
  
  method position() = game.at(1, 2)
}

object serrucho {

  var posicion = self.positionOriginal() 
  
  method puedeTalar() {
    return true
  }

  method volverAPosicion() {
    posicion = self.positionOriginal()
  }

  method positionOriginal() {
    return game.at(8,4)
  }

  method interactuarConJugador(jugador) {
    jugador.agregarAlInventario(self)
    posicion = game.at(0,12)
    //game.removeVisual(self)
    
  }

  method image() = "serrucho.png"
  
  method position() = posicion
}

object pico {
  method image() = "pico.png"

  method volverAPosicion(){}
  
  method position() = game.at(3, 2)
}

class Madera {
  method image() = "madera.png"
  
  method position() = game.at(6,4)

  method interactuarConJugador(jugador) {
    jugador.agregarMadera(1) 
    game.removeVisual(self)
  }
}

class Agua {
  method image() = "agua.png"
  
  method position() = game.at(2, 3)

  method interactuarConJugador(jugador) {
    jugador.hidratarse(aguaQueAporta)
  }

const property aguaQueAporta = 5

}

