package org.acme.schooltimetabling;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
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
import org.acme.schooltimetabling.domain.Connection;
import java.util.HashMap;

public class TimeTableApp {

    private static final Logger LOGGER = LoggerFactory.getLogger(TimeTableApp.class);
    public static HashMap<String, Integer> studentMap;
    public static HashMap<String, Integer> teacherMap;
    public static void main(String[] args) throws Exception {
        Connection p = new Connection();
        p.conn();

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
        printTimetable(solution);
    }


    private static void printTimetable(TimeTable timeTable) {
        timeTable.getLessonList().sort(Comparator.comparing(Lesson::getId));
        int count = 0;
            for (Lesson a: timeTable.getLessonList()){
                if (count < 5){
                    System.out.println(a.getId());
                    System.out.println(a.getTimeslot());
                    System.out.println(a.getRoom());
                    System.out.println("\n");
                    count++;
                }
                break;

            }
    }

}
