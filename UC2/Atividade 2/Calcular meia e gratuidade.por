programa {
	funcao inicio() 
	{
		inteiro valorDiaria, idadeHospede
		inteiro  countMeia = 0
		inteiro countGratuidade = 0
		inteiro valorTotal = 0
		cadeia nomeHospede = ""
		
		escreva("Digite o valor da diária: ")
		leia(valorDiaria)
		
		enquanto (verdadeiro)
		{
		    escreva("Nome do hóspede: ")
		    leia(nomeHospede)
		    
		    se (nomeHospede == "PARE")
		    {
		        pare
		    }
		    
		    escreva("Idade do hóspede: ")
		    leia(idadeHospede)
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
		}
		
		escreva("Total de hospedagens: R$" + valorTotal + "; "  + countGratuidade + " gratuidade(s); " + countMeia + " meia(s).") 
	}
}
