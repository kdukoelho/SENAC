programa
{
	funcao inicio()
	{
		cadeia nomeEmpresa
		caracter desejaContinuar = 'S'
		inteiro qttAparelhos
		real valorOrcamento = 0.0
		real valorPrAparelho
		real desconto
		inteiro condicionalDesconto
		inteiro count = 0

		escreva("-------------------------------------------\n")
		escreva("Calculo orçamentario de ares condicionados\n")
		escreva("-------------------------------------------\n")
		
		enquanto (desejaContinuar == 'S')
		{
			escreva("Nome da empresa: ")
			leia(nomeEmpresa)
			escreva("Valor cobrado por aparelho: ")
			leia(valorPrAparelho)
			escreva("Quantidade de aparelhos a ser realizada a manutenção: ")
			leia(qttAparelhos)
			escreva("Percentual de desconto a ser aplicado na conta final: ")
			leia(desconto)
			escreva("Quantidade de aparelhos necessarios para que o desconto seja aplicado: ")
			leia(condicionalDesconto)
			
			valorOrcamento = CalcularOrcamento(nomeEmpresa, valorPrAparelho, qttAparelhos, desconto, condicionalDesconto)
			
			escreva("Deseja continuar? [S/N]: 	")
			leia(desejaContinuar)
			se (desejaContinuar == 's') { desejaContinuar = 'S' }
			escreva("-----------------------------------------------------------------\n")
		}
		
	}
	
	funcao real CalcularOrcamento(cadeia nomeEmpresa,  real valorPrAparelho, inteiro qttAparelhos, real desconto, inteiro condicionalDesconto)
	{
		real valorTotal = valorPrAparelho * qttAparelhos
		se (qttAparelhos >= condicionalDesconto) 
		{
			real calcDesconto = valorTotal * (desconto/100) 
			valorTotal -= calcDesconto
		}
		escreva("-----------------------------------------------------------------\n")
		escreva("O serviço de " + nomeEmpresa + " custará R$" + valorTotal + "\n")
		escreva("-----------------------------------------------------------------\n")

		retorne valorTotal
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1045; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */