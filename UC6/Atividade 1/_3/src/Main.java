import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        PrintDiscounts(DefineDailyRate(), RegisterGuest());
    }
    private static double DefineDailyRate(){
        System.out.println("-----System Config----");
        Scanner userInput = new Scanner(System.in);
        System.out.print("Valor da diária: ");
        return userInput.nextDouble();
    }
    private static List<Guests> RegisterGuest(){
        System.out.println("-----Guest register-----");
        List<Guests> guestsList = new ArrayList<>();
        while (true){
            Scanner userInput = new Scanner(System.in);
            System.out.print("Nome do hóspede: "); String guestName = userInput.nextLine();
            if (guestName.equals("PARE")){ break; }
            System.out.print("Idade do hóspede: "); int guestAge = userInput.nextInt();
            System.out.println("-----------------------");
            Guests guests = new Guests(guestName, guestAge);
            guestsList.add(guests);
        }
        return guestsList;
    }
    private static void PrintDiscounts(double dailyRate, List<Guests> guestsList){
        for (Guests guests : guestsList){
            if (guests.getDiscount() < 1){
                System.out.print("""
                        \n-------Descontos-------\s
                        Os clientes que receberão desconto e os valores totais das diárias:
                        """);
                break;
            }
        }
        for (Guests guest : guestsList){
            double discountPercentage = guest.getDiscount();
            if (discountPercentage < 1){
                double finalDailyRate = dailyRate * discountPercentage;
                String outputString = String.format("%s: R$%s", guest.getName(), finalDailyRate);
                System.out.println(outputString);
            }
        }
    }
}