package contabil;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author github.com/kdukoelho
 */
public class Ipi extends Tax {    
    private float productValue;
    private float fare;
    private float insurance;
    private List<Float> otherValuesList = new ArrayList<>();
    
    Ipi(){
        super("IPI");
    }
    
    // Functions.

    @Override
    public void setValues() {
        System.out.print("Valor da aliquota: ");
        this.aliquot = UserInput.Float();
        System.out.print("Valor do produto: ");
        this.productValue = UserInput.Float();
        System.out.print("Valor do frete: ");
        this.fare = UserInput.Float();
        System.out.print("Valor do seguro: ");
        this.insurance = UserInput.Float();
        System.out.println("Outras despesas (DIGITE '0' P/ PARAR): ");
        while (true) {
            System.out.print("> ");
            Float value = UserInput.Float();
            if (value > 0){
                this.otherValuesList.add(value);
            }
            else{
                break;
            }            
        }
        
        System.out.println("=========================");
    }
    
    @Override
    public double calculateTax() {
        double sum = productValue + fare + insurance;
        double listSum = otherValuesList.stream().mapToDouble(i -> i).sum();
        return (sum + listSum) * (aliquot / 100);
    }
    
}
