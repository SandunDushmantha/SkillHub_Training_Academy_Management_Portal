package Model;

import java.time.LocalDate;

public class Attendance {
    private String studentUsername;
    private String courseCode;
    private LocalDate date;
    private boolean present;

    public Attendance(String studentUsername, String courseCode, LocalDate date, boolean present) {
        this.studentUsername = studentUsername;
        this.courseCode = courseCode;
        this.date = date;
        this.present = present;
    }

    public String getStudentUsername() { return studentUsername; }
    public String getCourseCode() { return courseCode; }
    public LocalDate getDate() { return date; }
    public boolean isPresent() { return present; }
}
