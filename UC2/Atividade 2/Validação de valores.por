programa {
	funcao inicio() {
		inteiro valorDiaria, qtdDias
		
		escreva("Digite o valor da diária: ")
		leia(valorDiaria)
		
		enquanto (valorDiaria <= 0)
		{
		    escreva("Valor inválido. Por favor digite novamente\nValor da diária: ")
		    leia(valorDiaria)
		}
		
		escreva("Digite a quantidade de dias de hospedagem: ")
		leia(qtdDias)
		enquanto (qtdDias <= 0 ou qtdDias > 30) 
		{
		    escreva("Valor inválido. Por favor digite novamente\nQuantidade de dias:  ")
		    leia(qtdDias)
		}
	}
}
