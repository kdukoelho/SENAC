/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package agenciaviagens;
 // @author Cadu

public class Venda {
    private final String nomeCliente;
    private final String formaPagamento;
    private PacoteViagem pacoteViagem;
    
    Venda(String nomeCliente, String formaPagamento, PacoteViagem pacoteViagem){
        this.nomeCliente = nomeCliente;
        this.formaPagamento = formaPagamento;
        this.pacoteViagem = pacoteViagem;
    }
    
    // Functions
    
    private double Dolar_P_Reais(double valorEmDolar, double cotacaoDolar){
        return valorEmDolar * cotacaoDolar;
    }
    
    public void PrintPacoteTot_Dolar_Real(double margem){
        double valorUS = pacoteViagem.CalcTotPacote(margem); double valorRS = Dolar_P_Reais(pacoteViagem.CalcTotPacote(margem), 5.08);
        String formatedString = String.format("==========Total==========\nDolar: %s\nReal: %s\n=========================", valorUS, valorRS);
        System.out.println(formatedString);
    }
    
    public String[] GetInfosFromPacoteObjt(){
        String[] infos = {pacoteViagem.getDestino(), pacoteViagem.getHospedagemDesc(), Integer.toString(pacoteViagem.getEstadiaEmDias()), Float.toString(pacoteViagem.getValorDiaria()), pacoteViagem.getTipoLocomocao(), Float.toString(pacoteViagem.getValorLocomocao()), Float.toString(pacoteViagem.getTaxaAdicional())};
        return infos;
    }
    
    // Getters.
    
    public String getNomeCliente(){
        return nomeCliente;
    }
    public String getFormaPagamento(){
        return formaPagamento;
    };
}
