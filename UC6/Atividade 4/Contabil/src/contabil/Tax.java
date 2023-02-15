package contabil;

/**
 *
 * @author github.com/kdukoelho
 */
public abstract class Tax implements ITax {
    private static int nextId = 0;
    protected int id;
    protected String description;
    protected float aliquot;
    
    Tax(String description){
        this.id = nextId++;
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
