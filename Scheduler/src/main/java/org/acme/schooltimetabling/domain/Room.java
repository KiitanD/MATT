package org.acme.schooltimetabling.domain;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.optaplanner.core.api.domain.lookup.PlanningId;

public class Room {
    @PlanningId
    private String name;
    private int capacity;

    @JsonCreator
    public Room(@JsonProperty("_id") String name, @JsonProperty("capacity") int capacity) {
        this.name = name;
        this.capacity = capacity;
    }

    @Override
    public String toString() {
        return name;
    }

    //Getters
    
    public String getName() {
        return name;
    }
    
    public int getCapacity() {
        return capacity;
    }

}
