package org.acme.schooltimetabling.domain;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import org.acme.schooltimetabling.domain.Timeslot;
import org.acme.schooltimetabling.domain.Room;
import org.acme.schooltimetabling.domain.Lesson;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

public class JacksonMapper {
    public static void main(String[] args) {
        ObjectMapper timeMapper = new ObjectMapper();
        try{
            Timeslot[] timeslots = timeMapper.readValue(new File("ClassPeriods.json"), Timeslot[].class);        // System.out.println(tester.toString() + "...");
            System.out.println("here");
        } catch (Exception e) {
            System.out.println("Help");
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Timeslot> makeTimeslots() throws IOException {
        ObjectMapper timeMapper = new ObjectMapper();
        Timeslot[] timeslots = new Timeslot[0];
        try{
            timeslots = timeMapper.readValue(new File("src\\main\\java\\org\\acme\\schooltimetabling\\domain\\ClassPeriods.json"), Timeslot[].class);        // System.out.println(tester.toString() + "...");
            System.out.println("Timeslots created");
            System.out.println(timeslots);
        } catch (Exception e) {
            System.out.println("Help");
            e.printStackTrace();
        }
            ArrayList<Timeslot> tlist = new ArrayList<Timeslot>();
            Collections.addAll(tlist, timeslots);
            return tlist;
        
    }

    public static ArrayList<Room> makeRooms() throws IOException {
        ObjectMapper timeMapper = new ObjectMapper();
        Room[] rooms = new Room[0];
        try{
            rooms = timeMapper.readValue(new File("src\\main\\java\\org\\acme\\schooltimetabling\\domain\\Classrooms.json"), Room[].class);        // System.out.println(tester.toString() + "...");
            System.out.println("Classrooms created");
            System.out.println(rooms);
        } catch (Exception e) {
            System.out.println("Help");
            e.printStackTrace();
        }
           ArrayList<Room> rlist = new ArrayList<Room>();
           Collections.addAll(rlist, rooms);
           return rlist;
        
    }

    public static ArrayList<Lesson> makeLessons() throws IOException {
        ObjectMapper lessonMapper = new ObjectMapper();
        ArrayList<Lesson> courseList = new ArrayList<Lesson>();
        JsonNode rootNode = lessonMapper.readTree(new File("src\\main\\java\\org\\acme\\schooltimetabling\\domain\\Spring22.json"));
        Iterator<JsonNode> fileIterator = rootNode.elements();
        while (fileIterator.hasNext()) {
            ArrayList<String> requiredFor = new ArrayList<String>();
            ArrayList<String> electiveFor = new ArrayList<String>();
            ArrayList<String> optionFor = new ArrayList<String>();

            JsonNode course = fileIterator.next();
            String subject = course.path("course_code").textValue();
            String meeting_type = course.path("meeting_type").textValue();
            int capacity = course.path("capacity").intValue();
            ArrayList<String> alternative = lessonMapper.convertValue(course.get("alternative"), ArrayList.class);

            Iterator<String> requiredMajor = course.path("required_for").fieldNames();
            Iterator<JsonNode> requiredSemester = course.path("required_for").elements();
            while (requiredMajor.hasNext()) {
                String major = requiredMajor.next();
                JsonNode semester = requiredSemester.next();
                requiredFor.add(major+semester);
            }

            Iterator<String> electiveMajor = course.path("elective_for").fieldNames();
            Iterator<JsonNode> electiveTypes = course.path("elective_for").elements();
            while (electiveMajor.hasNext()) {
                String major = electiveMajor.next();
                JsonNode electivetype = electiveTypes.next();
                electiveFor.add(major+electivetype.textValue());
            }

            // OPTION FOR 
            Iterator<String> optionMajor = course.path("option_for").fieldNames();
            Iterator<JsonNode> optionSemester = course.path("option_for").elements();
            while (optionMajor.hasNext()) {
                String major = optionMajor.next();
                JsonNode semester = optionSemester.next();
                optionFor.add(major+semester);
            }

            Iterator<String> section  = course.path("sections").fieldNames();
            Iterator<JsonNode> teachers = course.path("sections").elements();
            
            while (section.hasNext()) {
                String cohort_letter = section.next();
                String cohort_id = subject+cohort_letter;
                ArrayList<String> cohort_teachers = lessonMapper.convertValue(teachers.next(), ArrayList.class);  //lessonMapper.convertValue(course.get("alternative"), ArrayList.class);
                switch (meeting_type) {
                    case "A":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+3, subject, cohort_letter, cohort_teachers,60, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "B":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+3, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "C":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "D":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        break;  
                    case "E":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+3, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+4, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "F":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+3, subject, cohort_letter, cohort_teachers,120, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "G":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                        courseList.add(new Lesson(cohort_id+3, subject, cohort_letter, cohort_teachers,180, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "H":
                        courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,180, requiredFor, electiveFor, optionFor, capacity));
                        break; 
                    case "I":
                    courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,90, requiredFor, electiveFor, optionFor, capacity));
                    courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,180, requiredFor, electiveFor, optionFor, capacity));
                        break;
                    case "J":
                    courseList.add(new Lesson(cohort_id+1, subject, cohort_letter, cohort_teachers,180, requiredFor, electiveFor, optionFor, capacity));
                    courseList.add(new Lesson(cohort_id+2, subject, cohort_letter, cohort_teachers,180, requiredFor, electiveFor, optionFor, capacity));
                        break;
                }
            }     
        }
        System.out.println(courseList.size());
        return courseList;
    }

    //Not JSON related, but needed for constraint optimizations 

    public static HashMap<String, Integer> getStudentMap(ArrayList<Lesson> courseList){
        
        HashMap<String, Integer> studentMap = new HashMap<String, Integer>() ;
        for (int i=0; i<courseList.size(); i++){
            for (int j=1; j< courseList.size(); j++){
                if (i < j && (!Collections.disjoint(courseList.get(i).getRequiredFor(), courseList.get(j).getRequiredFor()) 
                || !Collections.disjoint(courseList.get(i).getRequiredFor(), courseList.get(j).getOptionFor())
                || !Collections.disjoint(courseList.get(i).getOptionFor(), courseList.get(j).getRequiredFor()))){
                    studentMap.put(courseList.get(i).getId()+courseList.get(j).getId(), 1);
                }
            }
        };
        return studentMap;
    }
    public static HashMap<String, Integer> getTeacherMap(ArrayList<Lesson> courseList){
        
        HashMap<String, Integer> teacherMap = new HashMap<String, Integer>() ;
        for (int i=0; i<courseList.size(); i++){
            for (int j=1; j< courseList.size(); j++){
                if (i < j && !Collections.disjoint(courseList.get(i).getTeachers(), courseList.get(j).getTeachers())) {
                    teacherMap.put(courseList.get(i).getId()+courseList.get(j).getId(), 1);
                }
            }
        };
        return teacherMap;
    }
}

