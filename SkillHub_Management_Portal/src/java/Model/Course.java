package Model;

public class Course {
    private String code;
    private String title;
    private String trainerUsername;

    public Course(String code, String title, String trainerUsername) {
        this.code = code;
        this.title = title;
        this.trainerUsername = trainerUsername;
    }

    public String getCode() { return code; }
    public String getTitle() { return title; }
    public String getTrainerUsername() { return trainerUsername; }
    public void setTrainerUsername(String trainerUsername) { this.trainerUsername = trainerUsername; }
}
