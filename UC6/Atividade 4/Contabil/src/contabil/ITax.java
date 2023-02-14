package contabil;

/**
 *
 * @author github.com/kdukoelho
 */
public interface ITax {
    double calculateTax();    
    void setValues();
    String getDescription();
    int getId();
}
