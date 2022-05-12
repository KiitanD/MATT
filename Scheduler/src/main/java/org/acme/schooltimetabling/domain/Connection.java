package org.acme.schooltimetabling.domain;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
// import com.mongodb.DBCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import java.io.*;
import org.acme.schooltimetabling.domain.JacksonMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.mongodb.client.result.InsertOneResult;
import com.mongodb.MongoException;
import org.bson.Document;
import java.util.function.Consumer;
import java.util.ArrayList;
import java.util.List;

public class Connection {

    public static void readconn() {
        String connectionString = "mongodb+srv://testuser:TESTpassWORD@matt.plnfh.mongodb.net/Semesters?retryWrites=true&w=majority";
        MongoClient mc = MongoClients.create(connectionString) ;

        MongoDatabase sems = mc.getDatabase("Semesters");
        MongoCollection<Document> s22 = sems.getCollection("Spring22");
        MongoCursor<Document> sem_cursor = s22.find().cursor();
        try{
            FileWriter sem_writer = new FileWriter("src/main/java/org/acme/schooltimetabling/domain/Spring22.json");
            sem_writer.write("[\n");
            while (sem_cursor.hasNext()) {
                sem_writer.write(sem_cursor.next().toJson());
                if (sem_cursor.hasNext()){ 
                    sem_writer.write(",");
                }
                sem_writer.write("\n");
            }
            sem_writer.write("]");
            sem_writer.close();
            
        } catch (IOException e) {
            System.out.println("Oops");
        } 

        MongoDatabase general = mc.getDatabase("General");
        MongoCollection<Document> rooms = general.getCollection("Classrooms");
        MongoCursor<Document> room_cursor = rooms.find().cursor();
        try{
            FileWriter room_writer = new FileWriter("src/main/java/org/acme/schooltimetabling/domain/Classrooms.json");
            room_writer.write("[\n");
            while (room_cursor.hasNext()) {
                room_writer.write(room_cursor.next().toJson());
                if (room_cursor.hasNext()){ 
                    room_writer.write(",");
                }
                room_writer.write("\n");
            }
            room_writer.write("]");
            room_writer.close();
            
        } catch (IOException e) {
            System.out.println("Oops");
        } 
        
        MongoCollection<Document> timeslots = general.getCollection("ClassPeriods");
        MongoCursor<Document> time_cursor = timeslots.find().cursor();
        try{
            FileWriter time_writer = new FileWriter("src/main/java/org/acme/schooltimetabling/domain/ClassPeriods.json");
            time_writer.write("[\n");
            while (time_cursor.hasNext()) {
                time_writer.write(time_cursor.next().toJson());
                if (time_cursor.hasNext()){ 
                    time_writer.write(",");
                }
                time_writer.write("\n");
            }
            time_writer.write("]");
            time_writer.close();
            
        } catch (IOException e) {
            System.out.println("Oops");
        } 
        
        
    }
    
    public static void writeconn(ArrayList<ArrayList<ArrayList<Lesson>>> nested) {
        String connectionString = "mongodb+srv://testuser:TESTpassWORD@matt.plnfh.mongodb.net/Semesters?retryWrites=true&w=majority";
        MongoClient mc = MongoClients.create(connectionString) ;

        //clear anything already in the collection
        MongoDatabase schedules = mc.getDatabase("Schedules");
        MongoCollection<Document> s22 = schedules.getCollection("Spring22");
        s22.drop();


        ObjectMapper mapper = new ObjectMapper();
        ArrayNode root = mapper.createArrayNode();
        ObjectMapper writer = new ObjectMapper();

        //subject level
        for (ArrayList<ArrayList<Lesson>> course: nested) {
            JsonNode subjectnode = mapper.createObjectNode();
            ((ObjectNode)subjectnode).put("subject", course.get(0).get(0).getSubject());
            root.add(subjectnode);
            ArrayNode cohortarray = ((ObjectNode)subjectnode).putArray("sections");

            //cohort level
            for (ArrayList<Lesson> cohort: course) {
                JsonNode cohortnode = mapper.createObjectNode();
                ((ObjectNode)cohortnode).put("cohort", cohort.get(0).getCohort());
                ArrayNode teachers = mapper.valueToTree(cohort.get(0).getTeachers());
                ((ObjectNode)cohortnode).putArray("teachers").addAll(teachers);
                ArrayNode meetingarray = ((ObjectNode)cohortnode).putArray("meetings");

                //meeting level
                for (Lesson meeting: cohort) {
                    JsonNode meetingnode = mapper.createObjectNode();
                    ((ObjectNode)meetingnode).put("room", meeting.getRoom().getName());
                    ((ObjectNode)meetingnode).put("day", meeting.getTimeslot().getDayOfWeek().toString());
                    ((ObjectNode)meetingnode).put("start", meeting.getTimeslot().getStartTime().toString());
                    ((ObjectNode)meetingnode).put("end", meeting.getTimeslot().getStartTime().plusMinutes(meeting.getDuration()).toString());
                    ((ObjectNode)meetingnode).put("duration", meeting.getDuration());
                    meetingarray.add(meetingnode);
                }
                ((ObjectNode)cohortnode).put("capacity", cohort.get(0).getCapacity());
                cohortarray.add(cohortnode);

            }

            //add subject to the database
            try {
                InsertOneResult result = s22.insertOne(new Document()
                        .parse(subjectnode.toString()));
            } catch (MongoException me) {
                System.err.println(me);
            }
        }
        try {
            writer.writeValue(new File("Solution.json"), root);
        } catch (IOException ioe) {
            System.out.println(ioe);
        }
       
    }

}
