/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package agenciaviagens;

import java.util.Scanner;
// @author Cadu

public class AgenciaViagens {
    public static void main(String[] args) {
        PrintInfosVenda(CadastrarVenda());
    }
    
    // Functions.
    
    private static Venda CadastrarVenda(){
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Nome cliente: ");
        String nomeCliente = scanner.nextLine();
        
        System.out.print("Forma de pagamento: ");
        String formaPagamento = scanner.nextLine();
        
        return new Venda(nomeCliente, formaPagamento, CadastrarPacote());
    }
    
    private static PacoteViagem CadastrarPacote(){
        try {
            System.out.print("Destino: ");
            String destino = GetUserString();

            System.out.print("Descreva a hospedagem: ");       
            String descHospedagem = GetUserString();

            System.out.print("Valor diária: ");
            float valorDiaria = GetUserFloat();

            System.out.print("Tempo de estadia em dias: ");
            int estadiaEmDias = GetUserInt();

            System.out.print("Tipo de locomocao: ");
            String tipoLocomocao = GetUserString();
            
            System.out.print("Valor locomocao: ");
            float valorLocomocao = GetUserFloat();
            
            System.out.print("Taxas adicionais (0 se não houver): ");
            float taxaAdicional = GetUserFloat();
            
            return new PacoteViagem(descHospedagem, valorDiaria, estadiaEmDias, destino, tipoLocomocao, valorLocomocao, taxaAdicional);
        }
        catch (Exception ex) {
            System.out.println(String.format("Unexpected error at PacoteViagem: %s", ex));
            return null;
        }      
    }
    
    private static void PrintInfosVenda(Venda venda){
        String[] infos = venda.GetInfosFromPacoteObjt();
        String formatedString = String.format("\n=========Cliente=========\nNome cliente: %s\nForma pgto: %s\n==========Pacote=========\nLocalizacao: %s\nDescricao hospedagem: %s\nEstadia: %s dias\nValor diaria: %s\nLocomocao: %s\nValor locomocao: %s\nTaxa adicional: %s",
    venda.getNomeCliente(), venda.getFormaPagamento(), infos[0], infos[1], infos[2], infos[3], infos[4], infos[5], infos[6]);
        System.out.println(formatedString);
        System.out.print("\nDigite a margem de lucro desejada: ");
        float margem = GetUserFloat();
        venda.PrintPacoteTot_Dolar_Real(margem);
    }
    
    private static String GetUserString(){
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine();
    }
    private static float GetUserFloat(){
        Scanner scanner = new Scanner(System.in);
        return scanner.nextFloat();
    }
    private static int GetUserInt(){
        Scanner scanner = new Scanner(System.in);
        return scanner.nextInt();
    }
}
