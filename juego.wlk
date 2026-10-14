import wollok.game.*



object telaDeAraña {
  method image() = "telaArana.png"
  
  method position() = game.at(2,2)
  
  //para mi esto lo tiene que hacer el personaje:
  method interactuar(personaje) {
    personaje.recogerHilo(5) // a implementar
  }
}
//para mi los objetos palmeras deberian ser instancias de la clase Arbol que defini mas abajo,

//por otro lado, el metodo para agarrar madera es parte de personaje, no del arbol en si
//no objetos individuales como esta aca:
object palmera1 {
  method image() = "palmera1.png"
  
  method position() = game.at(5,6)
  
  method interactuar(personaje) {
    personaje.recogerMadera(3) // a implementar
  }
}

object palmera2 {
  method image() = "palmera1.png"
  
  method position() = game.at(5, 1)
  
  method interactuar(personaje) {
    personaje.recogerMadera(1) // a implementar
  }
}

object palmera3 {
  method image() = "palmera1.png"
  
  method position() = game.at(3, 3)
  
  method interactuar(personaje) {
    personaje.recogerMadera(5) // a implementar
  }
}

class Arbol {
  var property estado = sinTalar
  const x = 0.randomUpTo(game.width()).truncate(0)
  const y = 0.randomUpTo(game.height()).truncate(0)
  //por ahora esto no es necesario, pero eventualmente podriamos hacer esto: const property maderaQueDa = 3
  var property position = game.at(x, y)//game.center()
  
  method image() = "arbol_" + estado.completarImagen() + ".png"
}

object talado {

  method completarImagen() {
    return "talado"
  }  
  
}

object sinTalar {
  method completarImagen() {
    return "sinTalar"
  }
}



object bote {
  method image() = "bote.png"
  
  method position() = game.at(1, 2)
}

object serrucho {
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

