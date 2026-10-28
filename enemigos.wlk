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
  
  method interactuarConJugador(personaje) {
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


class Serpiente {
  var property position
  var direccion = abajo
  const cantidadDeCeldas =  1

  method image() = "serpiente.png"
  
  method mover() {
    self.ajustarDireccion()
    position = direccion.mover(self,cantidadDeCeldas)
  }
  
  method interactuarConJugador(personaje) {
    personaje.descontarVida(30)
  }
  method ajustarDireccion() {
    direccion = direccion.proxima(self)
  }
  method position(){
    return position
  }
}

 object abajo {
  
  method mover(personaje,cantidad) {
    return personaje.position().down(cantidad)
  }
  method proxima(personaje){
  return if(personaje.position().y() >= game.height() - 1) {arriba} else self
  }
}

object arriba {
  method mover(personaje,cantidad) {
    return personaje.position().up(cantidad) 
  }
  method proxima(personaje){
    return if (personaje.position().y() <=  0){abajo} else self
  }
}

object constructorSerpiente{
  method construir(velocidad,posicion){
    const serpiente = new Serpiente(position = posicion)
    game.addVisual(serpiente)
    game.onTick(velocidad, serpiente.identity(), {=> serpiente.mover()}) 
  }
}
