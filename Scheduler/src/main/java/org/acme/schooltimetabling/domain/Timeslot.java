package org.acme.schooltimetabling.domain;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.optaplanner.core.api.domain.lookup.PlanningId;

public class Timeslot {
    @PlanningId
    private String pid;
    private DayOfWeek dayOfWeek;
    private LocalTime startTime;
    private LocalTime endTime;
    private int duration;
    private boolean minimize;

    public Timeslot() {
        super();
    }

    @JsonCreator 
    public Timeslot(@JsonProperty("_id") String pid,
      @JsonProperty("Day") String dayOfWeek, @JsonProperty("Start") String startTime, @JsonProperty("End") String endTime, @JsonProperty("Duration") int duration, @JsonProperty("minimise") boolean minimize)
    {
        this.pid = pid;
        this.dayOfWeek = DayOfWeek.valueOf(dayOfWeek.toUpperCase());
        this.startTime = LocalTime.parse(startTime);
        this.endTime = LocalTime.parse(endTime);
        this.duration = duration;
        this.minimize = minimize;
    }

    public Timeslot(String pid, DayOfWeek dayOfWeek, LocalTime startTime, LocalTime endTime) {
        this.pid = pid;
        this.dayOfWeek = dayOfWeek;
        this.startTime = startTime;
        this.endTime = endTime;
        this.duration = (int) startTime.until(endTime, ChronoUnit.MINUTES);

    }

    public Timeslot(String pid, DayOfWeek dayOfWeek, LocalTime startTime) {
        this(pid, dayOfWeek, startTime, startTime.plusMinutes(90));
    }

    @Override
    public String toString() {
        return dayOfWeek + " " + startTime + "-" + endTime;
    }

    //Getters
    
    public DayOfWeek getDayOfWeek() {
        return dayOfWeek;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }
    
    public String getPid() {
        return pid;
    }

    public int getDuration() {
        return duration;
    }

}
