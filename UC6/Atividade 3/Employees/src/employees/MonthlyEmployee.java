/**
 * @author kdukoelho
 */
package employees;

public class MonthlyEmployee extends Employee {
    private final float salary;
    
    MonthlyEmployee(String name, String cpf, int contractType, String department, Addres addres, float salary){
        super(name, cpf, contractType, department, addres);
        this.salary = salary;
        this.contractType = "monthly";
    }
    
    @Override
    public float calculateSalary(int increasePercentage){
        if (increasePercentage <= 0){
            return salary;
        }
        else{
            float increaseValue = salary * increasePercentage / 100;
            return salary + increaseValue;
        }
    }
    
}
