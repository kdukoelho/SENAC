programa {
	funcao inicio() {
		cadeia dia, empresa
		inteiro hora
		
		escreva("Dia da reserva: ")
		leia(dia)
		escreva("Horario da reserva: ")
		leia(hora)
		
		se (dia == "sabado" ou dia == "domingo")
		{
		    se (hora < 7 ou hora >= 15)
		    {
		     escreva("Restaurante indispon�vel.")   
		    }
		    senao
		    {
		        escreva("Nome reserva: ")
		        leia(empresa)
		        escreva("Reserva efetuada para ", empresa, ": ", dia, " �s ", hora, "hrs") 
		    }
		}
		se (dia == "segunda" ou dia == "ter�a" ou dia == "quarta" ou dia == "quinta" ou dia == "sexta")
		{
		    se (hora < 7 ou hora >= 23)
		    {
		        escreva("Restaurante indispon�vel")
		    }
		    senao 
		    {
		        escreva("Nome reserva: ")
		        leia(empresa)
		        escreva("Reserva efetuada para ", empresa, ": ", dia, " �s ", hora, "hrs")
		    }
		}
	}
}
