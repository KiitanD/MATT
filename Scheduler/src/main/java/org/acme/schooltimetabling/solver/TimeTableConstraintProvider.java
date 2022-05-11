
package org.acme.schooltimetabling.solver;

import java.time.Duration;
import java.util.Collections;
import java.util.Arrays;
import java.util.HashMap;
import org.acme.schooltimetabling.domain.Lesson;
import org.optaplanner.core.api.score.buildin.hardsoft.HardSoftScore;
import org.optaplanner.core.api.score.stream.Constraint;
import org.optaplanner.core.api.score.stream.ConstraintFactory;
import org.optaplanner.core.api.score.stream.ConstraintProvider;
import org.optaplanner.core.api.score.stream.Joiners;
import org.acme.schooltimetabling.domain.TimeTable;
import org.acme.schooltimetabling.TimeTableApp;
import org.acme.schooltimetabling.domain.Timeslot;

public class TimeTableConstraintProvider implements ConstraintProvider {
        HashMap<String, Integer> studentMap = TimeTableApp.studentMap;
        HashMap<String, Integer> teacherMap = TimeTableApp.teacherMap;
        
    @Override
    public Constraint[] defineConstraints(ConstraintFactory constraintFactory) {
        return new Constraint[] {
                // Hard constraints
                teacherConflict(constraintFactory),
                studentGroupConflict2(constraintFactory),
                studentGroupConflict4(constraintFactory),
                timeslotLengthConstraint(constraintFactory),
                roomConflict(constraintFactory),
                DaySpacingConstraint(constraintFactory)

                //Potential soft constraint: Electives
        };
    }

    Constraint roomConflict(ConstraintFactory constraintFactory) {
        // A room can accommodate at most one lesson at the same time.
        return constraintFactory

                .forEachUniquePair(Lesson.class,
                        Joiners.equal(Lesson::getRoom), 
                        Joiners.equal(Lesson -> Lesson.getTimeslot().getDayOfWeek()),
                        Joiners.overlapping(Lesson1 -> Lesson1.getTimeslot().getStartTime(), Lesson2 -> Lesson2.getTimeslot().getEndTime()))
                .penalize("Room conflict", HardSoftScore.ONE_HARD);
    }

    Constraint teacherConflict(ConstraintFactory constraintFactory) {
        // A teacher can teach at most one lesson at the same time.
        return constraintFactory
                .forEachUniquePair(Lesson.class,
                        Joiners.overlapping(Lesson -> Lesson.getTimeslot().getStartTime(), Lesson -> Lesson.getTimeslot().getEndTime()),
                        Joiners.equal(Lesson -> Lesson.getTimeslot().getDayOfWeek()),
                        //At least one teacher in common between the lessons
                        Joiners.filtering((Lesson1, Lesson2) -> teacherMap.containsKey(Lesson1.getId()+Lesson2.getId()) || teacherMap.containsKey(Lesson2.getId()+Lesson1.getId())))
                .penalize("Teacher conflict", HardSoftScore.ONE_HARD);
    }


    Constraint studentGroupConflict2(ConstraintFactory constraintFactory) {
        // Classes for the same student group shouldn't clash if they're different subjects + cohorts.
        return constraintFactory
                .forEachUniquePair(Lesson.class,
                        Joiners.overlapping(Lesson -> Lesson.getTimeslot().getStartTime(), Lesson -> Lesson.getTimeslot().getEndTime()),
                        Joiners.equal(Lesson -> Lesson.getTimeslot().getDayOfWeek()),
                        Joiners.filtering((Lesson1, Lesson2) -> studentMap.containsKey(Lesson1.getId()+Lesson2.getId()) || studentMap.containsKey(Lesson2.getId()+Lesson1.getId())),
                        Joiners.filtering((Lesson1, Lesson2) -> Lesson1.getSubject() != Lesson2.getSubject()), 
                        Joiners.filtering((Lesson1, Lesson2) -> Lesson1.getCohort() != Lesson2.getCohort())) // OR Lesson1.subject.cohortcount != Lesson2.subject.cohortcount

                .penalize("Student group conflict 2", HardSoftScore.ONE_HARD);
    }

    Constraint studentGroupConflict4(ConstraintFactory constraintFactory) {
        // Classes for the same student group shouldn't clash if they're different subjects + both cohort A.
        // This prevents clashes if there is only one cohort for a course.
        return constraintFactory
                .forEachUniquePair(Lesson.class,
                        Joiners.overlapping(Lesson -> Lesson.getTimeslot().getStartTime(), Lesson -> Lesson.getTimeslot().getEndTime()),
                        Joiners.equal(Lesson -> Lesson.getTimeslot().getDayOfWeek()),
                        Joiners.filtering((Lesson1, Lesson2) -> studentMap.containsKey(Lesson1.getId()+Lesson2.getId()) || studentMap.containsKey(Lesson2.getId()+Lesson1.getId())),
                        Joiners.filtering((Lesson1, Lesson2) -> Lesson1.getSubject() != Lesson2.getSubject()), 
                        Joiners.filtering((Lesson1, Lesson2) -> Lesson1.getCohort() == "A" || Lesson2.getCohort() == "A")) 

                .penalize("Student group conflict 4", HardSoftScore.ONE_HARD);
    }


    Constraint timeslotLengthConstraint(ConstraintFactory constraintFactory) {
        // Class duration should fit in the assigned timeslot
        return constraintFactory
                .forEach(Lesson.class)
                .filter(lesson -> lesson.getDuration() > lesson.getTimeslot().getDuration())
                .penalize("Timeslot length mismatch", HardSoftScore.ONE_HARD);
    }

    Constraint DaySpacingConstraint(ConstraintFactory constraintFactory) {
       // All meetings of a particular cohort should occur on different days.
        return constraintFactory
                .forEachUniquePair(Lesson.class,
                        Joiners.equal(Lesson -> Lesson.getTimeslot().getDayOfWeek()),
                        Joiners.equal(Lesson -> Lesson.getSubject()),
                        Joiners.equal(Lesson -> Lesson.getCohort()))
                .penalize("Day spacing", HardSoftScore.ONE_HARD);
    }

    //addition: soft constraint for electives

}
