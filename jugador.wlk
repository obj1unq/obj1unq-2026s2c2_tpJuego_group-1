import wollok.game.*
import controlador.controler


object jugador {
  var vidaActualmente = 100
  var property nivelDeAgua = 20
  const inventario = []
  var property position = game.center()
  var property madera = 0
  var property hilo = 0
  
  method madera() = madera
  
  //un solo metodo

method consumirAgua(){
  const proximaAgua = nivelDeAgua-6
  if(proximaAgua >=0){
    nivelDeAgua=proximaAgua
  }else{
    self.descontarVida(7-nivelDeAgua)
    game.say(self, "Me estoy desidratando")
    nivelDeAgua=0
  }
}


  //metodos de prueba
  //method text() = position.y().toString() //vidaActualmente.toString()
  
  method hiloActual() {
    return hilo
  }
  
  method textColor() = "FF0000FF"
  
  method descontarVida(cantidad) {
    if (vidaActualmente < cantidad) {
      self.morir()
    } else {
      vidaActualmente -= cantidad
    }
  }

  
method hidratarse(cantidad){
  nivelDeAgua = nivelDeAgua + cantidad
}

  method agregarAlInventario(item) {
    inventario.add(item)
  }
  
  
  method morir() {
    vidaActualmente = 0
    game.removeVisual(self)
  }

  method agregarMadera(cantidad) {
    madera += cantidad
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
  
/*   method colisionaCon(enemigo) {
    vidaActualmente -= enemigo.dañoQueCausa()
  } */
  
  method image() = "Jugador.png"

  method tieneHerramientaQueCortaArbol() {
    return inventario.any({item => item.puedeTalar()})
  }
  
  method vidaActualmente() = vidaActualmente
}


//direcciones
object izquierdaJugador {

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
object derechaJugador {
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
object arribaJugador {
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
object abajoJugador {
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

