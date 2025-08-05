/* john is year 3 student of se */
student(john, 3, se).
student(tom, 2, se).
student(mike, 3, se).

course(ai_programming, 3, se).
course(ai, 3, se).
course(ml, 3, se).

completed(john, dataStructure_and_algorithm).
completed(mike, dataStructure_and_algorithm).
completed(tom, probability).

requires(ai_programming, dataStructure_and_algorithm).
requires(ml, probability).

% rules
can_enroll(Student, Course) :-
    student(Student, Y, P),
    course(Course, Y, P),
    requires(Course, X), 
    completed(Student, X).

/*
can_enroll(Student, Course) :-
    requires(Course, X), 
    completed(Student, X).
*/

possible_classmates(StudentA, StudentB, Course) :-
    can_enroll(StudentA, Course),
    can_enroll(StudentB, Course),
    StudentA \= StudentB.