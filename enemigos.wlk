import juego.*
import jugador.*

class Enemigo {
    
  var property position = game.at(0, 1)
  var property direccion
  const cantidadDeCeldas =  1

  method mover() {
    self.ajustarDireccion()
    position = direccion.mover(self,cantidadDeCeldas)
  }

  method ajustarDireccion() {
    direccion = direccion.proxima(self)
  }

  method dañoQueCausa()

  method position(){
    return position
  }

  method image()

  method interactuarConJugador(personaje) {
    personaje.descontarVida(self.dañoQueCausa())
  }


}


class Araña inherits Enemigo{
  override method direccion() = derecha


  override method image() = "arana.png"


  override method dañoQueCausa() = 10
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
    const araña = new Araña(position = posicion, direccion = derecha)
    game.addVisual(araña)
    game.onTick(velocidad, araña.identity(), {=> araña.mover()}) 
  }
}


class Serpiente inherits Enemigo {

  override method direccion() = abajo 
  override method image() = "serpiente.png"

  override method dañoQueCausa() = 30


}

 object abajo {
  
  method mover(personaje,cantidad) {
    return personaje.position().down(cantidad)
  }
  method proxima(personaje){
  return if(personaje.position().y() <= 0) {arriba} else self
  }
}

object arriba {
  method mover(personaje,cantidad) {
    return personaje.position().up(cantidad) 
  }
  method proxima(personaje){
    return if (personaje.position().y() >=  game.height() - 3){abajo} else self
  }
}

object constructorSerpiente{
  method construir(velocidad,posicion){
    const serpiente = new Serpiente(position = posicion, direccion = abajo )
    game.addVisual(serpiente)
    game.onTick(velocidad, serpiente.identity(), {=> serpiente.mover()}) 
  }
}
