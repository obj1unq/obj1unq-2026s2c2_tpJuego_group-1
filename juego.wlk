import wollok.game.*

object jugador {

  var vidaActualmente = 100
  var sed = 0 //a corregir
  var armadura = 0 //a corregir

  var inventario = [] //a corregir 

  //metodos de prueba
  method text() =  vidaActualmente.toString()
  method textColor() = "FF0000FF"
  //

  method descontarVida(cantidad) {
    if (vidaActualmente < cantidad){
      self.morir()
    }else{
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

  var property position = game.center()

  method image() {
    return "Jugador.png"
  }

  method vidaActualmente() {
    return vidaActualmente
  }

}