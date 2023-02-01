import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        CompareAuditoriums(GetUserInput());
    }
    static int GetUserInput(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Digite a quantidade de covidados: ");
        return scanner.nextInt();
    }
    static void CompareAuditoriums(int invitesQtt){
        AuditoriumAlpha auditoriumAlpha = new AuditoriumAlpha(invitesQtt);
        AuditoriumBeta auditoriumBeta = new AuditoriumBeta(invitesQtt);
        String alphaUsePossibility = auditoriumAlpha.CheckUsePossibility();
        String betaUsePossibility = auditoriumBeta.CheckUsePossibility();

        if (alphaUsePossibility.startsWith("1") && betaUsePossibility.startsWith(("0"))) {
            System.out.println("Use o auditório Alpha. " + alphaUsePossibility.substring(1));
        }
        else if (alphaUsePossibility.startsWith("0") && betaUsePossibility.startsWith("1")){
            System.out.println("Use o auditório Beta.") ;
        }
        else {
            System.out.println("Número de convidados inválido.");
        }
    }
}