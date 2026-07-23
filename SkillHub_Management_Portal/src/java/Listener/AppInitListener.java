package Listener;

import Model.Student;
import Model.Trainer;
import Model.Admin;
import Model.Course;
import Util.DataStore;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DataStore dataStore = new DataStore();

        // Pre-load sample users (documented assumption - see Report Section 2, Assumptions)
        dataStore.addUser(new Admin("admin", "admin123", "System Administrator"));
        dataStore.addUser(new Trainer("trainer1", "trainer123", "Gihan Chathuranga"));
        dataStore.addUser(new Trainer("trainer2", "trainer123", "Hashini Fernando"));
        dataStore.addUser(new Student("student1", "student123", "Nimesh Bandara"));

        // Pre-load sample courses
        dataStore.addCourse(new Course("WD01", "Full-Stack Web Development", "trainer2"));
        dataStore.addCourse(new Course("SAD", "Software Application Development", "trainer1"));
        dataStore.addCourse(new Course("GAD", "Game Application Development", "trainer1"));

        sce.getServletContext().setAttribute("dataStore", dataStore);
        sce.getServletContext().log("SkillHub Training Academy: DataStore initialised with sample data.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().log("SkillHub Training Academy: application context destroyed.");
    }
}
