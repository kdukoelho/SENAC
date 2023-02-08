 /**
  * @author kdukoelho
  */
package employees;

import java.util.Scanner;

public class UserInput {
    
    public static String String(){
        Scanner sc = new Scanner(System.in);
        return sc.nextLine();
    }
    
    public static int Int(){
        Scanner sc = new Scanner(System.in);
        int input = 0;
        boolean invalidInput = true;
        
        while (invalidInput){
            try{
                input = sc.nextInt();
                invalidInput = false;
            } catch (java.util.InputMismatchException ex){
                System.out.print("Informe um inteiro: ");
                sc.next();
            }
        }
        return input;
    }
    
    public static float Float(){
        Scanner sc = new Scanner(System.in);
        float input = 0f;
        boolean invalidInput = true;
        
        while (invalidInput){
            try{
                input = Float.parseFloat(Float.toString(sc.nextFloat()));
                invalidInput = false;
            } catch (NumberFormatException | java.util.InputMismatchException ex){
                System.out.print("Informe um decimal: ");
                sc.next();
            }
        }
        return input;
    }
}
