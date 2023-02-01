public class Guests {
    private final String name; private final int age;
    private final double discount;
    Guests(String name, int age){
        this.name = name;
        this.age = age;
        this.discount = hasDiscount();
    }
    private double hasDiscount(){
        if (age >= 80) { return 0.5; }
        else if (age < 4 ) {return  0; }
        else { return 1; }
    }
    public String getName(){ return name; }
    public double getDiscount() { return discount; }
}
