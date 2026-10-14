import juego.*
import jugador.*


class Araña {
  var property position = game.at(0, 1)
  var direccion = derecha
  var cantidadDeCeldas =  1

  method image() = "arana.png"
  
  method mover() {
    self.ajustarDireccion()
    position = direccion.mover(self,cantidadDeCeldas)
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
  method dañoQueCausa() = 10
}
 object derecha {
  method mover(personaje,cantidad) {
    return personaje.position().right(cantidad)
  }
  method proxima(personaje){
  return if(personaje.position().x() >= game.width() - 1) {izquierda} else self
  }
}
object izquierda {
  method mover(personaje,cantidad) {
    return personaje.position().left(cantidad)
  }
  method proxima(personaje){
    return if (personaje.position().x() <=  0){derecha} else self
  }
}

object constructorAraña{
  method construir(velocidad,posicion){
    const araña = new Araña(position = posicion)
    game.addVisual(araña)
    game.onTick(velocidad, araña.identity(), {=> araña.mover()}) 
  }
}

