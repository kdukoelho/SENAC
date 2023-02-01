public class Auditorium {
    protected int fixedSeatsNum;
    protected int maxSeatsNum;
    protected int invitesQtt;
    Auditorium(int invitesQtt){
        this.invitesQtt = invitesQtt;
    }
    protected Boolean InvitesNumEvaluation(){
        return invitesQtt <= 350 && invitesQtt > 0;
    }
}

class AuditoriumAlpha extends Auditorium{
    AuditoriumAlpha(int invitesQtt){
        super(invitesQtt);
        this.fixedSeatsNum = 150;
        this.maxSeatsNum = 220;
    }
    public String CheckUsePossibility(){
        String returnString;
        if (InvitesNumEvaluation() && invitesQtt <= maxSeatsNum){
            returnString = "1";
            if (invitesQtt > fixedSeatsNum){
                int additionalChairsRequired = invitesQtt - fixedSeatsNum;
                returnString = returnString + "Inclua mais " + additionalChairsRequired + " cadeiras.";
            }
        }
        else {
            returnString = "0";
        }
        return returnString;
    }
}

class AuditoriumBeta extends Auditorium{
    AuditoriumBeta(int invitesQtt) {
        super(invitesQtt);
        this.fixedSeatsNum = 350;
        this.maxSeatsNum = 350;
    }
    public String CheckUsePossibility(){
        return InvitesNumEvaluation() && invitesQtt > 220 ? "1" : "0";
    }
}