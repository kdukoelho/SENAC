/**
 * @author kdukoelho
 */
package employees;

import java.util.ArrayList;
import java.util.List;

public class Employees {          
    public static void main(String[] args) {
         printEmployees(buildEmployeesList());
         
    }
    
    private static List<Employee> buildEmployeesList(){
        List<Employee> employeeList = new ArrayList();
        boolean userChoiceSN = true;
        int count = 0;
        
        System.out.println(String.format("Informe ate 10 funcionários: %s/10", count));
        do{
            employeeList.add(entryEmployee());
            count++;
            userChoiceSN = askToUser();
        }while(count < 10 && userChoiceSN == true);
        
        return employeeList;
    }
    
    private static boolean askToUser(){
        String userResponse;
        do{
            System.out.print("\nDeseja cadastrar outro funcionario?[S/N]: ");
            userResponse = UserInput.String().toUpperCase();
        } while (!userResponse.equals("S") && !userResponse.equals("N"));
        
        if (userResponse.equals("S")){
            return true;
        }
        else{
            return false;
        }
    }
    
    private static int getSalaryIncrease(){
        System.out.print("Aumento geral de salario: ");
       return UserInput.Int();
    }
    
    private static Employee entryEmployee(){
        int type;        
        System.out.print("""
                         =========================
                             Dados funcionario
                         =========================
                         """);
        try{
            do{
            System.out.print("""
                            Modalidade de recebimento: 
                            1 - Assalariado; 
                            2 - Horista.
                           """);
            System.out.print("> ");
            type = UserInput.Int();
            }while (type != 1 && type != 2);
        }
        catch(java.util.InputMismatchException ex){
            System.out.print("> ");
            type = UserInput.Int();
        }
        System.out.println("=========================");
        System.out.print("Nome: ");
        String name = UserInput.String();
        System.out.print("CPF: ");
        String cpf = UserInput.String();
       
        if(type == 1){
            System.out.print("Salario: ");
            float salary = UserInput.Float();
            return new MonthlyEmployee(name, cpf, entryAddres(), salary);
        }
        else{
            System.out.print("Valor por hora: ");
            float valuePerHour = UserInput.Float();
            System.out.print("Horas trabalhadas: ");
            float workedHours = UserInput.Float();
            return new HourlyEmployee(name, cpf, entryAddres(), workedHours, valuePerHour);
        }
    }
    
    private static Addres entryAddres(){
        System.out.println("======== Endereco ========");
        System.out.print("Estado: ");
        String state = UserInput.String();
        System.out.print("Cidade: ");
        String city = UserInput.String();
        System.out.print("Bairro: ");
        String neighborhood = UserInput.String();
        System.out.print("Logradouro: ");
        String street = UserInput.String();
        System.out.print("House number: ");
        String number = UserInput.String();
        
        return new Addres(state, city, neighborhood, street, number);
    }
    
    private static void printEmployees(List<Employee> employeeArray){
        int salaryIncrease = getSalaryIncrease();
        System.out.println("\n");
        for (Employee employee : employeeArray){
            String salaryString;
            if (employee.getContractType().equals("hourly")){
                salaryString = String.format("""
                                             Valor da hora: %s
                                             Horas trabalhadas: %s
                                             Salario se trabalhado 1 mes(C/ aumento aplicado): %s
                                             """, employee.getValuePerHour(), employee.getWorkedHours(), employee.calculateSalary(salaryIncrease));
            }
            else{
                salaryString = String.format("Salario: %s", employee.calculateSalary(salaryIncrease));
            }
            
            
            String finalString = String.format("""
                                          ====== Funcionario %s ======
                                          Nome: %s
                                          CPF: %s
                                          Tipo de contrato: %s
                                          %s
                                          Endereco: %s
                                          """, employee.getId(), employee.getName(), employee.getCPF(), employee.getContractType(), salaryString, employee.getAddres().getBuildedAddres());
            System.out.println(finalString);            
        }
        System.out.println("===========================");
       
    }
}
