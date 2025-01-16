CREATE DATABASE FourthWallAcademy;
USE FourthWallAcademy;

CREATE TABLE PowerType (
    PowerTypeID INT AUTO_INCREMENT PRIMARY KEY,
    PowerTypeName VARCHAR(50) NOT NULL,
    PowerTypeDescription VARCHAR(255) NOT NULL
);

CREATE TABLE `Power` (
    PowerID INT AUTO_INCREMENT PRIMARY KEY,
    PowerTypeID INT,
    PowerName VARCHAR(50) NOT NULL,
    PowerDescription VARCHAR(255) NOT NULL,
    FOREIGN KEY (PowerTypeID) REFERENCES PowerType(PowerTypeID)
);

CREATE TABLE WeaknessType (
    WeaknessTypeID INT AUTO_INCREMENT PRIMARY KEY,
    WeaknessTypeName VARCHAR(50) NOT NULL,
    WeaknessTypeDescription VARCHAR(255) NOT NULL
);

CREATE TABLE Weakness (
    WeaknessID INT AUTO_INCREMENT PRIMARY KEY,
    WeaknessTypeID INT,
    WeaknessName VARCHAR(50) NOT NULL,
    WeaknessDescription VARCHAR(255) NOT NULL,
    FOREIGN KEY (WeaknessTypeID) REFERENCES WeaknessType(WeaknessTypeID)
);

CREATE TABLE Subject (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL
);

CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectID INT,
    CourseName VARCHAR(50),
    CourseDescription VARCHAR(255),
    Credits DECIMAL(2,1),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

CREATE TABLE Instructor (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    Alias VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    TermDate DATE NULL
);

CREATE TABLE Section (
    SectionID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    InstructorID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Alias VARCHAR(50) NOT NULL,
    DoB DATE NOT NULL
);

CREATE TABLE StudentSection (
    SectionID INT,
    StudentID INT,
    Grade TINYINT,
    Absences TINYINT,
    PRIMARY KEY (SectionID, StudentID),
    FOREIGN KEY (SectionID) REFERENCES Section(SectionID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE StudentPower(
    StudentID INT,
    PowerID INT,
    Rating TINYINT NOT NULL,
    PRIMARY KEY(StudentID, PowerID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (PowerID) REFERENCES `Power`(PowerID)
);

CREATE TABLE StudentWeakness(
    StudentID INT,
    WeaknessID INT,
    RiskLevel TINYINT NOT NULL,
    PRIMARY KEY(StudentID, WeaknessID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (WeaknessID) REFERENCES Weakness(WeaknessID)
);

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Elemental', 'Manipulation of natural elements like fire, water, earth, and air.');

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Supernatural', 'Powers related to magical, mystical, or otherworldly sources.');

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Physical', 'Enhanced physical abilities, such as strength, speed, agility, and endurance.');

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Mental', 'Powers related to the mind, including telepathy, telekinesis, and mental manipulation.');

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Technological', 'Powers derived from advanced technology, gadgets, or cybernetic enhancements.');

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Biological', 'Powers resulting from unique biological traits or mutations.');

INSERT INTO PowerType (PowerTypeName, PowerTypeDescription)
VALUES ('Temporal', 'Abilities related to time manipulation, such as time travel, precognition, or slowing/speeding time.');

-- Elemental Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (1, 'Pyrokinesis', 'Control and manipulation of fire.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (1, 'Hydrokinesis', 'Control and manipulation of water.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (1, 'Terrakinesis', 'Control and manipulation of earth and soil.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (1, 'Aerokinesis', 'Control and manipulation of air and wind.');

-- Supernatural Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (2, 'Teleportation', 'Instantly transport oneself and/or others from one location to another.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (2, 'Necromancy', 'Manipulation and control of the dead and undead.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (2, 'Illusion Casting', 'Creation of realistic illusions to deceive others.');

-- Physical Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (3, 'Super Strength', 'Extraordinary physical strength beyond human limits.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (3, 'Super Speed', 'Ability to move at incredible speeds.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (3, 'Enhanced Agility', 'Exceptional balance, flexibility, and bodily coordination.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (3, 'Regeneration', 'Rapid healing and recovery from injuries.');

-- Mental Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (4, 'Telepathy', 'Ability to read and communicate with others mentally.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (4, 'Telekinesis', 'Manipulation and control of objects with the mind.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (4, 'Mind Control', 'Manipulation of the thoughts and actions of others.');

-- Technological Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (5, 'Cybernetic Enhancement', 'Enhanced abilities through integrated technology in the body.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (5, 'Gadgetry', 'Use and creation of advanced devices for various purposes.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (5, 'Technopathy', 'Ability to communicate with and control technology.');

-- Biological Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (6, 'Shape-shifting', 'Ability to change one''s physical form and appearance.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (6, 'Animal Mimicry', 'Adoption of abilities and traits of various animals.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (6, 'Plant Manipulation', 'Control and manipulation of plants and plant life.');

-- Temporal Powers
INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (7, 'Time Travel', 'Ability to move through time into the past or future.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (7, 'Precognition', 'Foreseeing future events.');

INSERT INTO Power (PowerTypeID, PowerName, PowerDescription)
VALUES (7, 'Time Manipulation', 'Ability to slow down, speed up, or stop time.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Elemental', 'Vulnerabilities related to natural elements like fire, water, earth, and air.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Supernatural', 'Weaknesses related to magical, mystical, or otherworldly sources.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Physical', 'Physical limitations or vulnerabilities, such as fatigue, slowed reflexes, or impaired senses.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Mental', 'Mental vulnerabilities, such as susceptibility to psychic attacks or mental manipulation.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Technological', 'Weaknesses derived from reliance on technology or susceptibility to technological attacks.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Biological', 'Weaknesses resulting from unique biological traits, vulnerabilities, or mutations.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Temporal', 'Vulnerabilities related to time manipulation, such as disorientation, time anomalies, or paradoxes.');

INSERT INTO WeaknessType (WeaknessTypeName, WeaknessTypeDescription)
VALUES ('Psychological', 'Weaknesses related to emotional, behavioral, or psychological aspects, such as phobias, temperament, or personality traits.');

-- Elemental Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (1, 'Elemental Dependency', 'Dependency on a specific element to maintain power.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (1, 'Fire Vulnerability', 'Increased vulnerability to fire or heat-based attacks.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (1, 'Water Vulnerability', 'Increased vulnerability to water or moisture-based attacks.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (1, 'Earth Vulnerability', 'Increased vulnerability to earth or ground-based attacks.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (1, 'Air Vulnerability', 'Increased vulnerability to air or wind-based attacks.');

-- Supernatural Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (2, 'Magic Vulnerability', 'Increased vulnerability to magical attacks or spells.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (2, 'Mystic Bindings', 'Susceptibility to being bound or confined by mystical means.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (2, 'Supernatural Exhaustion', 'Severe fatigue or power depletion after using supernatural abilities.');

-- Physical Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (3, 'Brittle Bones', 'Bones are more susceptible to breaking or fracturing.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (3, 'Sensory Overload', 'Inability to handle an excessive amount of sensory input.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (3, 'Low Stamina', 'Limited endurance and quick exhaustion during physical activities.');

-- Mental Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (4, 'Psychic Feedback', 'Suffering from pain or negative effects when using psychic powers on others.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (4, 'Mental Block', 'Inability to access powers under stress or emotional duress.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (4, 'Memory Loss', 'Loss of memory or difficulty recalling information.');

-- Technological Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (5, 'EMP Vulnerability', 'Susceptibility to damage or loss of function from electromagnetic pulses.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (5, 'Hacking', 'Vulnerability to having technology-based powers compromised by hackers.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (5, 'Technological Dependency', 'Dependency on technology to maintain or use powers.');

-- Biological Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (6, 'Allergies', 'Severe allergic reactions to specific substances or environments.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (6, 'Energy Drain', 'Power depletion due to energy consumption by another being.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (6, 'Genetic Instability', 'Unpredictable mutations or alterations in genetic makeup.');

-- Temporal Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (7, 'Temporal Disorientation', 'Disorientation or confusion after time travel or time manipulation.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (7, 'Chronal Paradox', 'Susceptibility to creating or being affected by time paradoxes.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (7, 'Time Dilation', 'Experiencing time at a different rate than others, leading to communication or coordination difficulties.');

-- Psychological Weaknesses
INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Arachnophobia', 'An extreme fear of spiders and other arachnids.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Claustrophobia', 'An extreme fear of enclosed or tight spaces.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Acrophobia', 'An extreme fear of heights.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Impulsiveness', 'A tendency to act without considering consequences.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Arrogance', 'Overconfidence in abilities, leading to underestimating opponents.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Jealousy', 'A strong desire for the possessions, achievements, or qualities of others.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Guilt', 'A constant feeling of guilt, often leading to self-doubt or hesitation.');

INSERT INTO Weakness (WeaknessTypeID, WeaknessName, WeaknessDescription)
VALUES (8, 'Anger', 'Difficulty controlling anger, leading to destructive behavior.');

-- Standard high school subjects
INSERT INTO Subject (SubjectName)
VALUES ('English');

INSERT INTO Subject (SubjectName)
VALUES ('Mathematics');

INSERT INTO Subject (SubjectName)
VALUES ('Science');

INSERT INTO Subject (SubjectName)
VALUES ('Social Studies');

INSERT INTO Subject (SubjectName)
VALUES ('Physical Education');

INSERT INTO Subject (SubjectName)
VALUES ('Foreign Language');

-- Superhero-related subjects
INSERT INTO Subject (SubjectName)
VALUES ('Power Control');

INSERT INTO Subject (SubjectName)
VALUES ('Self-Defense');

INSERT INTO Subject (SubjectName)
VALUES ('Tactics and Strategy');

INSERT INTO Subject (SubjectName)
VALUES ('Ethics and Responsibility');

INSERT INTO Subject (SubjectName)
VALUES ('Technology and Gadgets');

-- English Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (1, 'English Literature', 'A study of classic and contemporary literature in the English language.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (1, 'Creative Writing', 'Develop writing skills in various creative formats, including poetry, short stories, and essays.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (1, 'Public Speaking', 'Learn effective communication techniques and strategies for presenting to audiences.', 3.0);

-- Mathematics Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (2, 'Algebra', 'Learn the basics of algebra, including linear equations, inequalities, and quadratic functions.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (2, 'Geometry', 'Study the principles of geometry, including shapes, angles, and theorems.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (2, 'Calculus', 'An introduction to the concepts of calculus, including limits, derivatives, and integrals.', 3.0);

-- Science Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (3, 'Biology', 'An introduction to the study of living organisms, including their structure, function, and evolution.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (3, 'Chemistry', 'Learn the basics of chemistry, including atomic structure, chemical reactions, and the periodic table.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (3, 'Physics', 'Study the principles of physics, including mechanics, thermodynamics, and electromagnetism.', 3.0);

-- Social Studies Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (4, 'World History', 'Explore the history of human civilization from ancient times to the present.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (4, 'US History', 'Learn about the history of the United States from its founding to the present day.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (4, 'Political Science', 'Study the structures and functions of governments and political systems.', 3.0);

-- Physical Education Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (5, 'Team Sports', 'Develop teamwork and athletic skills through participation in various team sports.', 2.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (5, 'Fitness and Conditioning', 'Learn proper exercise techniques and strategies for improving physical fitness.', 2.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (5, 'Outdoor Education', 'Participate in outdoor activities and learn about environmental conservation.', 2.0);

-- Foreign Language Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (6, 'Spanish', 'Learn the basics of the Spanish language, including grammar, vocabulary, and conversation.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (6, 'French', 'Studythe basics of the French language, including grammar, vocabulary, and conversation.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (6, 'Mandarin', 'Learn the basics of the Mandarin language, including grammar, vocabulary, and conversation.', 3.0);

-- Power Control Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (7, 'Basic Power Mastery', 'Develop control and mastery over powers, focusing on precision and safety.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (7, 'Advanced Power Mastery', 'Further refine control over powers and learn advanced techniques.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (7, 'Power Synergy', 'Explore the potential for combining powers with other superheroes to create powerful synergies.', 3.0);

-- Self-Defense Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (8, 'Hand-to-Hand Combat', 'Learn effective hand-to-hand combat techniques for self-defense and incapacitating opponents.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (8, 'Weapon Training', 'Develop proficiency in a variety of weapons, both traditional and modern.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (8, 'Defensive Tactics', 'Study strategies for protecting oneself and others from physical harm.', 3.0);

-- Tactics and Strategy Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (9, 'Tactical Analysis', 'Learn to analyze situations and devise effective strategies for overcoming challenges.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (9, 'Team Dynamics', 'Study the principles of effective teamwork and collaboration in high-pressure situations.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (9, 'Crisis Management', 'Develop skills for managing crises and emergencies, including decision-making and resource allocation.', 3.0);

-- Ethics and Responsibility Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (10, 'Heroic Ethics', 'Explore the ethical responsibilities of superheroes and the impact of their actions on society.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (10, 'Justice and the Law', 'Study the legal system and the role of superheroes in upholding justice.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (10, 'Public Relations', 'Learn to manage public perception and effectively communicate with the public and the media.', 3.0);

-- Technology and Gadgets Courses
INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (11, 'Gadget Design', 'Learn the principles of designing and building custom gadgets for superhero use.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (11, 'Gadget Maintenance', 'Study the maintenance and repair of various superhero gadgets and technology.', 3.0);

INSERT INTO Course (SubjectID, CourseName, CourseDescription, Credits)
VALUES (11, 'Advanced Tech Integration', 'Explore the integration of advanced technology and gadgets into superhero operations.', 3.0);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Captain Quantum', '2022-01-15', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Mystic Shadow', '2022-02-01', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('The Falconer', '2022-03-10', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Dr. Vortex', '2022-04-20', '2023-02-28');

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Ms. Mirage', '2022-06-05', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Nimbus Knight', '2022-08-15', '2023-01-15');

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Electra Storm', '2022-09-01', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Chronos', '2022-10-10', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Siren Song', '2022-11-20', NULL);

INSERT INTO Instructor (Alias, HireDate, TermDate)
VALUES ('Titanium Templar', '2022-12-05', '2023-03-01');

INSERT INTO Section (CourseID, InstructorID, StartDate, EndDate, StartTime, EndTime)
VALUES
(1, 1, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(1, 2, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(2, 3, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(2, 4, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(3, 5, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(3, 6, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(4, 7, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(4, 8, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(5, 9, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(5, 10, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(6, 1, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(6, 2, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(7, 3, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(7, 4, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(8, 5, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(8, 6, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(9, 7, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(9, 8, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(10, 9, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(10, 10, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(11, 1, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(11, 2, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(12, 3, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(12, 4, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(13, 5, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(13, 6, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(14, 7, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(14, 8, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(15, 9, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(15, 10, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(16, 1, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(16, 2, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(17, 3, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(17, 4, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(18, 5, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(18, 6, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(19, 7, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(19, 8, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(20, 9, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(20, 10, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(21, 1, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(21, 2, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(22, 3, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(22, 4, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(23, 5, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(23, 6, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(24, 7, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(24, 8, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(25, 9, '2022-09-01', '2022-12-31', '14:00:00', '14:45:00'),
(25, 10, '2022-09-01', '2022-12-31', '09:00:00', '09:45:00'),
(26, 1, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(26, 2, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(27, 3, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(27, 4, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(28, 5, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(28, 6, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(29, 7, '2022-09-01', '2022-12-31', '11:00:00', '11:45:00'),
(29, 8, '2022-09-01', '2022-12-31', '13:00:00', '13:45:00'),
(30, 9, '2022-09-01', '2022-12-31', '10:00:00', '10:45:00'),
(30, 10, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(31, 1, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(31, 2, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(32, 3, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(32, 4, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
(33, 5, '2022-09-01', '2022-12-31', '12:00:00', '12:45:00'),
(33, 6, '2022-09-01', '2022-12-31', '15:00:00', '15:45:00'),
-- second semester
(1, 1, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(1, 2, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(2, 3, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(3, 5, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(4, 7, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(4, 8, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(5, 9, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(5, 10, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(6, 1, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(6, 2, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(7, 3, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(8, 5, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(9, 7, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(9, 8, '2023-01-01', '2023-03-31', '12:00:00', '12:45:00'),
(10, 9, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(10, 10, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(11, 1, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(11, 2, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(12, 3, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(13, 5, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(14, 7, '2023-01-01', '2023-03-31', '12:00:00', '12:45:00'),
(14, 8, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(15, 9, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(15, 10, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(16, 1, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(16, 2, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(17, 3, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(18, 5, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(19, 7, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(19, 8, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(20, 9, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(20, 10, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(21, 1, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(21, 2, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(22, 3, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(23, 5, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(24, 7, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(24, 8, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(25, 9, '2023-01-01', '2023-03-31', '14:00:00', '14:45:00'),
(25, 10, '2023-01-01', '2023-03-31', '09:00:00', '09:45:00'),
(26, 1, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(26, 2, '2023-01-01', '2023-03-31', '12:00:00', '12:45:00'),
(27, 3, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(28, 5, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(29, 7, '2023-01-01', '2023-03-31', '11:00:00', '11:45:00'),
(29, 8, '2023-01-01', '2023-03-31', '13:00:00', '13:45:00'),
(30, 9, '2023-01-01', '2023-03-31', '10:00:00', '10:45:00'),
(30, 10, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(31, 1, '2023-01-01', '2023-03-31', '12:00:00', '12:45:00'),
(31, 2, '2023-01-01', '2023-03-31', '15:00:00', '15:45:00'),
(32, 3, '2023-01-01', '2023-03-31', '12:00:00', '12:45:00'),
(33, 5, '2023-01-01', '2023-03-31', '12:00:00', '12:45:00'),
-- third semesester
(1, 1, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(1, 2, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(2, 3, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(3, 5, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(4, 7, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(4, 8, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(5, 9, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(6, 1, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(6, 2, '2023-04-01', '2023-06-30', '13:00:00', '13:45:00'),
(7, 3, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(8, 5, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(9, 7, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(9, 8, '2023-04-01', '2023-06-30', '12:00:00', '12:45:00'),
(10, 9, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(11, 1, '2023-04-01', '2023-06-30', '13:00:00', '13:45:00'),
(11, 2, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(12, 3, '2023-04-01', '2023-06-30', '13:00:00', '13:45:00'),
(13, 5, '2023-04-01', '2023-06-30', '13:00:00', '13:45:00'),
(14, 7, '2023-04-01', '2023-06-30', '12:00:00', '12:45:00'),
(14, 8, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(15, 9, '2023-04-01', '2023-06-30', '13:00:00', '13:45:00'),
(16, 1, '2023-04-01', '2023-06-30', '15:00:00', '15:45:00'),
(16, 2, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(17, 3, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(18, 5, '2023-04-01', '2023-06-30', '15:00:00', '15:45:00'),
(19, 7, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(19, 8, '2023-04-01', '2023-06-30', '09:00:00', '09:45:00'),
(20, 9, '2023-04-01', '2023-06-30', '15:00:00', '15:45:00'),
(21, 1, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(21, 2, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(22, 3, '2023-04-01', '2023-06-30', '15:00:00', '15:45:00'),
(23, 5, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(24, 7, '2023-04-01', '2023-06-30', '15:00:00', '15:45:00'),
(24, 8, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(25, 9, '2023-04-01', '2023-06-30', '14:00:00', '14:45:00'),
(26, 1, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(26, 2, '2023-04-01', '2023-06-30', '12:00:00', '12:45:00'),
(27, 3, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(28, 5, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(29, 7, '2023-04-01', '2023-06-30', '11:00:00', '11:45:00'),
(29, 8, '2023-04-01', '2023-06-30', '13:00:00', '13:45:00'),
(30, 9, '2023-04-01', '2023-06-30', '10:00:00', '10:45:00'),
(31, 1, '2023-04-01', '2023-06-30', '12:00:00', '12:45:00'),
(31, 2, '2023-04-01', '2023-06-30', '15:00:00', '15:45:00'),
(32, 3, '2023-04-01', '2023-06-30', '12:00:00', '12:45:00'),
(33, 5, '2023-04-01', '2023-06-30', '12:00:00', '12:45:00');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Emily', 'Smith', 'Solar Flare', '2004-03-12');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Oliver', 'Johnson', 'Thunder Bolt', '2005-10-22');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Sophia', 'Williams', 'Astral Whisper', '2006-06-30');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Mason', 'Brown', 'Mist Phantom', '2004-11-18');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Ava', 'Taylor', 'Icicle', '2006-08-15');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('William', 'Miller', 'Vortex Runner', '2007-05-24');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Amelia', 'Davis', 'Celestial Sprite', '2004-02-28');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('James', 'Garcia', 'Phantom Hawk', '2005-04-20');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Charlotte', 'Rodriguez', 'Lumina', '2004-12-15');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Michael', 'Wilson', 'Graviton', '2007-01-10');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Lily', 'Martinez', 'Blur', '2005-09-05');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Benjamin', 'Anderson', 'Void Walker', '2006-07-12');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Grace', 'Thomas', 'Wisp', '2007-03-30');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Lucas', 'Jackson', 'Crimson Shadow', '2006-11-26');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Sophie', 'White', 'Stellar Echo', '2004-05-08');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Noah', 'Harris', 'Nebula Knight', '2007-10-20');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Emma', 'Lewis', 'Tempest', '2004-08-14');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Henry', 'Lee', 'Sonic Boom', '2005-06-19');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Ella', 'Walker', 'Aurora', '2006-12-01');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Liam', 'Young', 'Inferno', '2004-10-10');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Harper', 'Hernandez', 'Eclipse', '2005-02-25');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Samuel', 'King', 'Blaze', '2006-04-29');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Abigail', 'Wright', 'Moonbeam', '2007-07-07');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Logan', 'Lopez', 'Storm Bringer', '2004-01-20');

INSERT INTO Student (FirstName, LastName, Alias, DoB)
VALUES ('Isabella', 'Hill', 'Spectral', '2005-11-23');

-- 9:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 1, 0, 85),
(2, 3, 0, 78),
(3, 5, 0, 81),
(4, 7, 0, 92),
(5, 9, 2, 75),
(7, 32, 0, 89),
(8, 34, 0, 77),
(9, 36, 1, 87),
(11, 38, 0, 96),
(12, 50, 0, 91),
(14, 5, 0, 79),
(15, 7, 3, 64),
(17, 9, 0, 88),
(18, 32, 0, 98),
(19, 34, 0, 76),
(20, 36, 0, 83),
(21, 38, 4, 61),
(22, 50, 0, 93),
(24, 3, 0, 80),
(25, 1, 2, 72);

-- 10:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 51, 0, 82),
(2, 55, 0, 76),
(3, 59, 0, 88),
(4, 17, 0, 91),
(5, 59, 1, 73),
(7, 13, 0, 84),
(8, 8, 0, 79),
(9, 6, 0, 87),
(11, 4, 0, 93),
(12, 2, 0, 90),
(14, 59, 0, 77),
(15, 17, 2, 67),
(17, 59, 0, 86),
(18, 13, 0, 95),
(19, 8, 0, 81),
(20, 6, 0, 83),
(21, 4, 3, 62),
(22, 2, 0, 89),
(24, 55, 0, 78),
(25, 51, 1, 74);

-- 11:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 15, 0, 86),
(2, 11, 0, 80),
(3, 19, 0, 89),
(4, 57, 0, 94),
(5, 53, 1, 76),
(7, 40, 0, 85),
(8, 42, 0, 78),
(9, 44, 0, 90),
(11, 46, 0, 92),
(12, 48, 0, 91),
(14, 19, 0, 82),
(15, 57, 2, 69),
(17, 53, 0, 87),
(18, 40, 0, 97),
(19, 42, 0, 79),
(20, 44, 0, 84),
(21, 46, 3, 63),
(22, 48, 0, 93),
(24, 11, 0, 81),
(25, 15, 1, 71);

-- 12:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 52, 0, 83),
(2, 61, 0, 76),
(3, 63, 0, 89),
(4, 65, 0, 91),
(5, 18, 2, 74),
(7, 27, 0, 84),
(8, 16, 0, 78),
(9, 14, 0, 88),
(11, 52, 0, 94),
(12, 61, 0, 90),
(14, 63, 0, 79),
(15, 65, 3, 65),
(17, 18, 0, 87),
(18, 27, 0, 98),
(19, 16, 0, 80),
(20, 14, 0, 82),
(21, 52, 4, 60),
(22, 61, 0, 93),
(24, 63, 0, 81),
(25, 65, 1, 72);

-- 13:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 12, 0, 84),
(2, 25, 0, 76),
(3, 29, 0, 88),
(4, 23, 0, 93),
(5, 20, 1, 75),
(7, 21, 0, 86),
(8, 54, 0, 79),
(9, 58, 0, 87),
(11, 56, 0, 95),
(12, 12, 0, 90),
(14, 25, 0, 80),
(15, 29, 3, 66),
(17, 23, 0, 89),
(18, 20, 0, 97),
(19, 21, 0, 77),
(20, 54, 0, 83),
(21, 58, 4, 61),
(22, 56, 0, 92),
(24, 12, 0, 82),
(25, 25, 1, 71);

-- 14:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 49, 0, 85),
(2, 45, 0, 78),
(3, 41, 0, 81),
(4, 37, 0, 92),
(5, 22, 1, 75),
(7, 24, 0, 89),
(8, 30, 0, 77),
(9, 33, 0, 87),
(11, 26, 0, 96),
(12, 28, 0, 91),
(14, 41, 0, 79),
(15, 37, 2, 64),
(17, 22, 0, 88),
(18, 24, 0, 98),
(19, 30, 0, 76),
(20, 33, 0, 83),
(21, 26, 3, 61),
(22, 28, 0, 93),
(24, 45, 0, 80),
(25, 49, 1, 72);

-- 15:00 first semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(1, 31, 0, 82),
(2, 35, 0, 76),
(3, 39, 0, 88),
(4, 43, 0, 91),
(5, 47, 1, 73),
(7, 66, 0, 84),
(8, 64, 0, 78),
(9, 62, 0, 87),
(11, 60, 0, 93),
(12, 31, 0, 90),
(14, 35, 0, 77),
(15, 39, 2, 67),
(17, 43, 0, 86),
(18, 47, 0, 95),
(19, 66, 0, 81),
(20, 64, 0, 83),
(21, 62, 3, 62),
(22, 60, 0, 89),
(24, 31, 0, 78),
(25, 35, 1, 74);

-- 9:00 second semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 69, 0, 78),
(3, 70, 0, 88),
(5, 71, 1, 75),
(6, 73, 0, 84),
(8, 67, 0, 79),
(10, 92, 0, 87),
(11, 96, 0, 93),
(12, 106, 0, 90),
(13, 69, 0, 80),
(14, 70, 2, 64),
(16, 71, 0, 86),
(18, 73, 0, 95),
(19, 67, 0, 81),
(21, 92, 3, 62),
(22, 96, 0, 89),
(23, 106, 0, 91),
(25, 69, 1, 72);

-- 10:00 2nd semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 107, 0, 78),
(3, 110, 0, 88),
(5, 113, 1, 75),
(6, 79, 0, 84),
(8, 79, 0, 79),
(10, 77, 0, 87),
(11, 74, 0, 93),
(12, 72, 0, 90),
(13, 107, 0, 80),
(14, 110, 2, 64),
(16, 113, 0, 86),
(18, 79, 0, 95),
(19, 74, 0, 81),
(21, 77, 3, 62),
(22, 74, 0, 89),
(23, 72, 0, 91),
(25, 107, 1, 72);

-- 11:00 3rd semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 75, 0, 78),
(3, 78, 0, 88),
(5, 81, 1, 75),
(6, 98, 0, 84),
(8, 100, 0, 79),
(10, 111, 0, 87),
(11, 109, 0, 93),
(12, 104, 0, 90),
(13, 75, 0, 80),
(14, 78, 2, 64),
(16, 81, 0, 86),
(18, 98, 0, 95),
(19, 100, 0, 81),
(21, 111, 3, 62),
(22, 109, 0, 89),
(23, 104, 0, 91),
(25, 75, 1, 72);

-- 12:00 3rd semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 108, 0, 78),
(3, 115, 0, 88),
(5, 117, 1, 75),
(6, 118, 0, 84),
(8, 80, 0, 79),
(10, 87, 0, 87),
(11, 108, 0, 93),
(12, 115, 0, 90),
(13, 117, 0, 80),
(14, 118, 2, 64),
(16, 80, 0, 86),
(18, 87, 0, 95),
(19, 108, 0, 81),
(21, 115, 3, 62),
(22, 117, 0, 89),
(23, 118, 0, 91),
(25, 80, 1, 72);

-- 13:00 3rd semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 89, 0, 78),
(3, 85, 0, 88),
(5, 86, 1, 75),
(6, 82, 0, 84),
(8, 83, 0, 79),
(10, 76, 0, 87),
(11, 112, 0, 93),
(12, 89, 0, 90),
(13, 85, 0, 80),
(14, 86, 2, 64),
(16, 82, 0, 86),
(18, 83, 0, 95),
(19, 76, 0, 81),
(21, 86, 3, 62),
(22, 89, 0, 89),
(23, 85, 0, 91),
(25, 86, 1, 72);

-- 14:00 3rd semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 95, 0, 78),
(3, 105, 0, 88),
(5, 102, 1, 75),
(6, 84, 0, 84),
(8, 90, 0, 79),
(10, 88, 0, 87),
(11, 99, 0, 93),
(12, 93, 0, 90),
(13, 95, 0, 80),
(14, 105, 2, 64),
(16, 102, 0, 86),
(18, 84, 0, 95),
(19, 90, 0, 81),
(21, 88, 3, 62),
(22, 99, 0, 89),
(23, 93, 0, 91),
(25, 95, 1, 72);

-- 15:00 3rd semester
INSERT INTO StudentSection(StudentID, SectionID, Absences, Grade)
VALUES
(2, 94, 0, 78),
(3, 97, 0, 88),
(5, 101, 1, 75),
(6, 91, 0, 84),
(8, 103, 0, 79),
(10, 114, 0, 87),
(11, 116, 0, 93),
(12, 94, 0, 90),
(13, 97, 0, 80),
(14, 101, 2, 64),
(16, 91, 0, 86),
(18, 103, 0, 95),
(19, 114, 0, 81),
(21, 116, 3, 62),
(22, 94, 0, 89),
(23, 97, 0, 91),
(25, 101, 1, 72);

INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (1, 1, 73);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (1, 4, 64);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (2, 4, 59);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (2, 9, 81);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (3, 12, 88);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (3, 13, 52);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (4, 6, 66);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (4, 8, 90);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (5, 2, 69);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (5, 20, 61);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (6, 9, 76);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (6, 23, 70);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (7, 21, 58);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (7, 22, 84);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (8, 8, 95);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (8, 13, 56);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (9, 18, 78);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (9, 21, 67);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (10, 3, 62);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (10, 23, 89);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (11, 9, 92);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (11, 10, 80);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (12, 5, 74);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (12, 14, 60);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (13, 6, 63);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (13, 7, 50);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (14, 8, 91);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (14, 13, 77);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (15, 21, 86);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (15, 22, 57);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (16, 18, 82);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (16, 21, 71);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (17, 4, 65);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (17, 20, 75);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (18, 9, 54);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (18, 10, 93);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (19, 21, 68);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (19, 22, 83);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (20, 1, 79);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (20, 4, 72);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (21, 18, 55);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (21, 21, 94);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (22, 1, 51);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (22, 4, 85);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (23, 21, 87);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (23, 22, 76);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (24, 4, 98);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (24, 9, 49);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (25, 18, 70);
INSERT INTO StudentPower (StudentID, PowerID, Rating) VALUES (25, 21, 81);

INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (1, 3, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (1, 28, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (2, 4, 5);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (2, 27, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (3, 9, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (3, 30, 2);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (4, 8, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (4, 25, 5);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (5, 1, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (5, 29, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (6, 19, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (6, 27, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (7, 12, 5);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (7, 28, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (8, 11, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (8, 31, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (9, 18, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (9, 30, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (10, 21, 8);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (10, 29, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (11, 9, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (11, 27, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (12, 12, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (12, 25, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (13, 21, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (13, 28, 5);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (14, 8, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (14, 31, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (15, 24, 2);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (15, 29, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (16, 24, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (16, 30, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (17, 3, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (17, 28, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (18, 2, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (18, 27, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (19, 13, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (19, 30, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (20, 1, 8);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (20, 29, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (21, 26, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (21, 31, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (22, 3, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (22, 27, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (23, 13, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (23, 25, 4);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (24, 4, 7);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (24, 30, 3);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (25, 19, 6);
INSERT INTO StudentWeakness (StudentID, WeaknessID, RiskLevel) VALUES (25, 28, 5);

