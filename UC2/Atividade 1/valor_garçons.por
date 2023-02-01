programa {
	funcao inicio() {
	    const real valorHora = 10.50
	    real qtdGarcons, tempoDuracao, aPagarGarcons
		
		escreva("Quantidade de garçons: ")
		leia(qtdGarcons)
		escreva("Duração do evento: ")
		leia(tempoDuracao)
		
		aPagarGarcons = (qtdGarcons * valorHora) * tempoDuracao
		
		escreva("Custo total: ", aPagarGarcons)
	}
}
