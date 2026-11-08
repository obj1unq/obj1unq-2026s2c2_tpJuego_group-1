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

