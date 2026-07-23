package Model;

public class Trainer extends User {
    public Trainer(String username, String password, String fullName) {
        super(username, password, fullName);
    }

    @Override
    public String getRole() { return "TRAINER"; }
}
