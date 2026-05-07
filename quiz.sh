#!/bin/bash

# Funcion realizada para hacer las preguntas y validar las respuestas
hacer_pregunta() {

    operacion=$1
    A=$2
    B=$3
    resultado=$4

    intentos=3

    while [ $intentos -gt 0 ]
    do
        echo "¿Cuanto es $A $operacion $B?"
        read respuesta

        if [ "$respuesta" -eq "$resultado" ]; then
            echo "¡Correcto! Vas muy bien."
            return
        else
            intentos=$((intentos - 1))

            if [ $intentos -gt 0 ]; then
                echo "Incorrecto. Intentalo de nuevo."
                echo "Solo te quedan $intentos intentos."
            else
                echo "Se te acabaron los intentos."
                echo "La respuesta correcta era: $resultado"
            fi
        fi
    done
}

# Menu Principal del programa
while true
do
    echo "=========================="
    echo "      QUIZ MATEMATICO"
    echo "=========================="
    echo "1) Problemas de suma"
    echo "2) Problemas de resta"
    echo "3) Problemas de multiplicacion"
    echo "4) Problemas de division"
    echo "9) Salir"
    echo -n "Elige una opcion: "

    read opcion

    case $opcion in

        1)
            A=$((RANDOM % 101))
            B=$((RANDOM % 101))

            resultado=$((A + B))

            hacer_pregunta "+" $A $B $resultado
            ;;

        2)
            A=$((RANDOM % 101))
            B=$((RANDOM % 101))

            # Intercambiar si A < B
            if [ $A -lt $B ]; then
                temp=$A
                A=$B
                B=$temp
            fi

            resultado=$((A - B))

            hacer_pregunta "-" $A $B $resultado
            ;;

        3)
            A=$((RANDOM % 100 + 1))
            B=$((RANDOM % 10 + 1))

            resultado=$((A * B))

            hacer_pregunta "*" $A $B $resultado
            ;;

        4)
            A=$((RANDOM % 20 + 1))
            B=$((RANDOM % 10 + 1))

            A=$((A * B))

            resultado=$((A / B))

            hacer_pregunta "/" $A $B $resultado
            ;;

        9)
            echo "Estas saliendo del programa, gracias por jugar!"
            break
            ;;

        *)
            echo "Opción no valida. Intenta nuevamente."
            ;;
    esac

    echo
done
