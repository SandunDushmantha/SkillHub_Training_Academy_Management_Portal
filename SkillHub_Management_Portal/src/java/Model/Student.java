package Model;

import java.util.ArrayList;
import java.util.List;

public class Student extends User {
    private List<String> enrolledCourseCodes = new ArrayList<>();

    public Student(String username, String password, String fullName) {
        super(username, password, fullName);
    }

    @Override
    public String getRole() { return "STUDENT"; }

    public List<String> getEnrolledCourseCodes() { return enrolledCourseCodes; }

    public void enrol(String courseCode) {
        if (!enrolledCourseCodes.contains(courseCode)) {
            enrolledCourseCodes.add(courseCode);
        }
    }
}
