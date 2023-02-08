/**
 * @author kdukoelho
 */
package employees;

public abstract class Employee {
    private static int nextId = 0;
    protected final int ID;
    protected String name;
    protected final String CPF;
     protected String contractType;
    protected String department;
    protected Addres addres;
   
    
    Employee(String name, String cpf, int contractType, String department, Addres addres){
        this.ID = nextId++;
        this.name = name;
        this.CPF = cpf;
        this.contractType = contractType == 1 ? "monthly" : "hourly";
        this.department = department;
        this.addres = addres;
    }
    
    // Functions.
    
     public float calculateSalary(int increasePercentage){
         return 0;
     }
    
    // Getters.
    
    public int getId(){
        return ID;
    }
    
    public String getName(){
        return name;
    }
    
    public String getCPF(){
        return CPF;
    }
    
    public String getDepartment(){
        return department;
    }
    
    public Addres getAddres(){
        return addres;
    }
    
    public String getContractType(){        
        return contractType;
    }
    
    public float getValuePerHour(){
        return 0; 
    }
    
    public float getWorkedHours(){
        return 0;
    }  
}
