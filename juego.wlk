import wollok.game.*

object jugador {
  var vidaActualmente = 100
  var sed = 0 //a corregir
  var armadura = 0 //a corregir
  var inventario = [] //a corregir 
  var property position = game.center()
  
  //metodos de prueba
  method text() = vidaActualmente.toString()
  
  method textColor() = "FF0000FF"
  
  method descontarVida(cantidad) {
    if (vidaActualmente < cantidad) {
      self.morir()
    } else {
      vidaActualmente -= cantidad
    }
  }
  
  method agregarAlInventario(item) {
    inventario.add(item)
  }
  
  method morir() {
    vidaActualmente = 0
    game.removeVisual(self)
  }
  
  //para mi esto no va porque lo cambie abajo en el metodo tomarAgua()
  method hidratarse(cantidad) {
    sed -= cantidad
  }
  
  method tomarAgua() {
    self.validarTomarAgua()
    sed = -5
  }
  
  method validarTomarAgua() {
    
    //verificar que este en la posicion del charco de agua
  }
  
  method image() = "Jugador.png"
  
  method vidaActualmente() = vidaActualmente
}

object araña {
  var property position = game.at(10, 5)
  
  method image() = "Araña.png"
  
  method mover() {
    if (position.x() == 10) {
      position.right(1)
    } else {
      if (position.x() == 0) position.left(1)
    }
  }
  
  method interactuar(personaje) {
    personaje.descontarVida(10)
  }
}

object telaDeAraña {
  method image() = "telaAraña.png"
  
  method position() = game.at(10, 5)
  
  method interactuar(personaje) {
    personaje.recogerHilo(5) // a implementar
  }
}

object palmera1 {
  method image() = "palmera.png"
  
  method position() = game.at(0, 0)
  
  method interactuar(personaje) {
    personaje.recogerMadera(3) // a implementar
  }
}

object palmera2 {
  method image() = "palmera.png"
  
  method position() = game.at(5, 0)
  
  method interactuar(personaje) {
    personaje.recogerMadera(1) // a implementar
  }
}

object palmera3 {
  method image() = "palmera.png"
  
  method position() = game.at(9, 10)
  
  method interactuar(personaje) {
    personaje.recogerMadera(5) // a implementar
  }
}

class Arbol {
  var property estado = sinTalar
  const property maderaQueDa = 3
  var property position = game.at(6, 7)
  
  method image() = ("arbol_" + estado.image()) + ".png"
}

object talado {
  method image() = "arbol_talado.png"
}

object sinTalar {
  method image() = "arbol_sinTalar.png"
}

class CharcoDeAgua {
  const property sedQueQuita = 5
  
  method image() = "agua.png"
  
  method position() = game.at(5, 4)
}

object bote {
  method image() = "bote.png"
  
  method position() = game.at(9, 10)
}

object serrucho {
  method image() = "serrucho.png"
  
  method position() = game.at(9, 10)
}

object pico {
  method image() = "pico.png"
  
  method position() = game.at(9, 10)
}

object madera {
  method image() = "madera.png"
  
  method position() = game.at(9, 10)
}

object agua {
  method image() = "agua.png"
  
  method position() = game.at(9, 10)
}

const arbol1 = new Arbol()