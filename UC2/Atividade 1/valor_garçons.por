programa {
	funcao inicio() {
	    const real valorHora = 10.50
	    real qtdGarcons, tempoDuracao, aPagarGarcons
		
		escreva("Quantidade de gar�ons: ")
		leia(qtdGarcons)
		escreva("Dura��o do evento: ")
		leia(tempoDuracao)
		
		aPagarGarcons = (qtdGarcons * valorHora) * tempoDuracao
		
		escreva("Custo total: ", aPagarGarcons)
	}
}
