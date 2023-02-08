/**
 * @author kdukoelho
 */
package employees;

public class MonthlyEmployee extends Employee {
    private float salary;
    
    MonthlyEmployee(String name, String cpf, Addres addres, float salary){
        super(name, cpf, addres);
        this.salary = salary;
        this.contractType = "monthly";
    }
    
    @Override
    public float calculateSalary(int increasePercentage){
        if (increasePercentage <= 0){
            return salary;
        }
        else{
            float increaseValue = salary * (increasePercentage / 100);
            return salary + increaseValue;
        }
    }
    
}
