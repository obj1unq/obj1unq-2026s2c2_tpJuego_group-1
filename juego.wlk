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