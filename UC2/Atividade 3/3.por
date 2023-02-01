programa
{
	funcao inicio()
	{
		cadeia hospedesArray[15]
		inteiro escolhaUsuario = 0
		inteiro count = 0
		enquanto (escolhaUsuario < 1 ou escolhaUsuario > 3)
		{
			escreva("----------\n")
			escreva("1 - Cadastrar \n2 - Pesquisar \n3 - Sair\nSua escolha:")
			leia(escolhaUsuario)
			se (escolhaUsuario == 3) { pare }
			se (escolhaUsuario == 2) 
			{
				escreva("----------\n")
				cadeia nomePesquisa
				cadeia string = ""
				escreva("Nome hospede(pesquisa): ")
				leia(nomePesquisa)
				para (inteiro i = 0; i < 15; i++)
				{
					se (hospedesArray[i] == nomePesquisa) 
					{ 
						string = ("Hospede: " + hospedesArray[i] + "\nEncontrado no indice: " + (i+1) + "\n")
						pare
					}
					senao
					{
						string = ("Hospede não encontrado.\n")
					}
				}
				escreva("----------\n")
				escreva(string)
			}
			se (escolhaUsuario == 1)
			{
				escreva("----------\n")			
				se (count >= 15) { escreva("Maximo de cadastro atingido.") }
				senao
				{
					cadeia nomeHospede
					escreva("Nome hospede(cadastro): ")
					leia(nomeHospede)
					hospedesArray[count] = nomeHospede
					count++
				}
			}
		escolhaUsuario = 0
		}		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 262; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */