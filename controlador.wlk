object controler {
    var estado = 1
  method estado() {
    return estado
  }

  method cambiarEstado() {
    if (estado == 5){
      estado = 1
    }else{
      estado += 1
    }
  }

  method position() {
    return game.at(0, 0)
  }

  method image() {
    return "arenaDia" + estado + ".png"
  }
}