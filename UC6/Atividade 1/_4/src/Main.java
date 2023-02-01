import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class Main {
    static List<Guest> guestList = new ArrayList<>();
    public static void main(String[] args) {
        Menu();
    }
    private static void Menu(){
        try {
            while (true) {
                System.out.print("""
                        ==============
                        1 - Cadastrar;
                        2 - Pesquisar;
                        3 - Sair.
                        ==============
                        >\s""");
                Scanner userInput = new Scanner(System.in);
                int userOption = userInput.nextInt();
                if (userOption == 1) {
                    Register();
                } else if (userOption == 2) {
                    Search();
                } else if (userOption == 3) {
                    break;
                } else {
                    System.out.println("Please input a valid option.");
                }
            }
        } catch (InputMismatchException ex){
            System.out.println("!!Uses only integers!!");
            Menu();
        }
    }
    private static String GetNameFromUserInput() {
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine();
    }
    private static void Register() {
        System.out.println("\n---Cadastro---");
        if (guestList.size() >= 15){
            System.out.println("Máximo de cadastros atingido.");
        }
        else {
            System.out.print("Nome: ");
            String name = GetNameFromUserInput();
            guestList.add(new Guest(name));
        }
        System.out.println("--------------\n");
    }
    private static void Search(){
        System.out.println("\n---Pesquisa---");
        System.out.print("Nome: ");
        String inputName = GetNameFromUserInput();
        int index = 0;
        for (Guest guest : guestList) {
            String listGuestName = guest.getName();
            if (listGuestName.equals(inputName)){
                String message = String.format("Hóspede %s encontrado no índice %s", inputName, index);
                System.out.println(message);
                break;
            }
            else if(index == guestList.size() - 1){
                System.out.println("Hóspede não encontrado.");
            }
            index++;
        }
        System.out.println("--------------\n");
    }
}