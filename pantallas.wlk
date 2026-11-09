import wollok.game.*
import juego.*
import jugador.*
import enemigos.*
import interfaz.*
import controlador.*


class Pantalla {
  method position() {
    return game.at(0, 0)
  }

  method interactuar() 
}


object pantalla {

  var pantallaActual = pantallaDeInicio

  method image() {
    return pantallaActual.imagen()
  }

  method cambiarA(pantallaNueva) {
    pantallaActual = pantallaNueva
  }

  method jugadorAMuerto(pantalla) {
    game.removeVisual(telaDeAraña) //Elimino loss objetos del inventario
    game.removeVisual(serrucho)
    game.removeVisual(pico)
    
    pantallaActual = pantalla
  }

  method interactuar() {
    pantallaActual.interactuar()
  }

  method position() {
    return pantallaActual.position()
  }

  method sinImagen() {
    pantallaActual = sinPantalla
  }
}

object pantallaDeInicio inherits Pantalla{

  override method interactuar() {
    estadoDelDia.reiniciarDia()
    game.addVisual(serrucho)
    serrucho.volverAPosicion()
    game.addVisual(pico)
    pico.volverAPosicion()
    game.addVisual(telaDeAraña)
    jugador.empezarPartida()
    game.addVisual(jugador)
    arbol1.reiniciarArbol()
    arbol2.reiniciarArbol()
    arbol3.reiniciarArbol()
    
    pantalla.sinImagen()
    controladorDeDiaNoche.reiniciarEstado()
    timerDiaYNoche.start()
    timerDesidratacion.start()


    timerDesidratacion.start()
  }

  method imagen() {
    return "pantallaDeInicio.png"
  }

}


object pantallaDeMuerte inherits Pantalla{

  override method interactuar() {
    timerDiaYNoche.stop()
    timerDesidratacion.stop()
    timerMurcielagos.stop()
    pantalla.cambiarA(pantallaDeInicio)
  }

  method imagen() {
    return "pantallaDeMuerte.png"
  }

}

object sinPantalla inherits Pantalla {

  override method interactuar() {}

  method imagen() {
    return "sinPantalla.png"
  }
  
}