import juego.*
import items.*
import wollok.game.*
import controlador.*
import pantallas.*



object jugador {
  var vidaActualmente = 100
  var property nivelDeAgua = 20
  var inventario = []
  var property position = game.center()
  var madera = 0
  var hilo = 0
  
  method madera() = madera

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
  
  method hiloActual() {
    return hilo
  }

  method sacarHilo() {
    hilo = 0
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
    nivelDeAgua = 100.min(nivelDeAgua + cantidad)
  }

  method agregarAlInventario(item) {
    inventario.add(item)
  }
  
  
  method morir() {
    vidaActualmente = 0
    game.removeVisual(self)
    self.eliminarATodosDelInventario()
    controladorDeEscenas.jugadorAMuerto(escenaDeMuerte)
  }

  method agregarMadera(cantidad) {
    madera += cantidad
  }

  method sacarMadera() {
    madera = 0
  }

  method eliminarATodosDelInventario() {
    inventario.clear()
    inventario.forEach({item => game.removeVisual(item)})
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
  
  method image() = "Jugador.png"

  method tieneHerramientaQueCortaArbol() {
    return inventario.any({item => item.puedeTalar()})
  }

  method tieneLlaveQueAbreCofre() {
    return inventario.any({item => item.puedeAbrirCofre()})
  }

  method tieneBrujula() {
    return inventario.contains(brujula)
  }
  
  method vidaActualmente() = vidaActualmente

  method empezarPartida() {
    vidaActualmente = 100
    nivelDeAgua = 20
    inventario = []
    position = game.center()
    madera = 0
    hilo = 0

  }

}


//direcciones 
//Poner Class

class Direccion{
    
    method siguiente(posicion) {
      self.validarSiguiente(posicion)
      return game.at(self.movimientoEnX(posicion), self.movimientoEnY(posicion))
    }

    method movimientoEnX(posicion)
    method movimientoEnY(posicion)

    method validarSiguiente(posicion) {
      if(self.validacionSiguiente(posicion)) {
        self.error('No se puede mover a la izquierda')
      }
    }

    method validacionSiguiente(posicion)

}

object izquierdaJugador inherits Direccion{

    override method movimientoEnX(posicion){
      return posicion.x() - 1
    }

    override method movimientoEnY(posicion){
      return posicion.y()
    }

    override method validacionSiguiente(posicion){
      return posicion.x() == 0
    }
}
object derechaJugador inherits Direccion{

    override method movimientoEnX(posicion){
      return posicion.x() + 1
    }

    override method movimientoEnY(posicion){
      return posicion.y()
    }

    override method validacionSiguiente(posicion){
      return posicion.x() == game.width() - 1
    }    
}
object arribaJugador inherits Direccion{

    override method movimientoEnX(posicion){
      return posicion.x()
    }

    override method movimientoEnY(posicion){
      return posicion.y() + 1
    }

    override method validacionSiguiente(posicion){
      return posicion.y() == game.height() - 3
    }        
}
object abajoJugador inherits Direccion{
    override method movimientoEnX(posicion){
      return posicion.x()
    }

    override method movimientoEnY(posicion){
      return posicion.y() - 1
    }

    override method validacionSiguiente(posicion){
      return posicion.y() == 0 
    }   
}

