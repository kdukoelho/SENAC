/**
 * @author kdukoelho
 */
package employees;

public class Addres {
    String[] addres = new String[5];
    
    Addres (String state, String city, String neighborhood, String street, String number){
        addres[0] = state;
        addres[1] = city;
        addres[2] = neighborhood;
        addres[3] = street;
        addres[4] = number;
    }
    
    // Getters.
    
    public String getState(){
        return addres[0];
    }
    
    public String getCity(){
        return addres[1];
    }
    
    public String getNeighborhood(){
        return addres[2];
    }
    
    public String getStreet(){
        return addres[3];
    }
    
    public String getNumber(){
        return addres[4];
    }
    
    public String getBuildedAddres(){
        String buildedString = String.format("%s - %s, %s %s %s", addres[1], addres[0], addres[2], addres[3], addres[4]);
        return buildedString;
    }
}
