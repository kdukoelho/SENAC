/**
 * @author kdukoelho
 */
package employees;

public abstract class Employee {
    private static int nextId = 0;
    protected final int id;
    protected String name;
    protected final String CPF;
    protected Addres addres;
    protected String contractType;
    
    Employee(String name, String cpf, Addres addres){
        this.id = nextId++;
        this.name = name;
        this.CPF = cpf;
        this.addres = addres;
    }
    
    // Functions.
    
     public float calculateSalary(int increasePercentage){
         return 0;
     }
    
    // Getters.
    
    public String getId(){
        return Integer.toString(id);
    }
    
    public String getName(){
        return name;
    }
    
    public String getCPF(){
        return CPF;
    }
    
    public Addres getAddres(){
        return addres;
    }
    
    public String getContractType(){        
        return contractType.equals("hourly") ? "Horista" : "Assalariado";
    }
    
    public float getValuePerHour(){
        return 0; 
    }
    
    public float getWorkedHours(){
        return 0;
    }  
}
