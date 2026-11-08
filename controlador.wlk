import wollok.game.*
import juego.*
import jugador.*
import enemigos.*
import interfaz.*

const timerDiaYNoche = game.tick(20000, {controladorDeDiaNoche.cambiarEstado()}, false)
const timerDesidratacion = game.tick(2000, {jugador.consumirAgua()}, false)

const timerMurcielagos = game.tick(3000, {creadorDeMurcielagos.crearMurcielago()}, false)

const arbol1 = new Arbol(position = game.at(3,5))
const arbol2 = new Arbol(position = game.at(5,8))
const arbol3 = new Arbol(position = game.at(9,5))


object creadorDeMurcielagos {

  const todosLosMurcielagos = #{}

  method crearMurcielago() {
     const x = 0.randomUpTo(game.width()).truncate(0)
     constructorMurcielago.construir(100,game.at(x,10))
  }

  method añadorMurcielago(murcielago) {
    todosLosMurcielagos.add(murcielago)
  }

  method sacarTodosLosMurcielagos() {
    timerMurcielagos.stop()
    todosLosMurcielagos.forEach({murcielago => game.removeVisual(murcielago)})
  }

}


class Pantalla {
  method position() {
    return game.at(0, 0)
  }

  method interactuar() {}
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
    game.removeVisual(telaDeAraña)
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


object controladorDeDiaNoche {
    var estado = 1
  method estado() {
    return estado
  }

  method cambiarEstado() {
    if (estado == 6){
      estado = 1
      timerMurcielagos.stop()
    }else{
      estado += 1
      self.ponerMurcielagos()
    }
  }

  method ponerMurcielagos() {
    if ( estado == 2){
      timerMurcielagos.start()
    }
  }

  method position() {
    return game.at(0, 0)
  }

  method image() {
    return "arenaDia" + estado + ".png"
  }

  method reiniciarEstado() {
    estado = 1
  }
}

object pantallaDeInicio inherits Pantalla{

  override method interactuar() {
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

  method imagen() {
    return "sinPantalla.png"
  }
  
}