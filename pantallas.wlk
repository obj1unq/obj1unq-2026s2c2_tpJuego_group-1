import wollok.game.*
import juego.*
import jugador.*
import enemigos.*
import interfaz.*
import controlador.*
import items.*


class Escena {
  method position() {
    return game.at(0, 0)
  }

  method interactuar() 
}


object controladorDeEscenas {

  var escenaActual = escenaDeInicio

  method image() {
    return escenaActual.imagen()
  }

  method cambiarA(pantallaNueva) {
    escenaActual = pantallaNueva
  }

  method jugadorAMuerto(pantalla) {

    creadorDeMurcielagos.sacarTodosLosMurcielagos() //Por ahora
    game.removeVisual(brujula) //por ahora
    game.removeVisual(cofre)
    game.removeVisual(telaDeAraña) //Elimino loss objetos del inventario
    game.removeVisual(serrucho)
    game.removeVisual(llave)
    
    escenaActual = pantalla
  }

  method interactuar() {
    escenaActual.interactuar()
  }

  method position() {
    return escenaActual.position()
  }

  method cambiarAEscenaDeJuego() {
    escenaActual = escenaJugable
  }

  method cambiarAVictoria() {
    game.removeVisual(serrucho)
    game.removeVisual(brujula)
    game.removeVisual(jugador)
    timerDiaYNoche.stop()
    timerDesidratacion.stop()
    timerMurcielagos.stop()
    escenaActual = escenaDeVictoria
    
  }
}

object escenaDeInicio inherits Escena{

  override method interactuar() {
    game.addVisual(new Madera())
    bote.reiniciarContadores()
    estadoDelDia.reiniciarDia()
    game.addVisual(serrucho)
    game.addVisual(cofre)
    serrucho.volverAPosicion()
    game.addVisual(llave)
    llave.volverAPosicion()
    game.addVisual(telaDeAraña)
    jugador.empezarPartida()
    game.addVisual(jugador)
    arbol1.reiniciarArbol()
    arbol2.reiniciarArbol()
    arbol3.reiniciarArbol()
    
    controladorDeEscenas.cambiarAEscenaDeJuego()
    controladorDeDiaNoche.reiniciarEstado()
    timerDiaYNoche.start()
    timerDesidratacion.start()


    timerDesidratacion.start()
  }

  method imagen() {
    return "pantallaDeInicio.png"
  }

}


object escenaDeMuerte inherits Escena{

  override method interactuar() {
    timerDiaYNoche.stop()
    timerDesidratacion.stop()
    timerMurcielagos.stop()
    controladorDeEscenas.cambiarA(escenaDeInicio)
  }

  method imagen() {
    return "pantallaDeMuerte.png"
  }

}

object escenaDeVictoria inherits Escena{

  override method interactuar() {
    timerDiaYNoche.stop()
    timerDesidratacion.stop()
    timerMurcielagos.stop()
    controladorDeEscenas.cambiarA(escenaDeInicio)
  }

  method imagen() {
    return "victoria.jpg"
  }

}

object escenaJugable inherits Escena {

  override method interactuar() {}

  method imagen() {
    return "sinPantalla.png"
  }
  
}