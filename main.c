#include <stdio.h>
#include <stdlib.h>

// Estructura para representar una fracción (nodo del árbol)
typedef struct Fraccion {
    int numerador;
    int denominador;
    struct Fraccion* izquierda;
    struct Fraccion* derecha;
} Fraccion;

// Función para crear un nodo
Fraccion* crearNodo(int numerador, int denominador) {
    Fraccion* nuevoNodo = (Fraccion*)malloc(sizeof(Fraccion));
    nuevoNodo->numerador = numerador;
    nuevoNodo->denominador = denominador;
    nuevoNodo->izquierda = NULL;
    nuevoNodo->derecha = NULL;
    return nuevoNodo;
}

// Función para construir el árbol de Stern-Brocot hasta un nivel específico
void construirArbol(Fraccion* nodo, Fraccion* izquierda, Fraccion* derecha, int nivelActual, int nivelMax) {
    if (nivelActual >= nivelMax) {
        return;
    }

    // Crear el nodo izquierdo (mediant entre izquierda y nodo)
    nodo->izquierda = crearNodo(izquierda->numerador + nodo->numerador, izquierda->denominador + nodo->denominador);

    // Crear el nodo derecho (mediant entre nodo y derecha)
    nodo->derecha = crearNodo(nodo->numerador + derecha->numerador, nodo->denominador + derecha->denominador);

    // Llamadas recursivas para continuar construyendo el árbol
    construirArbol(nodo->izquierda, izquierda, nodo, nivelActual + 1, nivelMax);
    construirArbol(nodo->derecha, nodo, derecha, nivelActual + 1, nivelMax);
}

// Función para mostrar los nodos de un nivel específico
void mostrarNivel(Fraccion* nodo, int nivelActual, int nivelDeseado, int* posicion) {
    if (nodo == NULL) {
        return;
    }
    if (nivelActual == nivelDeseado) {
        (*posicion)++; // Incrementar la posición al imprimir un nodo
        printf("%d/%d (Posicion: %d) ", nodo->numerador, nodo->denominador, *posicion);
    }
    else {
        mostrarNivel(nodo->izquierda, nivelActual + 1, nivelDeseado, posicion);
        mostrarNivel(nodo->derecha, nivelActual + 1, nivelDeseado, posicion);
    }
}

// Función para imprimir todos los niveles
void imprimirArbol(Fraccion* raiz, int nivelMax) {
    int posicion = 0;  // Iniciar posición en 0
    // Nivel 0 (0/1 y 1/0)
    printf("Nivel 0: 0/1 (Posicion: 1) 1/0 (Posicion: 2)\n");
    posicion = 2;  // Las primeras dos posiciones ya fueron impresas

    for (int i = 1; i <= nivelMax; i++) {
        printf("Nivel %d: ", i);
        mostrarNivel(raiz, 0, i - 1, &posicion); // Mostrar niveles a partir de 1
        printf("\n");
    }
}

// Función para buscar una fracción en el árbol, retorna el nivel y la posición
int buscarFraccion(Fraccion* nodo, int numerador, int denominador, int nivelActual, int* posicion, int* encontradaPos) {
    if (nodo == NULL) {
        return -1; // No encontrado
    }

    // Comprobar si el nodo actual contiene la fracción que buscamos
    (*posicion)++;  // Incrementar la posición mientras se recorre el árbol
    if (nodo->numerador == numerador && nodo->denominador == denominador) {
        *encontradaPos = *posicion; // Almacenar la posición encontrada
        return nivelActual; // Encontrado, devolver el nivel actual
    }

    // Buscar recursivamente en los subárboles izquierdo y derecho
    int nivelIzquierda = buscarFraccion(nodo->izquierda, numerador, denominador, nivelActual + 1, posicion, encontradaPos);
    if (nivelIzquierda != -1) {
        return nivelIzquierda; // Encontrado en el subárbol izquierdo
    }

    int nivelDerecha = buscarFraccion(nodo->derecha, numerador, denominador, nivelActual + 1, posicion, encontradaPos);
    if (nivelDerecha != -1) {
        return nivelDerecha; // Encontrado en el subárbol derecho
    }

    return -1; // No encontrado en este camino
}

// Inicializar el árbol con el nodo 1/1
Fraccion* inicializarArbol() {
    Fraccion* raiz = crearNodo(1, 1); // Nodo raíz: 1/1
    return raiz;
}

// Programa principal
int main() {
    int nivelMax;
    printf("Ingrese el nivel maximo del arbol (no mayor a 8): ");
    scanf_s("%d", &nivelMax);

    if (nivelMax > 8) {
        printf("El nivel maximo permitido es 8.\n");
        return 1;
    }

    // Inicializar el árbol
    Fraccion* raiz = inicializarArbol();

    // Nodos iniciales para los extremos (0/1 y 1/0)
    Fraccion* izquierdaInicial = crearNodo(0, 1);
    Fraccion* derechaInicial = crearNodo(1, 0);

    // Construir el árbol hasta el nivel máximo ingresado por el usuario
    construirArbol(raiz, izquierdaInicial, derechaInicial, 0, nivelMax);

    // Imprimir el árbol por niveles
    printf("Arbol de Stern-Brocot hasta el nivel %d:\n", nivelMax);
    imprimirArbol(raiz, nivelMax);

    // Ciclo para buscar varias fracciones
    while (1) {
        int numerador, denominador;
        printf("\nIngrese el numerador de la fraccion a buscar (o -1 para salir): ");
        scanf_s("%d", &numerador);

        if (numerador == -1) {
            break; // Salir del ciclo si el usuario ingresa -1
        }

        printf("Ingrese el denominador de la fraccion a buscar: ");
        scanf_s("%d", &denominador);

        // Buscar la fracción 0/1 o 1/0
        if (numerador == 0 && denominador == 1) {
            printf("La fraccion 0/1 se encuentra en el nivel 0, posicion 1.\n");
            continue;
        }
        if (numerador == 1 && denominador == 0) {
            printf("La fraccion 1/0 se encuentra en el nivel 0, posicion 2.\n");
            continue;
        }

        // Buscar la fracción en el árbol
        int posicion = 2; // Iniciar en 2 porque las posiciones 1 y 2 ya están ocupadas
        int encontradaPos = -1;
        int nivel = buscarFraccion(raiz, numerador, denominador, 0, &posicion, &encontradaPos);

        if (nivel != -1) {
            printf("La fraccion %d/%d se encuentra en el nivel %d, posicion %d.\n", numerador, denominador, nivel + 1, encontradaPos);
        }
        else {
            printf("La fraccion %d/%d no esta en el arbol.\n", numerador, denominador);
        }
    }

    return 0;
}
