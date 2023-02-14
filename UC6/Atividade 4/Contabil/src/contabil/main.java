package contabil;

/**
 *
 * @author github.com/kdukoelho
 */
public class main {

   
    public static void main(String[] args) {
        showTaxes(registerTaxes());
    }
    
    private static Payment registerTaxes(){
        System.out.print("""
                         =========================
                           Cadastro de impostos
                         =========================
                         """);
        Payment corporation = new Payment();
        corporation.setCorpName();
        while (true){
            System.out.print("""
                             \n==== Tipo de imposto ====
                             1 - PIS;
                             2 - IPI;
                             0 - PARAR.
                             """);
            int taxChoice = -1;
            while (taxChoice != 0 && taxChoice != 1 && taxChoice != 2){
                System.out.print("> ");
                taxChoice = UserInput.Int();   
            }
            if (taxChoice == 0){ break; }
            switch (taxChoice) {
                case 1 -> {
                    Pis pis = new Pis();
                    System.out.println("=========================");
                    System.out.println(String.format("%s %s", pis.getDescription(), pis.getId() + 1));
                    pis.setValues();
                    corporation.addTaxesToBePaid(pis);
                }
                case 2 -> {
                    Ipi ipi = new Ipi();
                    System.out.println("=========================");
                    System.out.println(String.format("%s %s", ipi.getDescription(), ipi.getId() + 1));
                    ipi.setValues();
                    corporation.addTaxesToBePaid(ipi);
                }
            }
        }
        return corporation;
    }
    
    private static void showTaxes(Payment corporation){
        System.out.println("\n=========================");
        System.out.println(String.format("Empresa: %s", corporation.getCorpName()));
        for (Tax tax : corporation.getTaxesToBePaidList()){
            System.out.println("=========================");
            System.out.println(String.format("""
                                                     %s - %s
                                                     Total: %s
                                                     """, tax.getDescription(), tax.getId() + 1, tax.calculateTax()));
        }
        
    }
}
