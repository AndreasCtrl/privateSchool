-- Create Schema
CREATE SCHEMA IF NOT EXISTS private_school_db;
USE private_school_db;

-- Create Tables
CREATE TABLE IF NOT EXISTS private_school_db.courses (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    stream VARCHAR(45) NOT NULL,
    type VARCHAR(45) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS private_school_db.trainers (
    id INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS private_school_db.students (
    id INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    dateOfBirth DATE NOT NULL,
    tuitionFees DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS private_school_db.assignments (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    description VARCHAR(250) NOT NULL,
    subDateTime DATETIME NOT NULL,
    oralMark INT NULL,
    totalMark INT NULL,
    course_id INT, 
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- -----------------------------------------------------------------------------------

-- Many to Many Relationship Tables
--  (Copy from workbench!) --
CREATE TABLE `private_school_db`.`course_trainer` (
  `course_id` INT NOT NULL,
  `trainer_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `trainer_id`),
  INDEX `trainerID_idx` (`trainer_id` ASC),
  CONSTRAINT `courseID`
    FOREIGN KEY (`course_id`)
    REFERENCES `private_school_db`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `trainerID`
    FOREIGN KEY (`trainer_id`)
    REFERENCES `private_school_db`.`trainers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `private_school_db`.`student_assignment` (
  `student_id` INT NOT NULL,
  `assignment_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `assignment_id`),
  INDEX `assignmentIDsa_idx` (`assignment_id` ASC),
  CONSTRAINT `studentIDsa`
    FOREIGN KEY (`student_id`)
    REFERENCES `private_school_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assignmentIDsa`
    FOREIGN KEY (`assignment_id`)
    REFERENCES `private_school_db`.`assignments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `private_school_db`.`course_student` (
  `course_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `student_id`),
  INDEX `studentsIDcs_idx` (`student_id` ASC),
  CONSTRAINT `courseIDcs`
    FOREIGN KEY (`course_id`)
    REFERENCES `private_school_db`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `studentsIDcs`
    FOREIGN KEY (`student_id`)
    REFERENCES `private_school_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- ------------------------------------------------------------------------

-- Add courses
INSERT INTO private_school_db.courses (title, stream, type, start_date, end_date) VALUES ('CB8', 'JavaScript', 'part time', '2020-10-05', '2021-04-14');
INSERT INTO private_school_db.courses (title, stream, type, start_date, end_date) VALUES ('CB8', 'C#', 'part time', '2020-10-05', '2021-04-14');
INSERT INTO private_school_db.courses (title, stream, type, start_date, end_date) VALUES ('CB8', 'Java', 'part time', '2020-10-05', '2021-04-14');
INSERT INTO private_school_db.courses (title, stream, type, start_date, end_date) VALUES ('CB8', 'JavaScript', 'full time', '2020-10-05', '2021-01-14');
INSERT INTO private_school_db.courses (title, stream, type, start_date, end_date) VALUES ('CB8', 'C#', 'full time', '2020-10-05', '2021-01-14');
INSERT INTO private_school_db.courses (title, stream, type, start_date, end_date) VALUES ('CB8', 'Java', 'full time', '2020-10-05', '2021-01-14');

-- Add trainers
INSERT INTO private_school_db.trainers (firstName, lastName) VALUES ('Panos', 'Farasopoulos');
INSERT INTO private_school_db.trainers (firstName, lastName) VALUES ('Pavlos', 'Panagiotopoulos');
INSERT INTO private_school_db.trainers (firstName, lastName) VALUES ('Antonis', 'Mouflouzelis');
INSERT INTO private_school_db.trainers (firstName, lastName) VALUES ('Stefanos', 'Zakis');
INSERT INTO private_school_db.trainers (firstName, lastName) VALUES ('Vasilis', 'Panagiotopoulos');
INSERT INTO private_school_db.trainers (firstName, lastName) VALUES ('Katerina', 'Meleti');

-- Add students
INSERT INTO private_school_db.students (firstName, lastName, dateOfBirth, tuitionFees) VALUES ('Andreas', 'Koutroulis', '1986-10-01', '2250');
INSERT INTO private_school_db.students (firstName, lastName, dateOfBirth, tuitionFees) VALUES ('Stella', 'Meleti', '1980-05-10', '2250');
INSERT INTO private_school_db.students (firstName, lastName, dateOfBirth, tuitionFees) VALUES ('Giannis', 'Garantziotis', '1980-05-10', '2500');
INSERT INTO private_school_db.students (firstName, lastName, dateOfBirth, tuitionFees) VALUES ('Christos', 'Andrianakos', '1980-05-10', '2500');
INSERT INTO private_school_db.students (firstName, lastName, dateOfBirth, tuitionFees) VALUES ('Kostas', 'Kalogirou', '1980-05-10', '2500');

-- Add assignments
INSERT INTO private_school_db.assignments (title, description, subDateTime, totalMark, course_id) VALUES ('Calculator', 'Create a calculator that can add, subtract, multiply and divide', '2021-03-23 18:00:00', '100', '7');
INSERT INTO private_school_db.assignments (title, description, subDateTime, totalMark, course_id) VALUES ('Weather app', 'Create a Weather app with React', '2021-05-20 18:00:00', '100', '6');

-- -------------------------------------------------------------------------------------