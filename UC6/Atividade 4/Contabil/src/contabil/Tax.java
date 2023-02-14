package contabil;

/**
 *
 * @author github.com/kdukoelho
 */
public abstract class Tax implements ITax {
    protected static int id = 0;
    protected String description;
    protected float aliquot;
    
    Tax(String description){
        this.id = id++;
        this.description = description;
    }
    
    // Getters.
    
    @Override
    public String getDescription() {
        return description;
    }
    
    @Override
    public int getId(){
        return id;
    }
}
