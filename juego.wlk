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
  method text() = vidaActualmente.toString()
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
  
  method tomarAgua() {
    self.validarTomarAgua()
    nivelDeAgua += 5
  }
  
  method validarTomarAgua() {
    
    //verificar que este en la posicion del charco de agua
  }
  

  
  method agregarHilo() {
    hilo += 1
  }
  
  method inventarioActual() {
    return inventario
  }
  
  method agarrarSerrucho() {
    self.validarAgarrarSerrucho()
    inventario.add(serrucho)
  }
  
  method validarAgarrarSerrucho() {
    
    //if(not inventario.contains(serrucho) and )
  }
  
  method colisionaCon(enemigo) {
    vidaActualmente -= enemigo.dañoQueCausa()
  }
  
  method image() = "Jugador.png"
  
  method vidaActualmente() = vidaActualmente
}

object araña {
  var property position = game.at(1, 1)
  var direccion = derecha

  method image() = "arana.png"
  
  method mover() {
    self.ajustarDireccion()
    position = direccion.mover(self)
  }
  //esto para mi lo tiene que hacer el personaje. el objeto solo existe y si el personaje interactua con el, ahi se activa un metodo del personaje
  method interactuar(personaje) {
    personaje.descontarVida(10)
  }
  method ajustarDireccion() {
    direccion = direccion.proxima(self)
  }
  method position(){
    return position
  }
  //para mi el metodo seria dañoQueCausa(), y despues eso se le descuenta al personaje si hace colision con la araña
  method dañoQueCausa() = 10
}
object derecha {
  method mover(personaje) {
    return personaje.position().right(1)
  }
  method proxima(personaje){
  return if(personaje.position().x() >= game.width() - 1) {izquierda} else self
  }
}
object izquierda {
  method mover(personaje) {
    return personaje.position().left(1)
  }
  method proxima(personaje){
    return if (personaje.position().x() <=  0){ derecha} else self
  }
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

