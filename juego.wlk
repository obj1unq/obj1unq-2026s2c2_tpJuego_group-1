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
  
  method talarMadera() {
    self.validarTalarMadera()
    madera += 3
  }
  
  method validarTalarMadera() {
    
    //verificar que este en la posicion de la madera 
    //y que tenga el serrucho
  }
  
  method agarrarHilo() {
    self.validarAgarrarHilo()
    hilo += 1
  }
  
  method validarAgarrarHilo() {
    
    //verifica que este en la tela de araña
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
  var direccionAMover = true

  method image() = "arana.png"
  
  method mover() {
     if (self.direccion()){ position  = position.right(1)} else { position  = position.left(1)}
  }
  method direccion(){
    return if (position.x() >= game.width()){direccionAMover = false} else (position.x() <= 0) {direccionAMover = true}
  }
  

  
  //esto para mi lo tiene que hacer el personaje. el objeto solo existe y si el personaje interactua con el, ahi se activa un metodo del personaje
  method interactuar(personaje) {
    personaje.descontarVida(10)
  }
  
  //para mi el metodo seria dañoQueCausa(), y despues eso se le descuenta al personaje si hace colision con la araña
  method dañoQueCausa() = 10
}

object telaDeAraña {
  method image() = "telaAraña.png"
  
  method position() = game.at(10, 5)
  
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
  
  method position() = game.center()
  
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
  //por ahora esto no es necesario, pero eventualmente podriamos hacer esto: const property maderaQueDa = 3
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