import jugador.*
import wollok.game.*





class Arbol {
  var property estado = sinTalar
  //const x = 0.randomUpTo(game.width()).truncate(0)
  //const y = 0.randomUpTo(game.height()).truncate(0)
  
  var property position = game.center() //game.center()

  
  method image() = "arbol_" + estado.completarImagen() + ".png"


  method interactuarConJugador(jugador) {
    self.validarCortar(jugador)
    jugador.agregarMadera(5)
    estado = talado
    
  }

  method validarCortar(jugador) {
    if(not jugador.tieneHerramientaQueCortaArbol()){
      self.error("No tiene herramienta")
    }
  }

  method reiniciarArbol() {
    estado = sinTalar
  }
}

object talado {

  method completarImagen() {
    return "taladon"
  }  
  
}

object sinTalar {
  method completarImagen() {
    return "sinTalarn"
  }


}



object bote {

  const maderaNecesaria = 150
  const hiloNecesario = 10
  var maderaColocada = 0
  var hiloColocado = 0
  

  method image() = "boteRoto.png"
  
  method position() = game.at(7, 0)

  method interactuarConJugador(jugador) {
    maderaColocada += jugador.madera()
    hiloColocado += jugador.hiloActual()
    jugador.sacarMadera()
    jugador.sacarHilo()
    game.say(self, "Madera Faltante: " + self.maderaFaltante().toString() + "Hilo Necesario: " + self.hiloFaltante())
  }

  method maderaFaltante() {
    return maderaNecesaria - maderaColocada
  }

  method hiloFaltante() {
    return hiloNecesario - hiloColocado
  }

  method reiniciarContadores() {
    maderaColocada = 0
    hiloColocado = 0
  }

}


class Madera {
  method image() = "madera.png"
  
  method position() = game.at(6,4)

  method interactuarConJugador(jugador) {
    jugador.agregarMadera(1) 
    game.removeVisual(self)
  }
}

class Agua {
  method image() = "agua.png"
  
  method position() = game.at(2, 3)

  method interactuarConJugador(jugador) {
    jugador.hidratarse(aguaQueAporta)
  }

const property aguaQueAporta = 5

}

