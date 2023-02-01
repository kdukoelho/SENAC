programa 
{
	funcao inicio() 
	{
		cadeia nomeArray[5]
		cadeia nomeHospede
		cadeia stringSexo = ""
		caracter sexoArray[5]
		caracter sexoHospede
		
		para (inteiro i = 0; i < 5; i++)
		{
			escreva("----------\n")
			escreva("Digite o nome do(a) hospede " + (i+1) + ": ")
			leia(nomeHospede)
		    	escreva("Digite o sexo do(a) hospede " + (i+1) + ". [M/F]: ")
			leia(sexoHospede)
		    	se (sexoHospede == 'm') { sexoHospede = 'M' }
		    	se (sexoHospede == 'f') { sexoHospede = 'F'}
			nomeArray[i] = nomeHospede
			sexoArray[i] = sexoHospede
	     }
	     
	     escreva("----------\n")
	     para (inteiro i = 0; i < 5; i++)
		{
			se (sexoArray[i] == 'F')
	     	{
		     	escreva(nomeArray[i] + " - " + "Feminino" + "\n")	     		     		
	     	}   		     
	     }
	     para (inteiro i = 0; i < 5; i++)
		{
			se (sexoArray[i] == 'M')
	     	{
		     	escreva(nomeArray[i] + " - " + "Masculino" + "\n")	     		     		
	     	}		     		     
	     }
	     escreva("----------\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 899; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */