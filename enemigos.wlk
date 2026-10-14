import juego.*
import jugador.*


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