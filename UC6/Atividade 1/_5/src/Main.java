import java.util.Scanner;

public class Main {
    static Rooms[][] roomsList = new Rooms[3][4];
    public static void main(String[] args) {
        InstantiateRooms();
        DefineOccupiedRoom();
        PrintRoomsStatus();
    }
    private static void InstantiateRooms() {
        for (int floor = 0; floor < 4; floor++){
            for (int room = 0; room < 3; room++){
                roomsList[room][floor] = new Rooms('L');
            }
        }
    }
    private static int GetUserIntInput(){
        Scanner scanner = new Scanner(System.in);
        return scanner.nextInt();
    }
    private static void DefineOccupiedRoom(){
        System.out.println("---Definir quartos ocupados---");
        while (true){
            System.out.print("Informe o andar: "); int floor = GetUserIntInput();
            System.out.print("Informe o quarto: "); int room = GetUserIntInput();
            if (floor > 4 || room > 3){
                ConsoleLine();
                System.out.println("\nContamos com 3 quartos em cada um dos 4 andares. Informe um valor válido.\n");
                ConsoleLine();
                DefineOccupiedRoom();
                break;
            }

            roomsList[room-1][floor-1].setStatus('O');

            ConsoleLine();
            System.out.print("Deseja continuar?[S/N] > ");
            Scanner scanner = new Scanner(System.in);
            String userInput = scanner.nextLine().toUpperCase();
            ConsoleLine();
            if (userInput.equals("N")){
                break;
            }
        }
    }
    private static void PrintRoomsStatus(){
        for (int floor = 0; floor < 4; floor++){
            String floorMessage = String.format("=== %s° Andar ===", floor + 1); System.out.println(floorMessage);
            for (int room = 0; room < 3; room++) {
                String status = roomsList[room][floor].getStatus() == 'O' ? "Ocupado" : "Livre";
                String roomMessage = String.format("Quarto %s: %s", room+1, status);
                System.out.println(roomMessage);
            }
        }
    }
    private static void ConsoleLine(){
        System.out.println("------------------------------");
    }
}