import juego.*
import jugador.*
import controlador.*

class Enemigo {
  var property position = game.at(0, 1)
  var direccion
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


class Araña inherits Enemigo(direccion = derecha) {

  override method image() = "arana.png"


  override method dañoQueCausa() = 10
}

class Serpiente inherits Enemigo (direccion = abajo) {

  override method image() = "serpiente.png"

  override method dañoQueCausa() = 30

}


class Murcielago inherits Enemigo(direccion = abajo) {


  override method image() = "murcielago.png"

  override method dañoQueCausa() = 5 

  override method interactuarConJugador(personaje) {
    personaje.descontarVida(self.dañoQueCausa())
    game.removeVisual(self) //Cuando Ataca al jugador, se muere
  }

}

object constructorMurcielago{
  method construir(velocidad,posicion){
    const murcielago = new Murcielago(position = posicion, direccion = abajo )
    game.addVisual(murcielago)
    game.onTick(velocidad, murcielago.identity(), {=> murcielago.mover()})
    creadorDeMurcielagos.añadorMurcielago(murcielago)
  }
}

object constructorSerpiente{
  method construir(velocidad,posicion){
    const serpiente = new Serpiente(position = posicion, direccion = abajo )
    game.addVisual(serpiente)
    game.onTick(velocidad, serpiente.identity(), {=> serpiente.mover()}) 
  }
}

object constructorAraña{
  method construir(velocidad,posicion){
    const araña = new Araña(position = posicion, direccion = derecha)
    game.addVisual(araña)
    game.onTick(velocidad, araña.identity(), {=> araña.mover()}) 
  }
}

class DireccionEnemigo{

  const direccionContraria

  method proxima(personaje){
    return if(self.condicionDeMovimiento(personaje)) {direccionContraria} else self
  }

  method condicionDeMovimiento(personaje)

}
object abajo inherits DireccionEnemigo (direccionContraria = arriba){
  
  method mover(personaje,cantidad) {
    return personaje.position().down(cantidad)
  }
  override method condicionDeMovimiento(personaje){
    return personaje.position().y() <= 0
  }
}

object arriba inherits DireccionEnemigo (direccionContraria = abajo){
  method mover(personaje,cantidad) {
    return personaje.position().up(cantidad) 
  }
  override method condicionDeMovimiento(personaje){
    return personaje.position().y() >=  game.height() - 3
  }
}

object derecha inherits DireccionEnemigo (direccionContraria = izquierda){
  method mover(personaje,cantidad) {
    return personaje.position().right(cantidad)
  }

  override method condicionDeMovimiento(personaje){
    return personaje.position().x() >= game.width() - 1
  }
}

object izquierda inherits DireccionEnemigo (direccionContraria = derecha){
  
  method mover(personaje,cantidad) {
    return personaje.position().left(cantidad)
  }
  override method condicionDeMovimiento(personaje){
    return personaje.position().x() <=  0
  }

}

