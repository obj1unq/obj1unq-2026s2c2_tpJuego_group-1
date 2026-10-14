import wollok.game.*



object telaDeAraña {
  method image() = "telaArana.png"
  
  method position() = game.at(2,2)
  
  //para mi esto lo tiene que hacer el personaje:
  method interactuar(personaje) {
    personaje.recogerHilo(5) // a implementar
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

  method puedeTalar() {
    return true
  }

  method interactuarConJugador(jugador) {
    jugador.agregarAlInventario(self)
    game.removeVisual(self)
  }

  method image() = "serrucho.png"
  
  method position() = game.at(8, 4)
}

object pico {
  method image() = "pico.png"
  
  method position() = game.at(3, 2)
}

class Madera {
  method image() = "madera.png"
  
  method position() = game.at(6,4)
}

class Agua {
  method image() = "agua.png"
  
  method position() = game.at(2, 3)

  const property sedQueQuita = 5
}

