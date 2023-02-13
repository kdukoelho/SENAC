/**
 * @author kdukoelho
 */
package employees;

public class HourlyEmployee extends Employee {
    private final float workedHours;
    private final float valuePerHour;
    
    HourlyEmployee(String name, String cpf, int contractType, String department, Addres addres, float workedHours, float valuePerHour){
        super(name, cpf, contractType, department, addres);
        this.workedHours = workedHours;
        this.valuePerHour = valuePerHour;
        this.contractType = "hourly";
    }
    
    @Override
    public float calculateSalary(int increasePercentage){
        if (increasePercentage <= 0){
            return valuePerHour * workedHours;
        }
        else{
            float increaseValue = (valuePerHour * workedHours) * increasePercentage / 100;
            return valuePerHour * workedHours + increaseValue;
        }
    }
    
    // Getters.
    
    @Override
    public float getValuePerHour(){
        return valuePerHour;
    }
    
    @Override
    public float getWorkedHours(){
        return workedHours;
    }
    
}
