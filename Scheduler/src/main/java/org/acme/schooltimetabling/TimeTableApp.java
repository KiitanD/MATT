package org.acme.schooltimetabling;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.util.Comparator;
import java.util.stream.Collectors;
import org.acme.schooltimetabling.domain.Lesson;
import org.acme.schooltimetabling.domain.Room;
import org.acme.schooltimetabling.domain.TimeTable;
import org.acme.schooltimetabling.domain.Timeslot;
import org.acme.schooltimetabling.solver.TimeTableConstraintProvider;
import org.optaplanner.core.api.solver.Solver;
import org.optaplanner.core.api.solver.SolverFactory;
import org.optaplanner.core.config.solver.SolverConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.acme.schooltimetabling.domain.JacksonMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import org.acme.schooltimetabling.domain.Connection;
import java.util.HashMap;

public class TimeTableApp {

    private static final Logger LOGGER = LoggerFactory.getLogger(TimeTableApp.class);
    public static HashMap<String, Integer> studentMap;
    public static HashMap<String, Integer> teacherMap;
    public static void main(String[] args) throws Exception {
        Connection p = new Connection();
        p.readconn();

        //get lists of relevant planning properties
        JacksonMapper jm = new JacksonMapper();
        ArrayList<Timeslot> timeslots = jm.makeTimeslots();
        ArrayList<Room> rooms = jm.makeRooms();
        ArrayList<Lesson> lessons = jm.makeLessons();
        studentMap = jm.getStudentMap(lessons);
        teacherMap = jm.getTeacherMap(lessons);
        
        //create solver
        SolverConfig sc = SolverConfig.createFromXmlResource("solverConfig.xml");
        SolverFactory<TimeTable> solverFactory = SolverFactory.create(sc
                .withConstraintProviderClass(TimeTableConstraintProvider.class)
                .withSolutionClass(TimeTable.class)
                .withEntityClasses(Lesson.class));
        TimeTable problem = new TimeTable(timeslots, rooms, lessons, studentMap);


        // Solve the problem
        Solver<TimeTable> solver = solverFactory.buildSolver();
        TimeTable solution = solver.solve(problem);
        
        // Print the solution
        List<Lesson> sorted_lessons = printTimetable(solution);

        ArrayList<ArrayList<ArrayList<Lesson>>> nested = nestTimetable(sorted_lessons);

        //write to database and local JSON file
        p.writeconn(nested);
    }

    

    private static ArrayList<ArrayList<ArrayList<Lesson>>> nestTimetable(List<Lesson> sorted_lessons) {
        int count = 0;
            int start = 0;
            int end = 0;
            ArrayList<ArrayList<Lesson>> cohorts = new ArrayList<ArrayList<Lesson>>();
            while (true){
                while (end+1 < sorted_lessons.size() && 
                sorted_lessons.get(start).getCohort() == sorted_lessons.get(end+1).getCohort() && 
                sorted_lessons.get(start).getSubject() == sorted_lessons.get(end+1).getSubject()) {
                    end += 1;
                }
                ArrayList<Lesson> cohort = new ArrayList<Lesson>();
                for(int i=start; i<=end; i++) {
                    cohort.add(sorted_lessons.get(i));
                }
                cohorts.add(cohort);
                start = end+1;
                
                if (end == sorted_lessons.size()-1){
                    break;
                }
            }
            
            ArrayList<ArrayList<ArrayList<Lesson>>> courses = new ArrayList<ArrayList<ArrayList<Lesson>>>();
            start = 0;
            end = 0;
            while (true) {
                while (end+1 < cohorts.size() && 
                cohorts.get(start).get(0).getSubject() == cohorts.get(end+1).get(0).getSubject()) {
                    end += 1;
                }
                ArrayList<ArrayList<Lesson>> course = new ArrayList<ArrayList<Lesson>>();
                for(int i=start; i<=end; i++) {
                    course.add(cohorts.get(i));
                }
                courses.add(course);
                start = end+1;
                
                if (end == cohorts.size()-1){
                    break;
                }
            }
            return courses;    
    }


    private static List<Lesson> printTimetable(TimeTable timeTable) {
        timeTable.getLessonList().sort(Comparator.comparing(Lesson::getId));

        //uncomment to actually print 
        // System.out.println(timeTable.getLessonList());

        return timeTable.getLessonList();
    }


}
