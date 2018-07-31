/* A student earns a grade in a course.*/
earnsAGrade(student,course).

/*Departments to be included in the knowledge base.*/
departments(computer_science).
departments(math).
departments(physics).

/* Course offered in CS. */
courseOffered(cs,cs111).
courseOffered(cs,cs211).
courseOffered(cs,cs311).
courseOffered(cs,cs315).
courseOffered(cs,cs421).
courseOffered(cs,cs436).

/* Course offered in Math. */
courseOffered(math,math270).
courseOffered(math,math242).
courseOffered(math,math372).
courseOffered(math,math480).

/* Course offered in Physics. */
courseOffered(physics,phys201).
courseOffered(physics,phys301).

/* Students taking courses at the university.*/
students(newton).
students(galileo).
students(lovelace).
students(turing).

/* Newton is enrolled in CS311, CS421, and MATH372. Turing is enrolled in MATH480, CS421, and PHYS301. Galileo is enrolled in CS436, and CS421. 
 Lovelace is enrolled in PHYS301, and MATH372. 
*/
enroll(newton,cs311).
enroll(newton,cs421).
enroll(newton,math372).

enroll(turing,math480).
enroll(turing,cs421).
enroll(turing,phys301).

enroll(galileo,cs436).
enroll(galileo,cs421).

enroll(lovelace,phys301).
enroll(lovelace,math372).

/* Core Courses. */
core_course(cs111).
core_course(cs211).
core_course(cs311).
core_course(math270).
core_course(phys201).

/* Elective Courses. */
elective_course(cs315).
elective_course(cs436).
elective_course(math242).
elective_course(math372).
elective_course(phys301).

/* Galileo has taken and passed CS111, CS211, CS311, MATH270, PHYS201, MATH242, CS436.*/
taken(galileo,cs111).
taken(galileo,cs211).
taken(galileo,cs311).
taken(galileo,math270).
taken(galileo,phys201).
taken(galileo,math242).
taken(galileo,cs436).

/* Turing has taken and passed CS111, CS211, CS311, MATH270, PHYS201, PHYS301, MATH372.*/
taken(turing,cs111).
taken(turing,cs211).
taken(turing,cs311).
taken(turing,math270).
taken(turing,phys201).
taken(turing,phys301).
taken(turing,math372).

/*For the rest of the students assume that they have taken and passed CS111 and CS211.*/
taken(newton,cs111).
taken(newton,cs211).

taken(lovelace,cs111).
taken(lovelace,cs211).

/* Completed core courses is true if the student has passed each of the core courses in the department with the minimum passing grade of C.*/
completedCore(name,core_course):-
        passed(name,cs111),
        passed(name,cs211),
	passed(name,cs311),
        passed(name,math270),
        passed(name,phys201).

passed(name,course):-
	taken(name,course).
passed(name,course):-
	enroll(name,course).

/* Fulfilled electives requirement is true if the student has passed three different courses,each course in a different department in the College of Science, e.g., MATH242, MATH372, CS315, CS436, PHYS301.*/
fulfilledReq(name,elective_course):-
        passedCS(name,computer_science),
        passedMath(name,math),
        passedPhys(name,physics).

passedCS(name,computer_science):-
	passed(name,cs111).
passedCS(name,computer_science):-
	passed(name,cs211).
passedCS(name,computer_science):-
	passed(name,cs311).
passedCS(name,computer_science):-
	passed(name,cs315).
passedCS(name,computer_science):-
	passed(name,cs421).
passedCS(name,computer_science):-
	passed(name,cs436).
passedMath(name,math):-
	passed(name,math270).
passedMath(name,math):-
	passed(name,math242).
passedMath(name,math):-
	passed(name,math372).
passedMath(name,math):-
	passed(name,math480).
passedPhys(name,physics):-
	passed(name,phys201).
passedPhys(name,physics):-
	passed(name,phys301).

/* A student satisfies the degree requirements if the student has: completed the core courses of the department, and fulfilled the electives requirement.*/
satisfiesReq(name):-
        completedCore(name,_),
                fulfilledReq(name,_).

