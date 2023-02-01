programa {
	funcao inicio() {
		inteiro qtdHospedes, numQuarto, valorDiaria
		inteiro valorTot = 0
		inteiro count =  1
		
		escreva("Digite a quantidade de hospedes a serem alocados: ")
		leia(qtdHospedes)
		
		enquanto (count < qtdHospedes + 1)
		{
		    
		    escreva("----------------------------------\n")
		    escreva("Número do quarto para o hospede " + count + ": ")
		    leia(numQuarto)
		    escreva("Valor diária: ")
		    leia(valorDiaria)		    
		    escreva("----------------------------------\n")
		    escreva("Quarto " + numQuarto + " : R$ " + valorDiaria + "\n")
		    valorTot += valorDiaria
		    count += 1
		}
		escreva("----------------------------------\n")
		escreva("Total de diárias: R$ " + valorTot)
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 730; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */