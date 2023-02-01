programa {
	funcao inicio() {
		real qtdPessoas, qtdCadeiras
		
		escreva("Número de convidados esperado: ")
		leia(qtdPessoas)
		
		se (qtdPessoas > 350 ou qtdPessoas <= 0)
		{
		    escreva("Número de convidados inválido")
		}
		senao 
		{
		    se (qtdPessoas <= 220)
		    {
		        se (qtdPessoas <= 150)
		        {
		        escreva("Use o auditorio alfa")
		        }
		        senao
		        {
		            qtdCadeiras = qtdPessoas - 150
		            escreva("Use o auditorio alfa\nUse mais ", qtdCadeiras, " cadeiras.")
		        }
		    }
		    
		    se (qtdPessoas > 220)
		    {
		        escreva("Use o auditório beta")
		    }
		}
	}
}
