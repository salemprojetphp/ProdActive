-- Insert synthetic users into the AspNetUsers table
INSERT INTO AspNetUsers (Id, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, SecurityStamp, ConcurrencyStamp)
VALUES 
  (NEWID(), 'user1', 'USER1', 'user1@example.com', 'USER1@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp1', 'stamp1'),
  (NEWID(), 'user2', 'USER2', 'user2@example.com', 'USER2@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp2', 'stamp2'),
  (NEWID(), 'user3', 'USER3', 'user3@example.com', 'USER3@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp3', 'stamp3'),
  (NEWID(), 'user4', 'USER4', 'user4@example.com', 'USER4@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp4', 'stamp4'),
  (NEWID(), 'user5', 'USER5', 'user5@example.com', 'USER5@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp5', 'stamp5'),
  (NEWID(), 'user6', 'USER6', 'user6@example.com', 'USER6@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp6', 'stamp6'),
  (NEWID(), 'user7', 'USER7', 'user7@example.com', 'USER7@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp7', 'stamp7'),
  (NEWID(), 'user8', 'USER8', 'user8@example.com', 'USER8@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp8', 'stamp8'),
  (NEWID(), 'user9', 'USER9', 'user9@example.com', 'USER9@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp9', 'stamp9'),
  (NEWID(), 'user10', 'USER10', 'user10@example.com', 'USER10@EXAMPLE.COM', 1, 'hashed_password_here', 'stamp10', 'stamp10');

-- Insert synthetic projects into the Project table
INSERT INTO Project (Id, Title, Description, Status, DateDebut, DateFin, Expected_duree, ManagerId)
VALUES
  (1, 'Project Alpha', 'Description for Project Alpha', 0, '2025-01-01', '2025-06-01', 150, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (2, 'Project Beta', 'Description for Project Beta', 1, '2024-11-01', '2025-01-30', 90, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (3, 'Project Gamma', 'Description for Project Gamma', -1, '2024-08-01', '2024-09-30', 60, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (4, 'Project Delta', 'Description for Project Delta', 0, '2025-02-01', '2025-08-01', 180, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (5, 'Project Epsilon', 'Description for Project Epsilon', 1, '2024-10-01', '2024-12-01', 60, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (6, 'Project Zeta', 'Description for Project Zeta', 0, '2025-03-01', '2025-09-01', 200, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (7, 'Project Eta', 'Description for Project Eta', -1, '2024-05-01', '2024-07-01', 90, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (8, 'Project Theta', 'Description for Project Theta', 0, '2025-04-01', '2025-12-01', 240, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (9, 'Project Iota', 'Description for Project Iota', 1, '2024-06-01', '2024-08-01', 60, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (10, 'Project Kappa', 'Description for Project Kappa', 0, '2025-05-01', '2025-11-01', 180, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));


-- Insert synthetic data for ProjectEmployee table with specific assignments
-- Each employee is assigned to at least one project, and an employee can be assigned to multiple projects

-- Project 1
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5'));

-- Project 2
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7'));

-- Project 3
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Project 4
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7'));

-- Project 5
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Project 6
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5'));

-- Project 7
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8'));

-- Project 8
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9'));

-- Project 9
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Project 10
INSERT INTO ProjectEmployee (ProjectId, EmployeeId) VALUES 
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8'));


-- Insert synthetic data for Reunion table
INSERT INTO Reunion (Id, Date, Objet, Description, Lieu, Duree, Status, ProjectId)
VALUES
  (1, '2025-02-01', 'Kick-off Meeting', 'Initial discussion about project objectives', 0, 60, 0, 1),
  (2, '2025-02-10', 'Progress Update', 'Review of the project status and deliverables', 1, 90, 0, 2),
  (3, '2025-02-20', 'Design Review', 'Evaluation of the design prototypes', 0, 120, 0, 3),
  (4, '2025-03-01', 'Team Building', 'Meeting for team bonding and collaboration', 1, 180, 0, 4),
  (5, '2025-03-05', 'Sprint Planning', 'Planning the next sprint for project delivery', 0, 75, 0, 5),
  (6, '2025-03-10', 'Client Meeting', 'Discussing the feedback from the client', 1, 90, 0, 6),
  (7, '2025-03-15', 'Project Closure', 'Final discussion to close the project', 0, 60, 1, 7),
  (8, '2025-03-20', 'Budget Review', 'Reviewing the project budget and expenses', 1, 60, 0, 8),
  (9, '2025-03-25', 'Mid-Project Review', 'Assessing the progress of the project midway', 0, 90, 0, 9),
  (10, '2025-04-01', 'Final Presentation', 'Presenting the final outcomes of the project', 1, 120, -1, 10);

-- Insert synthetic data for ReunionParticipants table (assuming you want to add participants)
-- Each participant will be added to each meeting.

-- Reunion 1
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3'));

-- Reunion 2
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6'));

-- Reunion 3
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8'));

-- Reunion 4
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9'));

-- Reunion 5
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6'));

-- Reunion 6
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Reunion 7
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9'));

-- Reunion 8
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8'));

-- Reunion 9
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Reunion 10
INSERT INTO ReunionParticipant (ReunionId, EmployeeId) 
VALUES
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7'));

-- Insert synthetic data for Pointage table
INSERT INTO Pointage (Date, TransactionType, EmployeeId)
VALUES
  ('2025-01-01 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry for user1
  ('2025-01-01 12:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause for user1
  ('2025-01-01 13:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume for user1
  ('2025-01-01 17:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving for user1
  
  ('2025-01-02 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry for user2
  ('2025-01-02 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause for user2
  ('2025-01-02 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume for user2
  ('2025-01-02 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving for user2
  
  ('2025-01-03 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry for user3
  ('2025-01-03 11:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause for user3
  ('2025-01-03 12:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume for user3
  ('2025-01-03 16:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving for user3
  
  ('2025-01-04 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry for user4
  ('2025-01-04 13:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause for user4
  ('2025-01-04 14:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume for user4
  ('2025-01-04 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')); -- Leaving for user4

-- Insert synthetic data for Conge (Leave) table
INSERT INTO Conge (DateDebut, DateFin, Objet, Status, EmployeeId)
VALUES
  ('2025-02-01', '2025-02-05', 'Vacation', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Accepted leave for user1
  ('2025-02-10', '2025-02-14', 'Medical Leave', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pending leave for user2
  ('2025-03-01', '2025-03-03', 'Personal Leave', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Rejected leave for user3
  ('2025-03-10', '2025-03-15', 'Vacation', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Accepted leave for user4
  ('2025-04-01', '2025-04-07', 'Sick Leave', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Pending leave for user5
  ('2025-04-10', '2025-04-12', 'Family Emergency', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Rejected leave for user6
  ('2025-05-01', '2025-05-07', 'Vacation', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Accepted leave for user7
  ('2025-05-10', '2025-05-12', 'Study Leave', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Pending leave for user8
  ('2025-06-01', '2025-06-05', 'Medical Leave', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Accepted leave for user9
  ('2025-06-10', '2025-06-14', 'Vacation', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')); -- Rejected leave for user10


-- Insert synthetic data for Feedback table
INSERT INTO Feedback (Subject, Message, Rating)
VALUES
  ('Performance Review', 'The employee performed exceptionally well this month.', 1), -- Positive feedback
  ('Teamwork', 'There was some communication breakdown within the team.', 0), -- Negative feedback
  ('Work Quality', 'The quality of the work delivered was above expectations.', 1), -- Positive feedback
  ('Deadlines', 'The deadlines were missed repeatedly, which caused delays.', 0), -- Negative feedback
  ('Customer Service', 'The customer service team provided great support during the issue.', 1), -- Positive feedback
  ('Collaboration', 'Collaboration was poor, and team members struggled to work together.', 0), -- Negative feedback
  ('Leadership', 'The leadership displayed exceptional guidance and decision-making.', 1), -- Positive feedback
  ('Efficiency', 'The team’s efficiency could be improved with better tools and communication.', 0), -- Negative feedback
  ('Communication', 'Clear and concise communication was maintained throughout the project.', 1), -- Positive feedback
  ('Work Environment', 'The work environment needs improvement to foster better collaboration.', 0); -- Negative feedback

