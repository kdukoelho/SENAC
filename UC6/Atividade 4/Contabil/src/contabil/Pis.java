package contabil;

/**
 *
 * @author github.com/kdukoelho
 */
public class Pis extends Tax{
    private float aliquot;
    private float debt;
    private float credit;
    
    Pis(){
        super("PIS");
    }
    
    // Functions.
    
    @Override
    public void setValues(){
        System.out.print("Valor da aliquota: ");
        this.aliquot = UserInput.Float();
        System.out.print("Valor do credito: ");
        this.credit = UserInput.Float();
        System.out.print("Valor do debito: ");
        this.debt = UserInput.Float();
        System.out.println("=========================");
    }


    @Override
    public double calculateTax() {
        return (debt - credit) * (aliquot / 100);
    }    
}
