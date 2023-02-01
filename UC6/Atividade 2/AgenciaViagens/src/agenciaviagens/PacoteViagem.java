/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package agenciaviagens;
// @author Cadu

public class PacoteViagem implements Hospedagem, Transporte{
    private final String destino;
    private final int estadiaEmDias;
    
    private final String descricaoHospedagem;
    private final float valorDiaria;
    
    private final String tipoLocomocao;
    private final float valorLocomocao;
    
    private final float taxaAdicional;
    
    PacoteViagem(String descricaoHospedagem, float valorDiaria, int estadiaEmDias, String destino, String tipoLocomocao, float valorLocomocao, float taxaAdicional){
        this.descricaoHospedagem = descricaoHospedagem;
        this.valorDiaria = valorDiaria;
        this.estadiaEmDias = estadiaEmDias;
        this.destino = destino;
        this.tipoLocomocao = tipoLocomocao;
        this.valorLocomocao = valorLocomocao;
        this.taxaAdicional = taxaAdicional;
    }
    
    // Functions.
    
    private double CalcTotHospedagem(){
        return valorDiaria * estadiaEmDias;
    }
    private double CalcPrecoCLucro(double valor, double margem){
        return valor + (valor * (margem / 100));
    }
    public double CalcTotPacote(double margem){
        return CalcPrecoCLucro(CalcTotHospedagem() + valorLocomocao + taxaAdicional, margem);
    }
    
    // Getters.
    
    public String getDestino(){
        return destino;
    }
    public int getEstadiaEmDias(){
        return estadiaEmDias;
    }
    public float getTaxaAdicional(){
        return taxaAdicional;
    }
    
    @Override
    public String getTipoLocomocao(){
        return tipoLocomocao;
    }
    @Override
    public float getValorLocomocao(){
        return valorLocomocao;
    }
    @Override
    public String getHospedagemDesc(){
        return descricaoHospedagem;
    }
    @Override
    public float getValorDiaria(){
        return valorDiaria;
    }
}