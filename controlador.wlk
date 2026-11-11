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


object controladorDeDiaNoche {
  var estado = estadoInicial

  method estado() {
    return estado
  }

  method image() {
    return estado.image()
  }

  method position() {
    return estado.position()
  }

  method cambiarEstado() {
    estado = estado.estadoSiguiente()
    estado.realizarAccion()
  }

  method reiniciarEstado() {
    estado = estadoInicial
    estado.realizarAccion()
  }
}


class EstadoDia {
  
  method image()

  method estadoSiguiente() 

  method realizarAccion() {}

  method position() {
    return game.at(0, 0)
  }

}

object estadoInicial inherits EstadoDia {
  override method image(){
    return "arenaDia1.png"
  }

  override method estadoSiguiente(){
    return estadoInicialSegundo
  }

  override method realizarAccion(){
    estadoDelDia.cambiarEstado()
    timerMurcielagos.stop()
  
  }

}


object estadoInicialSegundo inherits EstadoDia {
  override method image(){
    return "arenaDia2.png"
  }

  override method estadoSiguiente(){
    return estadoInicialTercero
  }
}

object estadoInicialTercero inherits EstadoDia {
  override method image(){
    return "arenaDia3.png"
  }

  override method estadoSiguiente(){
    return estadoPreNocheInicial
  }  
}

object estadoPreNocheInicial inherits EstadoDia {
  override method image(){
    return "arenaDia4.png"
  }

  override method estadoSiguiente(){
    return estadoNocheInicial
  }    
}

object estadoNocheInicial inherits EstadoDia {
  override method image(){
    return "arenaDia5.png"
  }

  override method estadoSiguiente(){
    return estadoNoche
  }

  override method realizarAccion(){
    estadoDelDia.cambiarEstado()
    timerMurcielagos.start()
  }  

  
}

override method realizarAccion(){
    estadoDelDia.cambiarEstado() 
}



object estadoInicialSegundo inherits EstadoDia {
  override method image(){
    return "arenaDia2.png"
  }

  override method estadoSiguiente(){
    return estadoInicialTercero
  }
}

object estadoInicialTercero inherits EstadoDia {
  override method image(){
    return "arenaDia3.png"
  }

  override method estadoSiguiente(){
    return estadoPreNocheInicial
  }  
}

object estadoPreNocheInicial inherits EstadoDia {
  override method image(){
    return "arenaDia4.png"
  }

  override method estadoSiguiente(){
    return estadoNocheInicial
  }    
}


object estadoNocheInicial inherits EstadoDia {

  override method image(){
    return "arenaDia5.png"
  }

  override method estadoSiguiente(){
    return estadoNoche
  }

  override method realizarAccion(){
    estadoDelDia.cambiarEstado()
    timerMurcielagos.start()
  }  
}

object estadoNoche inherits EstadoDia {
  override method image(){
    return "arenaDia6.png"
  }
 
  override method estadoSiguiente(){
    return estadoInicial
  }

}