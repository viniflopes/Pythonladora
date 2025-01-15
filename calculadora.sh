#!/bin/bash

# Calculadora em Shell Script
echo "Seja bem-vindo à Shelladora!"

# Função para obter número
tem_ponto() {
    if [[ $1 == *.* ]]; then
        echo 1
    else
        echo 0
    fi
}

obter_numero() {
    while true; do
        read -p "$1" entrada
        if [[ $(tem_ponto "$entrada") -eq 1 ]]; then
            if [[ $entrada =~ ^[0-9]+\.[0-9]+$ ]]; then
                echo $entrada
                return
            fi
        elif [[ $entrada =~ ^[0-9]+$ ]]; then
            echo $entrada
            return
        fi
        echo "Entrada inválida. Tente novamente!"
    done
}

# Laço principal
while true; do
    # Recebendo dois números
    num1=$(obter_numero "Digite o primeiro número: ")
    num2=$(obter_numero "Digite o segundo número: ")

    # Menu de operações
    echo -e "\nEscolha uma operação:"
    echo "1 - Adição"
    echo "2 - Subtração"
    echo "3 - Multiplicação"
    echo "4 - Divisão"
    echo "5 - Sair"

    read -p "Digite o número da operação desejada: " escolha

    # Realizando as operações
    case $escolha in
        1) echo "Resultado: $(echo "$num1 + $num2" | bc)";;
        2) echo "Resultado: $(echo "$num1 - $num2" | bc)";;
        3) echo "Resultado: $(echo "$num1 * $num2" | bc)";;
        4) 
            if (( $(echo "$num2 != 0" | bc -l) )); then
                echo "Resultado: $(echo "$num1 / $num2" | bc -l)"
            else
                echo "Erro: divisão por zero!"
            fi
            ;;
        5)
            echo "Obrigado por utilizar a Shelladora."
            break
            ;;
        *)
            echo "Opção inválida! Tente novamente."
            ;;
    esac
    echo "------------------------------"
done
