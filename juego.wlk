import wollok.game.*

object jugador {
  //hola
  var vidaActualmente = 100
  var sed = 0 //a corregir
  var armadura = 0 //a corregir
  var inventario = [] //a corregir 
  var property position = game.center()
  
  //metodos de prueba
  method text() = vidaActualmente.toString()
  
  method textColor() = "FF0000FF"
  
  //
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
  
  method x() = position.x()
  
  method morir() {
    vidaActualmente = 0
    game.removeVisual(self)
  }
  
  method hidratarse(cantidad) {
    sed -= cantidad
  }
  
  method image() = "Jugador.png"
  
  method vidaActualmente() = vidaActualmente
}

object araña{
    const objetivo = jugador
    method image() = "Araña.png"
    

    method position() {
        return game.at(self.x(),3)
    }
    method x() {
        return objetivo.x() + 1
    }

    method interactuar(personaje) {
        personaje.descontarVida(10)
    }
}

object telaDeAraña{
    method image() = "telaAraña.png"
    method position() {
        return game.at(10,3)
    }
    method interactuar(personaje) {
        personaje.recogerHilo(5)// a implementar
    }
}
