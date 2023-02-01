import java.util.Scanner;

public class Main {
    static char[] bedrooms = {'A', 'B'};
    public static void main(String[] args) {
        Get_A_BedroomCostumer(AllocateCostumers(GetUserInput()));
    }
    private static Costumer[] GetUserInput(){
        Costumer[] costumersArray = new Costumer[2];
        for (int i = 0; i < 2; i++) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("Digite o nome do cliente: ");
            String costumerName = scanner.nextLine();
            System.out.println("Digite a idade do cliente: ");
            int costumerAge = scanner.nextInt();

            Costumer costumer = new Costumer(costumerName, costumerAge, bedrooms[i]);
            costumersArray[i] = costumer;
        }
        return costumersArray;
    }
    private static Costumer[] AllocateCostumers(Costumer[] costumersArray) {
        int olderAge = costumersArray[0].getAge();
        int olderArrayPos = 0; int count = 0;
        for (Costumer costumer : costumersArray) {
            if (olderAge < costumer.getAge()) {
                olderArrayPos = count;
            }
            count++;
        }
        int newerArrayPos = olderArrayPos == 0 ? 1 : 0;
        costumersArray[olderArrayPos].setAllocatedBedroom(bedrooms[0]);
        costumersArray[newerArrayPos].setAllocatedBedroom(bedrooms[1]);
        return costumersArray;
    }
    private static void Get_A_BedroomCostumer(Costumer[] costumersArray){
        for (Costumer costumer : costumersArray) {
            if (costumer.getAllocatedBedroom() == 'A'){
                String toPrintString = "Cliente alocado no quarto A: " + costumer.getName();
                toPrintString = costumer.getDiscount() != 0 ? toPrintString + " | Desconto: " + costumer.getDiscount() : "";
                System.out.println(toPrintString);
            }
        }
    }
}