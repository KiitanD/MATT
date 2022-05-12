package org.acme.schooltimetabling.domain;

import org.optaplanner.core.api.domain.entity.PlanningEntity;
import org.optaplanner.core.api.domain.lookup.PlanningId;
import org.optaplanner.core.api.domain.variable.PlanningVariable;
import java.util.ArrayList;

@PlanningEntity
public class Lesson {

    @PlanningId
    private String id;
    private String subject;
    private String cohort;
    private ArrayList<String> teachers;
    private int duration;
    private ArrayList<String> requiredFor;
    private ArrayList<String> electiveFor;
    private ArrayList<String> optionFor;
    private int capacity;
    

    @PlanningVariable(valueRangeProviderRefs = "all_timeslots")
    private Timeslot timeslot;
    @PlanningVariable(valueRangeProviderRefs = "all_rooms")
    private Room room;

    // No-arg constructor required for OptaPlanner
    public Lesson() {
    }

    public Lesson(String id, String subject, String cohort, ArrayList<String> teachers, int duration, ArrayList<String> requiredFor, ArrayList<String> electiveFor, ArrayList<String> optionFor, int capacity) {
        this.id = id;
        this.subject = subject;
        this.cohort = cohort;
        this.teachers = teachers;
        this.duration = duration;
        this.requiredFor = requiredFor;
        this.electiveFor = electiveFor;
        this.optionFor = optionFor;        
        this.capacity = capacity;
    }

    public Lesson(String id, String subject, String cohort, ArrayList<String> teachers, int duration, ArrayList<String> requiredFor, ArrayList<String> electiveFor, ArrayList<String> optionFor, int capacity, Timeslot timeslot, Room room) {
        this(id, subject, cohort, teachers, duration, requiredFor, electiveFor, optionFor, capacity);
        this.timeslot = timeslot;
        this.room = room;
    }

    @Override
    public String toString() {
        return "Lesson:\n" + id + "\n" + subject + "\n" + cohort + "\n" + teachers + "\n" + duration + "\n" + requiredFor + "\n" + electiveFor + "\n" + optionFor + "\n" + capacity + "\n" + timeslot + room;
    }

    //Getters and Setters

    public String getId() {
        return id;
    }

    public String getSubject() {
        return subject;
    }
    public String getCohort() {
        return cohort;
    }
    public ArrayList<String> getTeachers() {
        return teachers;
    }

    public int getDuration() {
        return duration;
    }

    public ArrayList<String> getRequiredFor() {
        return requiredFor;
    }

    public ArrayList<String> getElectiveFor() {
        return electiveFor;
    }

    public ArrayList<String> getOptionFor() {
        return optionFor;
    }

    public int getCapacity() {
        return capacity;
    }

    public Timeslot getTimeslot() {
        return timeslot;
    }

    public void setTimeslot(Timeslot timeslot) {
        this.timeslot = timeslot;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

}
