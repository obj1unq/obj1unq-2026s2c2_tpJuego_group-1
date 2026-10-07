import wollok.game.*

object jugador {
  var vidaActualmente = 100
  var nivelDeAgua = 20
  const inventario = []
  var property position = game.center()
  var madera = 0
  var hilo = 0
  
  method madera() = madera
  
  //metodos de prueba
  method text() = position.y().toString() //vidaActualmente.toString()
  method hiloActual() {
    return hilo
  }
  
  method textColor() = "FF0000FF"
  
  //para mi esto no va
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
  
  method verificarVida() {
    if (vidaActualmente <= 0) self.morir()
  }
  
  method morir() {
    vidaActualmente = 0
    game.removeVisual(self)
  }

  
  method agregarHilo() {
    hilo += 1
  }
  
  method inventarioActual() {
    return inventario
  }
  

  method mover(direccion) {
    position = direccion.siguiente(position)
  }
  
  method colisionaCon(enemigo) {
    vidaActualmente -= enemigo.dañoQueCausa()
  }
  
  method image() = "Jugador.png"
  
  method vidaActualmente() = vidaActualmente
}

object araña {
  var property position = game.at(1, 1)
  
  method image() = "arana.png"
  
  method mover() {
    if (position.x() == 10) {
      position.right(1)
    } else {
      if (position.x() == 0) position.left(1)
    }
  }
  
  //esto para mi lo tiene que hacer el personaje. el objeto solo existe y si el personaje interactua con el, ahi se activa un metodo del personaje
  method interactuar(personaje) {
    personaje.descontarVida(10)
  }
  
  //para mi el metodo seria dañoQueCausa(), y despues eso se le descuenta al personaje si hace colision con la araña
  method dañoQueCausa() = 10
}

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
  //por ahora esto no es necesario, pero eventualmente podriamos hacer esto: const property maderaQueDa = 3
  var property position = game.at(10, 9)
  
  method image() = ("arbol_" + estado.image()) + ".png"
}

object talado {
  method image() = "arbol_talado.png"
}

object sinTalar {
  method image() = "arbol_sinTalar.png"
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
  
  method position() = game.at(1,1)
}

class Agua {
  method image() = "agua.png"
  
  method position() = game.at(2, 3)

  const property sedQueQuita = 5
}

//direcciones
object izquierda {

    method siguiente(posicion) {
        self.validarSiguiente(posicion)
        return game.at(posicion.x() - 1 , posicion.y())
    }
    method validarSiguiente(posicion) {
        if(posicion.x() == 0) {
            self.error('No se puede mover a la izquierda')
        }
    }
}
object derecha {
    method siguiente(posicion) {
        self.validarSiguiente(posicion)
        return game.at(posicion.x() + 1 , posicion.y())
    }
    method validarSiguiente(posicion) {
        if(posicion.x() == game.width() - 1 ) {
          self.error("No se puede mover a la derecha")
        }
    }
}
object arriba {
    method siguiente(posicion) {
        self.validarSiguiente(posicion)
        return game.at(posicion.x(), (posicion.y() + 1) )
    }
    method validarSiguiente(posicion) {
        if(posicion.y() == game.height() - 3) {
          self.error('No se puede mover a la arriba')
        }
    }
}
object abajo {
    method siguiente(posicion) {
        self.validarSiguiente(posicion)
        return game.at(posicion.x(), (posicion.y() - 1))
    }
    
    method validarSiguiente(posicion) {
        if(posicion.y() == 0 ) {
            self.error('No se puede mover abajo')
        }
    }

}

