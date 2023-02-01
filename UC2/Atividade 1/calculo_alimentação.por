programa {
	funcao inicio() {
		const real cafe = 0.2
		const real agua = 0.5
	    const real salgadinhos = 7.0
		inteiro qtdPessoas
		real totalCafe, totalAgua, totalSalgadinhos
	    
	    escreva("Digite a quantidade de pessoas esperada: ")
	    leia(qtdPessoas)
	    
	    se (qtdPessoas > 350) 
	    {
	        escreva("Quantidade de convidados superior a capacidade do salão.")
	    }
	    senao
	    {
	        totalCafe = cafe * qtdPessoas
	        totalAgua = agua * qtdPessoas
	        totalSalgadinhos = salgadinhos * qtdPessoas
	        escreva(totalCafe, " litros de café, ", totalAgua, " litros de água, ", totalSalgadinhos, " salgadinhos.")
	    }
	}
}
