public class Costumer {
    private final String name;
    private final int age;
    private final int discount;
    private char allocatedBedroom;
    Costumer(String name, int age, char allocatedBedroom){
        this.name = name;
        this.age = age;
        this.discount = age >= 60 ? 40 : 0;
        this.allocatedBedroom = allocatedBedroom;
    }

    public void setAllocatedBedroom(char allocatedBedroom) {
        this.allocatedBedroom = allocatedBedroom;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
    public int getAllocatedBedroom(){
        return allocatedBedroom;
    }
    public int getDiscount(){
        return discount;
    }
}
