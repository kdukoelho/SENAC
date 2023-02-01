programa {
	funcao inicio() 
	{
		caracter decisaoUsuario
		inteiro valorDiaria, idadeHospede
		inteiro idadeMaisNovo = 0
		inteiro idadeMaisVelho = 0
		inteiro count = 0
		inteiro countMeia = 0
		inteiro countGratuidade = 0
		inteiro valorTotal = 0
		cadeia nomeHospede = ""
		cadeia nomeMaisVelho = ""
		cadeia nomeMaisNovo = ""
		
		escreva("Digite o valor da diária: ")
		leia(valorDiaria)
		
		enquanto (verdadeiro)
		{
		    escreva("Nome do hóspede: ")
		    leia(nomeHospede)
		    escreva("Idade do hóspede: ")
		    leia(idadeHospede)
		    
		    // Determinar que cada um irá pagar.
		    se (idadeHospede <= 4)
		    {
		        escreva(nomeHospede + " possui gratuidade.\n")    
		        countGratuidade += 1
		    }
		    se (idadeHospede >= 80)
		    {
		        escreva(nomeHospede + " paga meia.\n")
		        valorTotal += (valorDiaria / 2)
		        countMeia += 1
		    }
		    se (idadeHospede > 4 e idadeHospede < 80)
		    {
		        valorTotal += valorDiaria
		    }
		    
		    // Determinar idade do mais novo e mais velho.
		    
		    se (count == 0) 
		    {
		        idadeMaisVelho = idadeHospede
		        idadeMaisNovo = idadeHospede
		    }
		    se (idadeHospede > idadeMaisVelho)
		    {
		        nomeMaisVelho = nomeHospede
		        idadeMaisVelho = idadeHospede
		    }
		    se (idadeHospede < idadeMaisNovo)
		    {
		        nomeMaisNovo = nomeHospede
		        idadeMaisNovo = idadeHospede
		    }
		    
		    // Sair do loop.
		    escreva("Deseja continuar? [S/N]: ")
		    leia(decisaoUsuario)
		    se (decisaoUsuario == 'N' ou decisaoUsuario == 'n')
		    {
		        pare
		    }
		    count += 1
		}
		
		escreva("Total de hospedagens: R$" + valorTotal + "; "  + countGratuidade + " gratuidade(s); " + countMeia + " meia(s).\n")
		escreva("O hóspede mais velho é " + nomeMaisVelho + " com " + idadeMaisVelho + " anos.\n")
		escreva("O hóspede mais novo é " + nomeMaisNovo + " com " + idadeMaisNovo + " ano(s).\n")
	}
}
