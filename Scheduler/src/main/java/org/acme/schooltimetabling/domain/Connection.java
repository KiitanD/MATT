package org.acme.schooltimetabling.domain;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.DBCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import java.io.*;

import org.bson.Document;
import java.util.function.Consumer;
import java.util.ArrayList;
import java.util.List;

public class Connection {

    public static void conn() {
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
}