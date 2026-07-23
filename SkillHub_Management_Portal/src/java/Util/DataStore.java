package Util;

import Model.User;
import Model.Course;
import Model.Attendance;
import Model.Trainer;
import Model.Student;
import java.util.*;

public class DataStore {
    private Map<String, User> users = new HashMap<>();
    private Map<String, Course> courses = new HashMap<>();
    private List<Attendance> attendanceRecords = new ArrayList<>();

    public void addUser(User user) { users.put(user.getUsername(), user); }
    public User getUser(String username) { return users.get(username); }
    public Collection<User> getAllUsers() { return users.values(); }

    public void addCourse(Course course) { courses.put(course.getCode(), course); }
    public Course getCourse(String code) { return courses.get(code); }
    public Collection<Course> getAllCourses() { return courses.values(); }

    public void addAttendance(Attendance record) { attendanceRecords.add(record); }

    public List<Attendance> getAttendanceForStudent(String username) {
        List<Attendance> result = new ArrayList<>();
        for (Attendance r : attendanceRecords) {
            if (r.getStudentUsername().equals(username)) result.add(r);
        }
        return result;
    }

    public List<Attendance> getAttendanceForCourse(String courseCode) {
        List<Attendance> result = new ArrayList<>();
        for (Attendance r : attendanceRecords) {
            if (r.getCourseCode().equals(courseCode)) result.add(r);
        }
        return result;
    }

    public List<Trainer> getAllTrainers() {
        List<Trainer> result = new ArrayList<>();
        for (User u : users.values()) {
            if (u instanceof Trainer) result.add((Trainer) u);
        }
        return result;
    }

    public List<Student> getAllStudents() {
        List<Student> result = new ArrayList<>();
        for (User u : users.values()) {
            if (u instanceof Student) result.add((Student) u);
        }
        return result;
    }

    public List<Course> getCoursesForTrainer(String trainerUsername) {
        List<Course> result = new ArrayList<>();
        for (Course c : courses.values()) {
            if (c.getTrainerUsername() != null && c.getTrainerUsername().equals(trainerUsername)) {
                result.add(c);
            }
        }
        return result;
    }
}