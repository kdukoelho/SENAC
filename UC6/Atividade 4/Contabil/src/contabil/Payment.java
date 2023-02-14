package contabil;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author github.com/kdukoelho
 */
public class Payment {
    private String corpName;
    private List<Tax> taxesToBePaidList = new ArrayList<>();
    
    // Functions.
    
    public void setCorpName(){
        System.out.print("Nome da empresa: ");
        this.corpName = UserInput.String();
    }
    
    public void addTaxesToBePaid(Tax tax){
        taxesToBePaidList.add(tax);
    }
    
    // Getters.

    public String getCorpName() {
        return corpName;
    }

    public List<Tax> getTaxesToBePaidList() {
        return taxesToBePaidList;
    }
}
