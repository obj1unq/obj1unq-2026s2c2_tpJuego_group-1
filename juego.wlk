import items.*
import jugador.*
import pantallas.*

import wollok.game.*





class Arbol {
  var property estado = sinTalar

  var property position = game.center() //game.center()

  
  method image() = "arbol_" + estado.completarImagen() + ".png"


  method interactuarConJugador(jugador) {
    self.validarCortar(jugador)
    if(estado.puedeTalar()){
      jugador.agregarMadera(45) //5
      estado = talado
    
    }
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

  method puedeTalar() {
    return false
  }

  method completarImagen() {
    return "taladon"
  }  
  
}

object sinTalar {

  method puedeTalar() {
    return true
  }

  method completarImagen() {
    return "sinTalarn"
  }


}



object bote {

  const maderaNecesaria = 100 //cambiar
  const hiloNecesario = 1 //cambiar
  var maderaColocada = 0
  var hiloColocado = 0
  
  var estadoActual = estadoSinMateriales

  method image() = estadoActual.image()
  
  method position() = game.at(7, 0)

  method interactuarConJugador(jugador) {
    estadoActual.interactuarConJugador(jugador)
  }

  method maderaFaltante() {
    return maderaNecesaria - maderaColocada
  }

  method agregarMadera(cant) {
    maderaColocada += cant
  }

  method agregarHilo(cant) {
    hiloColocado += cant
  }

  method hiloFaltante() {
    return hiloNecesario - hiloColocado
  }

  method reiniciarContadores() {
    maderaColocada = 0
    hiloColocado = 0
    estadoActual = estadoSinMateriales
  }

  method hayLoNecesario() {
    return (maderaColocada >= maderaNecesaria) && (hiloNecesario >= hiloNecesario)  
  }

  method cambiarEstado() {

    estadoActual = estadoSinBrujula
  }

}

object estadoSinMateriales {

  method image() {
    return "boteRoto.png"
  }

  method interactuarConJugador(jugador) {
    if (bote.hayLoNecesario()){
      bote.cambiarEstado()
    }else{
      bote.agregarMadera(jugador.madera())
      bote.agregarHilo(jugador.hiloActual())
      jugador.sacarMadera()
      jugador.sacarHilo()
      game.say(bote, "Madera Faltante: " + bote.maderaFaltante().toString() +
     "Hilo Necesario: " + bote.hiloFaltante()) 
   }
  }
}

object estadoSinBrujula {
  method interactuarConJugador(jugador){
    if (jugador.tieneBrujula()){
      controladorDeEscenas.cambiarAVictoria()
    }else{
      game.say(bote, "Necesitas La brujula para escapar")
    }
  }

  method image() {
    return "bote.png"
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

object cofre {
  method image() = "cofre.png"

  method position() {
    return game.at(5, 5)
  }

  method interactuarConJugador(jugador) {
    if (jugador.tieneLlaveQueAbreCofre()){
      game.say(self, "Me han abierto")
      game.removeVisual(llave)
      game.addVisual(brujula)
      game.removeVisual(self)
    }else{
      game.say(self, "Necesitas La llave")
    }
  }
}



