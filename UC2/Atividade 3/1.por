programa 
{
	funcao inicio() 
	{
	    caracter quartosArray[20]
	    caracter statusQuarto
	    caracter desejaContinuar = 'S'
	    inteiro numQuarto
	    
	    
	    para (inteiro i = 0; i < 20; i++) { quartosArray[i] = 'L' }
	    
	    enquanto (desejaContinuar == 'S' ou desejaContinuar == 's')
	    {
			escreva("----------\n")
			escreva("Informe o número do quarto: ")
			leia(numQuarto)
			numQuarto -= 1
			escreva("O quarto está livre ou ocupado? [L/O]: ")
			leia(statusQuarto)
			escreva("----------\n")
			se (statusQuarto == 'o') { statusQuarto = 'O' }
			se (statusQuarto == 'l') { statusQuarto = 'L' }			
			se (quartosArray[numQuarto] == 'O' e statusQuarto == 'O') { escreva("Esse quarto já está ocupado.\n----------\n") }	       
			se (quartosArray[numQuarto] == 'L' e statusQuarto == 'O') { quartosArray[numQuarto] = 'O' }
			se (quartosArray[numQuarto] == 'O' e statusQuarto == 'L') { quartosArray[numQuarto] = 'L' }
	        
	        escreva("Deseja continuar? [S/N]: ")
	        leia(desejaContinuar)
	    }
	    
	    para (inteiro i = 0; i < 20; i++) 
	    {
	        cadeia livreOuOcupado
	        se (quartosArray[i] == 'L') { livreOuOcupado = "Livre" }
	        senao { livreOuOcupado = "Ocupado" }
	        escreva("Status quarto " + (i+1) + ": " + livreOuOcupado + "\n")
	    }
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 992; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */