void hover(String pantallaInicial, String pantallaFinal, float limiteEnX, float limiteEnY, int distanciaLimite) {
  if (estados.equals( pantallaInicial ) || estados.equals( pantallaFinal)) {
    if (dist(xPantalla, yPantalla, limiteEnX, limiteEnY)<distanciaLimite) {
      estados = pantallaFinal;
    } else {
      estados = pantallaInicial;
    }
  }
}


void cambiarPantalla(String pantallaInicial, String pantallaDeCambio, float limiteEnX, float limiteEnY, int distanciaLimite ) {
  if (dist(xPantalla, yPantalla, limiteEnX, limiteEnY) < distanciaLimite && estados == pantallaInicial) {
    contador++;
    alphaDeCursor = alphaDeCursor-2;

    if (contador > 120) {
      estados =  pantallaDeCambio;
      contador = 0;
      alphaDeCursor = 255;
    }
  } else {
  }
}

void cambioMenu(String opcion1, String opcion2, String opcion3, float posX, float posY, int distanciaLimite, String pagina) {
  if (estados.equals(opcion1) || estados.equals(opcion2) || estados.equals(opcion3) ) {
    if (dist(posX, posY, xPantalla, yPantalla)< distanciaLimite) {
      contador++;

      alphaDeCursor = alphaDeCursor-2;
      if (contador > 120) {
        estados = pagina;
        contador = 0;
        alphaDeCursor = 255;
      }
    } else {
    }
  }
}
