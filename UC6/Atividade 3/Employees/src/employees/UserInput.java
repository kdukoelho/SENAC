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
        return sc.nextInt();
    }
    
    public static float Float(){
        Scanner sc = new Scanner(System.in);
        return sc.nextFloat();
    }
}
