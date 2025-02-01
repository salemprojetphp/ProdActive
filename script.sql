-- Insert synthetic users into the AspNetUsers table
-- Insert 25 synthetic users into the AspNetUsers table
INSERT INTO AspNetUsers 
    (Id, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, 
     PasswordHash, SecurityStamp, ConcurrencyStamp, AccessFailedCount, 
     LockoutEnabled, TwoFactorEnabled, PhoneNumberConfirmed)
VALUES 
    (NEWID(), 'user1', 'USER1', 'user1@example.com', 'USER1@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp1', 'stamp1', 0, 1, 0, 0),
    (NEWID(), 'user2', 'USER2', 'user2@example.com', 'USER2@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp2', 'stamp2', 0, 1, 0, 0),
    (NEWID(), 'user3', 'USER3', 'user3@example.com', 'USER3@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp3', 'stamp3', 0, 1, 0, 0),
    (NEWID(), 'user4', 'USER4', 'user4@example.com', 'USER4@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp4', 'stamp4', 0, 1, 0, 0),
    (NEWID(), 'user5', 'USER5', 'user5@example.com', 'USER5@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp5', 'stamp5', 0, 1, 0, 0),
    (NEWID(), 'user6', 'USER6', 'user6@example.com', 'USER6@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp6', 'stamp6', 0, 1, 0, 0),
    (NEWID(), 'user7', 'USER7', 'user7@example.com', 'USER7@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp7', 'stamp7', 0, 1, 0, 0),
    (NEWID(), 'user8', 'USER8', 'user8@example.com', 'USER8@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp8', 'stamp8', 0, 1, 0, 0),
    (NEWID(), 'user9', 'USER9', 'user9@example.com', 'USER9@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp9', 'stamp9', 0, 1, 0, 0),
    (NEWID(), 'user10', 'USER10', 'user10@example.com', 'USER10@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp10', 'stamp10', 0, 1, 0, 0),
    (NEWID(), 'user11', 'USER11', 'user11@example.com', 'USER11@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp11', 'stamp11', 0, 1, 0, 0),
    (NEWID(), 'user12', 'USER12', 'user12@example.com', 'USER12@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp12', 'stamp12', 0, 1, 0, 0),
    (NEWID(), 'user13', 'USER13', 'user13@example.com', 'USER13@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp13', 'stamp13', 0, 1, 0, 0),
    (NEWID(), 'user14', 'USER14', 'user14@example.com', 'USER14@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp14', 'stamp14', 0, 1, 0, 0),
    (NEWID(), 'user15', 'USER15', 'user15@example.com', 'USER15@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp15', 'stamp15', 0, 1, 0, 0),
    (NEWID(), 'user16', 'USER16', 'user16@example.com', 'USER16@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp16', 'stamp16', 0, 1, 0, 0),
    (NEWID(), 'user17', 'USER17', 'user17@example.com', 'USER17@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp17', 'stamp17', 0, 1, 0, 0),
    (NEWID(), 'user18', 'USER18', 'user18@example.com', 'USER18@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp18', 'stamp18', 0, 1, 0, 0),
    (NEWID(), 'user19', 'USER19', 'user19@example.com', 'USER19@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp19', 'stamp19', 0, 1, 0, 0),
    (NEWID(), 'user20', 'USER20', 'user20@example.com', 'USER20@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp20', 'stamp20', 0, 1, 0, 0),
    (NEWID(), 'user21', 'USER21', 'user21@example.com', 'USER21@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp21', 'stamp21', 0, 1, 0, 0),
    (NEWID(), 'user22', 'USER22', 'user22@example.com', 'USER22@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp22', 'stamp22', 0, 1, 0, 0),
    (NEWID(), 'user23', 'USER23', 'user23@example.com', 'USER23@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp23', 'stamp23', 0, 1, 0, 0),
    (NEWID(), 'user24', 'USER24', 'user24@example.com', 'USER24@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp24', 'stamp24', 0, 1, 0, 0),
    (NEWID(), 'user25', 'USER25', 'user25@example.com', 'USER25@EXAMPLE.COM', 1, 
     'hashed_password_here', 'stamp25', 'stamp25', 0, 1, 0, 0);

-- Insert 12 synthetic projects into the Project table
INSERT INTO Projects (Title, Description, Status, DateDebut, DateFin, Expected_duree, ManagerId)
VALUES
  ('Project Alpha', 'Description for Project Alpha', 0, '2025-01-01', '2025-06-01', 150, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  ('Project Beta', 'Description for Project Beta', 1, '2024-11-01', '2025-01-30', 90, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  ('Project Gamma', 'Description for Project Gamma', -1, '2024-08-01', '2024-09-30', 60, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  ('Project Delta', 'Description for Project Delta', 0, '2025-02-01', '2025-08-01', 180, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  ('Project Epsilon', 'Description for Project Epsilon', 1, '2024-10-01', '2024-12-01', 60, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('Project Zeta', 'Description for Project Zeta', 0, '2025-03-01', '2025-09-01', 200, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('Project Eta', 'Description for Project Eta', -1, '2024-05-01', '2024-07-01', 90, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('Project Theta', 'Description for Project Theta', 0, '2025-04-01', '2025-12-01', 240, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('Project Iota', 'Description for Project Iota', 1, '2024-06-01', '2024-08-01', 60, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('Project Kappa', 'Description for Project Kappa', 0, '2025-05-01', '2025-11-01', 180, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('Project Lambda', 'Description for Project Lambda', 1, '2025-06-01', '2025-12-01', 180, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('Project Mu', 'Description for Project Mu', 0, '2025-07-01', '2025-12-31', 180, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12'));

-- Assign users to projects

-- Project 1
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12'));

-- Project 2
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13'));

-- Project 3
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14'));

-- Project 4
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15'));

-- Project 5
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16'));

-- Repeat the pattern for the remaining projects
-- Ensuring that each project has 12 different users

-- Project 6
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17'));

-- Project 7
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18'));

-- Project 8
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19'));

-- Project 9
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20'));

-- Project 10
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21'));

-- Project 11
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22'));

-- Project 12
INSERT INTO ProjectEmployees (ProjectId, EmployeeId) VALUES 
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23'));

-- Insert 20 synthetic reunions with more details
INSERT INTO Reunions (Date, Objet, Description, Lieu, Duree, Status, ProjectId)
VALUES
  ('2025-02-01', 'Kick-off Meeting', 'Initial discussion about project objectives and team roles.', 0, 60, 0, 1),
  ('2025-02-10', 'Progress Update', 'Review of the project status, deliverables, and upcoming milestones.', 1, 90, 0, 2),
  ('2025-02-20', 'Design Review', 'Evaluation of the design prototypes and feedback from stakeholders.', 0, 120, 0, 3),
  ('2025-03-01', 'Team Building', 'Meeting for team bonding, collaboration, and improving communication.', 1, 180, 0, 4),
  ('2025-03-05', 'Sprint Planning', 'Planning the next sprint, assigning tasks, and setting deadlines.', 0, 75, 0, 5),
  ('2025-03-10', 'Client Meeting', 'Discussing the feedback from the client and aligning on next steps.', 1, 90, 0, 6),
  ('2025-03-15', 'Project Closure', 'Final discussion to close the project, review achievements, and document lessons learned.', 0, 60, 1, 7),
  ('2025-03-20', 'Budget Review', 'Reviewing the project budget, expenses, and financial forecasts.', 1, 60, 0, 8),
  ('2025-03-25', 'Mid-Project Review', 'Assessing the progress of the project midway and adjusting the plan if necessary.', 0, 90, 0, 9),
  ('2025-04-01', 'Final Presentation', 'Presenting the final outcomes of the project to stakeholders and clients.', 1, 120, -1, 10),
  ('2025-05-01', 'Planning Meeting', 'Planning for the next phase of the project, including resource allocation and timelines.', 0, 90, 0, 11),
  ('2025-06-01', 'Retrospective', 'Reviewing lessons learned from the project and identifying areas for improvement.', 1, 120, 0, 12),
  ('2025-02-15', 'Emergency Meeting', 'Addressing unexpected issues with the project timeline and deliverables.', 0, 45, 0, 1),
  ('2025-03-12', 'Stakeholder Workshop', 'Workshop with external stakeholders to gather requirements and feedback.', 1, 150, 0, 2),
  ('2025-04-10', 'Risk Assessment', 'Identifying potential risks and developing mitigation strategies.', 0, 90, 0, 3),
  ('2025-05-15', 'Training Session', 'Training team members on new tools and technologies for the project.', 1, 120, 0, 4),
  ('2025-06-10', 'Post-Mortem Analysis', 'Analyzing the project’s successes and failures after completion.', 0, 90, 1, 5),
  ('2025-07-01', 'Quarterly Review', 'Reviewing the project’s progress and alignment with quarterly goals.', 1, 120, 0, 6),
  ('2025-08-01', 'Innovation Brainstorm', 'Brainstorming session to explore innovative solutions for project challenges.', 0, 90, 0, 7),
  ('2025-09-01', 'Celebration Event', 'Celebrating the successful completion of the project with the team.', 1, 180, 1, 8);

-- Insert synthetic data for ReunionParticipants table
-- Each meeting now has meaningful participants based on its type.

-- Reunion 1: Kick-off Meeting for Project 1 (includes all participants assigned to Project 1)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Manager
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12'));

-- Reunion 2: Progress Update for Project 2 (includes all 12 users assigned to Project 2)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Manager
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13'));

-- Reunion 3: Design Review for Project 3 (includes all 12 users assigned to Project 3)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Manager
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14'));

-- Reunion 4: Team Building for Project 4 (includes all 12 users assigned to Project 4)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Manager
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15'));

-- Reunion 5: Sprint Planning for Project 5 (includes all 8 users assigned to Project 5)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Manager
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16'));

-- Reunion 6: Client Meeting for Project 6 (includes all 10 users assigned to Project 6)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Manager
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17'));

-- Reunion 7: Project Closure for Project 7 (includes all 11 users assigned to Project 7)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Manager
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18'));

-- Reunion 8: Budget Review for Project 8 (includes all 12 users assigned to Project 8)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Manager
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19'));

-- Reunion 9: Mid-Project Review for Project 9 (includes all 10 users assigned to Project 9)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Manager
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20'));

-- Reunion 10: Final Presentation for Project 10 (includes all 11 users assigned to Project 10)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Manager
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  (10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21'));

-- Reunion 11: Planning Meeting for Project 11 (includes all 11 users assigned to Project 11)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Manager
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  (11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22'));

-- Reunion 12: Retrospective for Project 12 (includes all 7 users assigned to Project 12)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Manager
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  (12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23'));

-- Reunion 13: Emergency Meeting for Project 1 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (13, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Manager
  (13, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
  (13, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
  (13, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (13, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6'));

-- Reunion 14: Stakeholder Workshop for Project 2 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (14, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Manager
  (14, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
  (14, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (14, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (14, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8'));

-- Reunion 15: Risk Assessment for Project 3 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (15, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Manager
  (15, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  (15, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (15, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (15, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Reunion 16: Training Session for Project 4 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (16, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Manager
  (16, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (16, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (16, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (16, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11'));

-- Reunion 17: Post-Mortem Analysis for Project 5 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (17, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Manager
  (17, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  (17, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (17, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (17, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16'));

-- Reunion 18: Quarterly Review for Project 6 (includes all 10 users assigned to Project 6)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Manager
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  (18, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17'));

-- Reunion 19: Innovation Brainstorm for Project 7 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId) 
VALUES
  (19, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Manager
  (19, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  (19, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (19, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (19, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12'));

-- Reunion 20: Celebration Event for Project 8 (exclusive, minimum 5 participants)
INSERT INTO ReunionParticipants (ReunionId, EmployeeId)
VALUES
  (20, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Manager
  (20, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  (20, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  (20, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  (20, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15'));

-- Insert synthetic data for Pointages table
-- Simulating attendance for 25 users over the next week (7 days)

-- User 1
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  ('2025-01-01 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-01 12:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-01 13:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-01 17:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving
  ('2025-01-02 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-02 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-02 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-02 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving
  ('2025-01-03 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-03 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-03 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-03 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving
  ('2025-01-04 08:45', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-04 12:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-04 13:45', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-04 17:45', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving
  ('2025-01-05 09:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-05 13:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-05 14:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-05 18:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving
  ('2025-01-06 09:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-06 13:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-06 14:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-06 18:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Leaving
  ('2025-01-07 09:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Entry
  ('2025-01-07 13:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Pause
  ('2025-01-07 14:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')), -- Resume
  ('2025-01-07 18:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')); -- Leaving

-- User 2
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  ('2025-01-01 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-01 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-01 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-01 17:05', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving
  ('2025-01-02 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-02 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-02 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-02 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving
  ('2025-01-03 08:35', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-03 12:35', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-03 13:35', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-03 17:35', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving
  ('2025-01-04 08:50', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-04 12:50', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-04 13:50', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-04 17:50', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving
  ('2025-01-05 09:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-05 13:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-05 14:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-05 18:05', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving
  ('2025-01-06 09:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-06 13:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-06 14:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-06 18:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Leaving
  ('2025-01-07 09:35', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Entry
  ('2025-01-07 13:35', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Pause
  ('2025-01-07 14:35', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')), -- Resume
  ('2025-01-07 18:35', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')); -- Leaving

-- Repeat the above pattern for users 3 to 25, adjusting the timestamps slightly for each user
-- For brevity, I'll show the pattern for User 3 and User 4, and you can extend it to all 25 users.

-- User 3
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  ('2025-01-01 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-01 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-01 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-01 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving
  ('2025-01-02 08:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-02 12:25', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-02 13:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-02 17:25', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving
  ('2025-01-03 08:40', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-03 12:40', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-03 13:40', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-03 17:40', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving
  ('2025-01-04 08:55', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-04 12:55', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-04 13:55', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-04 17:55', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving
  ('2025-01-05 09:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-05 13:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-05 14:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-05 18:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving
  ('2025-01-06 09:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-06 13:25', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-06 14:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-06 18:25', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Leaving
  ('2025-01-07 09:40', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Entry
  ('2025-01-07 13:40', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Pause
  ('2025-01-07 14:40', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')), -- Resume
  ('2025-01-07 18:40', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')); -- Leaving

-- User 4
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  ('2025-01-01 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-01 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-01 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-01 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Leaving
  ('2025-01-02 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-02 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-02 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-02 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Leaving
  ('2025-01-03 08:45', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-03 12:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-03 13:45', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-03 17:45', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Leaving
  ('2025-01-04 09:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-04 13:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-04 14:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-04 18:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Leaving
  ('2025-01-05 09:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-05 13:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-05 14:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-05 18:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Leaving
  ('2025-01-06 09:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-06 13:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-06 14:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-06 18:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Leaving
  ('2025-01-07 09:45', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Entry
  ('2025-01-07 13:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Pause
  ('2025-01-07 14:45', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')), -- Resume
  ('2025-01-07 18:45', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')); -- Leaving
  
-- user 5
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-03 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),

  -- Tuesday (2025-02-04) - Leaves early
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-04 16:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Leaves early

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-05 11:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- First pause
  ('2025-02-05 11:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Resume work
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Lunch break
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-05 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),

  -- Thursday (2025-02-06) - Leaves early and takes an extra pause
  ('2025-02-06 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-06 10:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Morning pause
  ('2025-02-06 10:45', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Resume work
  ('2025-02-06 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Lunch break
  ('2025-02-06 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-06 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5'));

-- user 6
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),

  -- Tuesday (2025-02-04) - Takes 2 pauses
  ('2025-02-04 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-04 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Morning pause
  ('2025-02-04 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Resume work
  ('2025-02-04 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Lunch break
  ('2025-02-04 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-04 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Leaves early

  -- Thursday (2025-02-06) - Normal day
  ('2025-02-06 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-06 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-06 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-06 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),

  -- Friday (2025-02-07) - Takes 2 pauses and leaves early
  ('2025-02-07 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-07 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Morning pause
  ('2025-02-07 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Resume work
  ('2025-02-07 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')), -- Lunch break
  ('2025-02-07 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
  ('2025-02-07 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')); -- Leaves early

-- user 7
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),

  -- Tuesday (2025-02-04) - Takes 2 pauses
  ('2025-02-04 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-04 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Morning pause
  ('2025-02-04 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Resume work
  ('2025-02-04 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Lunch break
  ('2025-02-04 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-04 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Leaves early

  -- Thursday (2025-02-06) - Normal day
  ('2025-02-06 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-06 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-06 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-06 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),

  -- Friday (2025-02-07) - Takes 2 pauses and leaves early
  ('2025-02-07 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-07 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Morning pause
  ('2025-02-07 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Resume work
  ('2025-02-07 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')), -- Lunch break
  ('2025-02-07 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
  ('2025-02-07 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')); -- Leaves early

-- user 8
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),

  -- Tuesday (2025-02-04) - Takes 2 pauses
  ('2025-02-04 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-04 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Morning pause
  ('2025-02-04 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Resume work
  ('2025-02-04 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Lunch break
  ('2025-02-04 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-04 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Leaves early

  -- Thursday (2025-02-06) - Normal day
  ('2025-02-06 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-06 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-06 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-06 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),

  -- Friday (2025-02-07) - Takes 2 pauses and leaves early
  ('2025-02-07 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-07 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Morning pause
  ('2025-02-07 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Resume work
  ('2025-02-07 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')), -- Lunch break
  ('2025-02-07 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
  ('2025-02-07 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')); -- Leaves early
-- user 9
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-03 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Morning pause
  ('2025-02-03 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Resume work
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Lunch break
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-05 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Morning pause
  ('2025-02-05 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Resume work
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Lunch break
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-05 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),

  -- Thursday (2025-02-06) - Leaves early
  ('2025-02-06 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-06 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-06 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-06 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9'));

-- user 10
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Leaves early
  ('2025-02-03 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-03 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-03 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-03 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Leaves early

  -- Tuesday (2025-02-04) - Takes 2 pauses and leaves early
  ('2025-02-04 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-04 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Morning pause
  ('2025-02-04 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Resume work
  ('2025-02-04 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Lunch break
  ('2025-02-04 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-04 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Leaves early

  -- Wednesday (2025-02-05) - Normal day
  ('2025-02-05 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-05 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-05 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-05 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),

  -- Thursday (2025-02-06) - Takes 2 pauses
  ('2025-02-06 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-06 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Morning pause
  ('2025-02-06 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Resume work
  ('2025-02-06 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Lunch break
  ('2025-02-06 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-06 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- user 11
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-03 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Morning pause
  ('2025-02-03 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Resume work
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Lunch break
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Leaves early

  -- Thursday (2025-02-06) - Takes 2 pauses
  ('2025-02-06 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-06 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Morning pause
  ('2025-02-06 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Resume work
  ('2025-02-06 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Lunch break
  ('2025-02-06 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-06 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11'));

-- user 12
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Leaves early
  ('2025-02-03 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-03 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-03 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-03 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),

  -- Wednesday (2025-02-05) - Takes 2 pauses and leaves early
  ('2025-02-05 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-05 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Morning pause
  ('2025-02-05 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Resume work
  ('2025-02-05 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Lunch break
  ('2025-02-05 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-05 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Leaves early

  -- Thursday (2025-02-06) - Takes 2 pauses
  ('2025-02-06 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-06 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Morning pause
  ('2025-02-06 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Resume work
  ('2025-02-06 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Lunch break
  ('2025-02-06 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-06 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12'));

-- user 13
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),

  -- Tuesday (2025-02-04) - Takes 2 pauses and leaves early
  ('2025-02-04 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-04 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Morning pause
  ('2025-02-04 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Resume work
  ('2025-02-04 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Lunch break
  ('2025-02-04 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-04 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Leaves early

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Leaves early

  -- Thursday (2025-02-06) - Normal day
  ('2025-02-06 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-06 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-06 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-06 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),

  -- Friday (2025-02-07) - Takes 2 pauses
  ('2025-02-07 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-07 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Morning pause
  ('2025-02-07 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Resume work
  ('2025-02-07 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Lunch break
  ('2025-02-07 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
  ('2025-02-07 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13'));

-- user 14
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-03 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Morning pause
  ('2025-02-03 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Resume work
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Lunch break
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-05 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Morning pause
  ('2025-02-05 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Resume work
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Lunch break
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-05 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),

  -- Thursday (2025-02-06) - Leaves early
  ('2025-02-06 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-06 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-06 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-06 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14'));

-- user 15
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-03 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Morning pause
  ('2025-02-03 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Resume work
  ('2025-02-03 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Lunch break
  ('2025-02-03 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Leaves early

  -- Thursday (2025-02-06) - Takes 2 pauses
  ('2025-02-06 08:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-06 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Morning pause
  ('2025-02-06 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Resume work
  ('2025-02-06 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')), -- Lunch break
  ('2025-02-06 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-06 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15'));

-- user 16
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),

  -- Tuesday (2025-02-04) - Takes 2 pauses and leaves early
  ('2025-02-04 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-04 10:45', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Morning pause
  ('2025-02-04 11:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Resume work
  ('2025-02-04 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Lunch break
  ('2025-02-04 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-04 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Leaves early

  -- Wednesday (2025-02-05) - Normal day
  ('2025-02-05 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-05 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),

  -- Thursday (2025-02-06) - Takes 2 pauses
  ('2025-02-06 08:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-06 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Morning pause
  ('2025-02-06 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Resume work
  ('2025-02-06 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')), -- Lunch break
  ('2025-02-06 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-06 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),

  -- Friday (2025-02-07) - Leaves early
  ('2025-02-07 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-07 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-07 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
  ('2025-02-07 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')); -- Leaves early

-- user 17
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),

  -- Tuesday (2025-02-04) - Takes 2 pauses
  ('2025-02-04 08:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-04 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Morning pause
  ('2025-02-04 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Resume work
  ('2025-02-04 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Lunch break
  ('2025-02-04 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-04 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Leaves early

  -- Thursday (2025-02-06) - Takes 2 pauses and leaves early
  ('2025-02-06 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-06 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Morning pause
  ('2025-02-06 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Resume work
  ('2025-02-06 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Lunch break
  ('2025-02-06 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-06 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17'));

-- user 18
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-03 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Morning pause
  ('2025-02-03 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Resume work
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Lunch break
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-04 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-04 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-04 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-05 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Morning pause
  ('2025-02-05 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Resume work
  ('2025-02-05 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Lunch break
  ('2025-02-05 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-05 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),

  -- Thursday (2025-02-06) - Leaves early
  ('2025-02-06 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-06 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-06 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-06 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Leaves early

  -- Friday (2025-02-07) - Takes 2 pauses and leaves early
  ('2025-02-07 08:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-07 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Morning pause
  ('2025-02-07 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Resume work
  ('2025-02-07 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Lunch break
  ('2025-02-07 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
  ('2025-02-07 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')); -- Leaves early

-- user 19
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Leaves early
  ('2025-02-03 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-03 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-05 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Morning pause
  ('2025-02-05 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Resume work
  ('2025-02-05 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Lunch break
  ('2025-02-05 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-05 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),

  -- Thursday (2025-02-06) - Takes 2 pauses and leaves early
  ('2025-02-06 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-06 10:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Morning pause
  ('2025-02-06 10:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Resume work
  ('2025-02-06 12:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Lunch break
  ('2025-02-06 13:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-06 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-07 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-07 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
  ('2025-02-07 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19'));

-- user 20
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-03 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-03 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-03 17:05', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),

  -- Tuesday (2025-02-04) - Leaves early
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-04 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Leaves early

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-05 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Morning pause
  ('2025-02-05 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Resume work
  ('2025-02-05 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Lunch break
  ('2025-02-05 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-05 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),

  -- Thursday (2025-02-06) - Takes 2 pauses and leaves early
  ('2025-02-06 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-06 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Morning pause
  ('2025-02-06 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Resume work
  ('2025-02-06 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Lunch break
  ('2025-02-06 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-06 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-07 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-07 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
  ('2025-02-07 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20'));

-- user 21
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-03 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Morning pause
  ('2025-02-03 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Resume work
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Lunch break
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-04 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-04 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-04 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-05 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-05 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Leaves early

  -- Thursday (2025-02-06) - Takes 2 pauses
  ('2025-02-06 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-06 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Morning pause
  ('2025-02-06 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Resume work
  ('2025-02-06 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Lunch break
  ('2025-02-06 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-06 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),

  -- Friday (2025-02-07) - Takes 2 pauses and leaves early
  ('2025-02-07 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-07 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Morning pause
  ('2025-02-07 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Resume work
  ('2025-02-07 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Lunch break
  ('2025-02-07 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
  ('2025-02-07 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')); -- Leaves early

-- user 22
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-03 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-03 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-03 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),

  -- Tuesday (2025-02-04) - Takes 2 pauses
  ('2025-02-04 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-04 10:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Morning pause
  ('2025-02-04 10:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Resume work
  ('2025-02-04 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Lunch break
  ('2025-02-04 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-04 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-05 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-05 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-05 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Leaves early

  -- Thursday (2025-02-06) - Normal day
  ('2025-02-06 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-06 12:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-06 13:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-06 17:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),

  -- Friday (2025-02-07) - Takes 2 pauses
  ('2025-02-07 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-07 10:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Morning pause
  ('2025-02-07 10:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Resume work
  ('2025-02-07 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')), -- Lunch break
  ('2025-02-07 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
  ('2025-02-07 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22'));

-- user 23
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-03 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Morning pause
  ('2025-02-03 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Resume work
  ('2025-02-03 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Lunch break
  ('2025-02-03 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-03 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-04 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-04 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-04 17:15', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),

  -- Wednesday (2025-02-05) - Leaves early
  ('2025-02-05 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-05 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Leaves early

  -- Thursday (2025-02-06) - Takes 2 pauses and leaves early
  ('2025-02-06 08:30', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-06 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Morning pause
  ('2025-02-06 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Resume work
  ('2025-02-06 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Lunch break
  ('2025-02-06 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-06 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-07 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-07 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
  ('2025-02-07 17:10', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23'));

-- user 24
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Normal day
  ('2025-02-03 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-03 12:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-03 13:05', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-03 17:05', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),

  -- Tuesday (2025-02-04) - Takes 2 pauses
  ('2025-02-04 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-04 10:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Morning pause
  ('2025-02-04 10:35', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Resume work
  ('2025-02-04 12:30', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Lunch break
  ('2025-02-04 13:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-04 17:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:25', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-05 10:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Morning pause
  ('2025-02-05 10:30', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Resume work
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Lunch break
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-05 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),

  -- Thursday (2025-02-06) - Leaves early
  ('2025-02-06 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-06 12:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-06 13:10', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-06 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Leaves early

  -- Friday (2025-02-07) - Takes 2 pauses
  ('2025-02-07 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-07 10:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Morning pause
  ('2025-02-07 10:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Resume work
  ('2025-02-07 12:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')), -- Lunch break
  ('2025-02-07 13:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
  ('2025-02-07 17:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24'));

-- user 25
INSERT INTO Pointages (Date, TransactionType, EmployeeId)
VALUES
  -- Monday (2025-02-03) - Takes 2 pauses and leaves early
  ('2025-02-03 08:10', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-03 10:10', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Morning pause
  ('2025-02-03 10:25', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Resume work
  ('2025-02-03 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Lunch break
  ('2025-02-03 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-03 15:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Leaves early

  -- Tuesday (2025-02-04) - Normal day
  ('2025-02-04 08:00', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-04 12:00', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-04 13:00', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-04 17:00', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),

  -- Wednesday (2025-02-05) - Takes 2 pauses
  ('2025-02-05 08:05', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-05 10:05', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Morning pause
  ('2025-02-05 10:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Resume work
  ('2025-02-05 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Lunch break
  ('2025-02-05 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-05 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),

  -- Thursday (2025-02-06) - Leaves early
  ('2025-02-06 08:15', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-06 12:15', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-06 13:15', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-06 15:30', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')), -- Leaves early

  -- Friday (2025-02-07) - Normal day
  ('2025-02-07 08:20', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-07 12:20', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-07 13:20', 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
  ('2025-02-07 17:20', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25'));

-- Insert synthetic data for Conge (Leave) table
INSERT INTO Conges (DateDebut, DateFin, Objet, Status, EmployeeId)
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
  ('2025-06-10', '2025-06-14', 'Vacation', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')), -- Rejected leave for user10

  -- Additional leave records for users
  ('2025-02-01', '2025-02-03', 'Medical Leave', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')), -- Accepted medical leave
  ('2025-02-12', '2025-02-14', 'Family Emergency', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')), -- Rejected family emergency leave
  ('2025-03-01', '2025-03-07', 'Study Leave', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')), -- Pending study leave
  ('2025-04-01', '2025-04-04', 'Vacation', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')), -- Accepted vacation leave
  ('2025-06-05', '2025-06-10', 'Sick Leave', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')), -- Pending sick leave
  ('2025-06-10', '2025-06-15', 'Vacation', -1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')), -- Rejected vacation leave
  ('2025-06-20', '2025-06-25', 'Family Emergency', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')), -- Accepted family emergency leave
  ('2025-07-01', '2025-07-05', 'Vacation', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')), -- Accepted vacation leave

  -- More leaves for users
  ('2025-07-10', '2025-07-14', 'Vacation', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')), -- Accepted vacation leave
  ('2025-08-10', '2025-08-12', 'Medical Leave', 0, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')), -- Pending medical leave
  ('2025-09-01', '2025-09-05', 'Personal Leave', 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')); -- Accepted personal leave

-- Insert synthetic data for Feedback table without dates (50 records)
INSERT INTO Feedbacks (Subject, Message, Rating)
VALUES
  -- Positive Feedback
  ('Performance Review', 'The employee performed exceptionally well this month.', 1),
  ('Work Quality', 'The quality of the work delivered was above expectations.', 1),
  ('Customer Service', 'The customer service team provided great support during the issue.', 1),
  ('Leadership', 'The leadership displayed exceptional guidance and decision-making.', 1),
  ('Communication', 'Clear and concise communication was maintained throughout the project.', 1),
  ('Initiative', 'The employee took great initiative in driving the project forward.', 1),
  ('Problem-Solving', 'The employee demonstrated excellent problem-solving skills during the crisis.', 1),
  ('Teamwork', 'Collaboration was exceptional, and the team worked well together.', 1),
  ('Creativity', 'The ideas presented were highly innovative and unique.', 1),
  ('Customer Satisfaction', 'The feedback from customers has been overwhelmingly positive.', 1),

  -- Negative Feedback
  ('Deadlines', 'The deadlines were missed repeatedly, which caused delays.', 0),
  ('Teamwork', 'There was some communication breakdown within the team.', 0),
  ('Work Quality', 'The quality of the work delivered did not meet expectations.', 0),
  ('Efficiency', 'The team’s efficiency could be improved with better tools and communication.', 0),
  ('Collaboration', 'Collaboration was poor, and team members struggled to work together.', 0),
  ('Attendance', 'Frequent tardiness impacted team productivity.', 0),
  ('Work Environment', 'The work environment needs improvement to foster better collaboration.', 0),
  ('Morale', 'The team morale seems low, and the atmosphere has been tense.', 0),
  ('Customer Interaction', 'Customer complaints were not handled properly.', 0),
  ('Decision-Making', 'Decision-making was delayed, causing unnecessary bottlenecks.', 0),

  -- Mixed Feedback
  ('Performance Review', 'The employee performed well overall, but there are areas for improvement.', 0),
  ('Team Dynamics', 'Team dynamics were strong in most areas, but there was some conflict.', 1),
  ('Workload', 'The workload was manageable, but some tasks were not completed on time.', 0),
  ('Leadership', 'Leadership was effective in most areas but lacked clarity in certain decisions.', 0),
  ('Customer Feedback', 'Customers had mixed reviews, some praised the service, while others had complaints.', 0),
  ('Deadlines', 'Deadlines were met, but there was unnecessary pressure on team members.', 0),
  ('Innovation', 'The team brought in some great ideas, but some of them were not executed well.', 1),
  ('Communication', 'There was great communication, but occasionally information was missed.', 1),
  ('Team Collaboration', 'Collaboration was good, though a few people struggled to engage.', 1),
  ('Customer Satisfaction', 'Most customers were satisfied, but there were isolated issues.', 1),

  -- Positive Feedback
  ('Problem-Solving', 'The employee handled unexpected challenges with great skill.', 1),
  ('Work Ethic', 'The employee showed great dedication and commitment to their work.', 1),
  ('Team Morale', 'The team morale has improved significantly over the past month.', 1),
  ('Creativity', 'The employee demonstrated great creativity in solving complex problems.', 1),
  ('Customer Service', 'The customer service provided was exceptional, going above and beyond expectations.', 1),
  ('Efficiency', 'The employee’s efficiency has greatly improved, leading to faster project completion.', 1),
  ('Innovation', 'The new approach introduced by the team proved to be highly successful.', 1),
  ('Leadership', 'Leadership was proactive and decisive, leading the team effectively.', 1),
  ('Problem-Solving', 'The employee exhibited exceptional problem-solving skills during a crisis.', 1),
  ('Work Quality', 'The quality of work exceeded expectations, with attention to detail.', 1),

  -- Negative Feedback
  ('Workload', 'The employee struggled to handle the workload, leading to missed deadlines.', 0),
  ('Deadlines', 'Deadlines were missed, and there was a lack of follow-through on deliverables.', 0),
  ('Team Morale', 'Team morale has dipped significantly, affecting productivity.', 0),
  ('Communication', 'There was confusion due to unclear communication on several tasks.', 0),
  ('Customer Service', 'Customer support failed to meet expectations, leading to negative feedback.', 0),
  ('Collaboration', 'The collaboration was minimal, and team members worked in silos.', 0),
  ('Work Environment', 'The work environment has not improved, and it affects team performance.', 0),
  ('Decision-Making', 'Decision-making was slow, which impacted the project timeline.', 0),
  ('Innovation', 'There was a lack of innovative solutions, leading to stagnation.', 0),
  ('Leadership', 'Leadership failed to address team concerns, resulting in frustration.', 0),

  -- Mixed Feedback
  ('Efficiency', 'Efficiency has been good, but some bottlenecks need addressing.', 0),
  ('Collaboration', 'Collaboration has improved, but there are still issues with engagement from some members.', 1),
  ('Team Performance', 'Team performance has varied, with some members excelling while others struggled.', 0),
  ('Customer Interaction', 'The customer interaction was mostly positive, but there were some communication gaps.', 1),
  ('Work Environment', 'The work environment has improved, but there are still areas for development.', 1),
  ('Leadership', 'Leadership showed strength in some areas, but could improve in communication.', 0),
  ('Workload', 'The workload was manageable, but could have been distributed more evenly.', 0),
  ('Problem-Solving', 'The employee showed solid problem-solving skills, but missed a few key details.', 1),
  ('Work Quality', 'Work quality was inconsistent, with some tasks completed well, and others poorly.', 0),
  ('Teamwork', 'There was strong teamwork, but a few members struggled to engage fully.', 1);

-- Insert 10 tasks for Project 1
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Design UI', 'Create the UI/UX for the dashboard', 0, 3, '2024-02-01', '2024-02-10', 10, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
('Database Schema', 'Define the database tables and relationships', 1, 5, '2024-01-25', '2024-02-02', 8, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
('Backend API', 'Develop the backend endpoints', -1, 4, '2024-02-05', '2024-02-15', 10, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
('Testing Suite', 'Create unit and integration tests', 0, 4, '2024-02-07', '2024-02-14', 7, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
('User Authentication', 'Implement login and registration', 1, 5, '2024-02-03', '2024-02-06', 3, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
('Dashboard Analytics', 'Implement charts for analytics', -1, 3, '2024-02-08', '2024-02-12', 4, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
('Email Notifications', 'Configure email alerts and reports', 0, 2, '2024-02-09', '2024-02-13', 4, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
('Mobile Responsiveness', 'Ensure the UI is mobile-friendly', 1, 3, '2024-02-05', '2024-02-09', 4, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
('Data Backup Strategy', 'Develop automatic database backups', -1, 4, '2024-02-11', '2024-02-16', 5, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
('Security Hardening', 'Implement security best practices', 0, 5, '2024-02-13', '2024-02-18', 5, 1, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Insert 10 tasks for Project 2
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Frontend Integration', 'Connect UI with backend services', 0, 4, '2024-02-10', '2024-02-18', 8, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
('Authentication Module', 'Implement JWT authentication', 1, 5, '2024-02-02', '2024-02-08', 6, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
('Performance Optimization', 'Optimize database queries and API calls', -1, 3, '2024-02-12', '2024-02-20', 8, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
('Logging System', 'Set up error logging and monitoring', 0, 4, '2024-02-05', '2024-02-10', 5, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
('Data Migration', 'Migrate old data to the new system', 1, 5, '2024-02-06', '2024-02-12', 6, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
('Search Functionality', 'Implement search and filters', -1, 3, '2024-02-08', '2024-02-14', 6, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
('Role-Based Access', 'Configure user roles and permissions', 0, 2, '2024-02-07', '2024-02-11', 4, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
('API Documentation', 'Generate API docs using Swagger', 1, 3, '2024-02-09', '2024-02-13', 4, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
('Automated Reports', 'Create scheduled reports generation', -1, 4, '2024-02-11', '2024-02-15', 4, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
('Server Setup', 'Deploy app on a cloud server', 0, 5, '2024-02-14', '2024-02-20', 6, 2, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20'));

-- Insert 10 tasks for Project 3
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('User Dashboard', 'Create personalized dashboards', 0, 4, '2024-02-15', '2024-02-22', 7, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
('Multi-Language Support', 'Add localization and translations', 1, 5, '2024-02-10', '2024-02-16', 6, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
('Payment Gateway', 'Integrate Stripe for payments', -1, 3, '2024-02-08', '2024-02-14', 6, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
('Bug Fixing', 'Resolve known bugs before launch', 0, 4, '2024-02-12', '2024-02-18', 6, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
('AI Chatbot', 'Develop AI-driven chatbot', 1, 5, '2024-02-05', '2024-02-10', 5, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
('Feedback System', 'Create a user feedback collection module', -1, 3, '2024-02-07', '2024-02-13', 6, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
('Mobile App Sync', 'Sync web and mobile app data', 0, 2, '2024-02-09', '2024-02-14', 5, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
('Marketing Dashboard', 'Track marketing KPIs', 1, 3, '2024-02-06', '2024-02-10', 4, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
('API Security', 'Enhance security with OAuth', -1, 4, '2024-02-11', '2024-02-16', 5, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
('Continuous Deployment', 'Automate deployment pipelines', 0, 5, '2024-02-14', '2024-02-20', 6, 3, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5'));

-- Insert 8 tasks for Project 4
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Requirement Analysis', 'Gather and document requirements', 0, 4, '2024-02-01', '2024-02-05', 5, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
('Wireframing', 'Create wireframes for the application', 1, 3, '2024-02-03', '2024-02-07', 4, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
('Database Design', 'Model database schema', -1, 5, '2024-02-05', '2024-02-10', 6, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
('Middleware Setup', 'Set up authentication and logging', 0, 4, '2024-02-06', '2024-02-12', 6, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
('UX Enhancements', 'Improve user experience', 1, 3, '2024-02-08', '2024-02-14', 5, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
('API Rate Limiting', 'Implement rate limiting for APIs', -1, 4, '2024-02-10', '2024-02-15', 5, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
('Admin Dashboard', 'Develop admin functionalities', 0, 5, '2024-02-12', '2024-02-17', 6, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
('Security Audit', 'Conduct a security assessment', 1, 5, '2024-02-15', '2024-02-20', 5, 4, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13'));

-- Insert 8 tasks for Project 5
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Feature Roadmap', 'Plan new features', 0, 4, '2024-02-02', '2024-02-06', 4, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
('User Registration', 'Develop signup and verification', 1, 5, '2024-02-04', '2024-02-08', 4, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
('Data Encryption', 'Secure sensitive user data', -1, 4, '2024-02-06', '2024-02-11', 5, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
('Performance Benchmarking', 'Measure and optimize speed', 0, 3, '2024-02-07', '2024-02-13', 5, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
('Graphical Reports', 'Implement dynamic reporting', 1, 3, '2024-02-09', '2024-02-14', 5, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
('Real-Time Updates', 'Enable real-time data refresh', -1, 4, '2024-02-11', '2024-02-16', 5, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
('OAuth Integration', 'Integrate third-party logins', 0, 5, '2024-02-13', '2024-02-19', 6, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20')),
('CI/CD Pipeline', 'Automate deployment workflows', 1, 5, '2024-02-15', '2024-02-22', 6, 5, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21'));

-- Insert 8 tasks for Project 6
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Load Testing', 'Test system under heavy load', 0, 5, '2024-02-03', '2024-02-08', 6, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
('Dark Mode Support', 'Implement dark/light theme toggle', 1, 3, '2024-02-05', '2024-02-10', 5, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
('Payment Subscription', 'Handle recurring billing', -1, 5, '2024-02-07', '2024-02-12', 6, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
('SEO Optimization', 'Improve search engine ranking', 0, 3, '2024-02-08', '2024-02-14', 5, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
('AI Recommendation Engine', 'Suggest content based on behavior', 1, 4, '2024-02-10', '2024-02-15', 5, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
('Kubernetes Deployment', 'Deploy using Kubernetes', -1, 5, '2024-02-12', '2024-02-17', 6, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
('Push Notifications', 'Implement mobile/web notifications', 0, 3, '2024-02-14', '2024-02-19', 5, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
('Blockchain Integration', 'Implement smart contracts', 1, 5, '2024-02-16', '2024-02-21', 6, 6, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4'));

  -- Insert 5 tasks for Project 7
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Code Refactoring', 'Improve code structure and readability', 0, 3, '2024-02-05', '2024-02-10', 4, 7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
('Unit Testing', 'Write automated tests', 1, 4, '2024-02-07', '2024-02-12', 5, 7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
('Bug Fixing', 'Resolve reported issues', -1, 5, '2024-02-09', '2024-02-14', 6, 7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
('Database Optimization', 'Improve query performance', 0, 4, '2024-02-11', '2024-02-16', 5, 7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
('User Onboarding Flow', 'Enhance new user experience', 1, 3, '2024-02-13', '2024-02-18', 4, 7, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9'));

-- Insert 5 tasks for Project 8
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Backend Scaling', 'Optimize backend services for scalability', 0, 5, '2024-02-06', '2024-02-11', 6, 8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10')),
('AI Chatbot', 'Develop AI-based chatbot support', 1, 4, '2024-02-08', '2024-02-13', 5, 8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
('Frontend Performance', 'Optimize frontend assets for speed', -1, 3, '2024-02-10', '2024-02-15', 4, 8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
('Multi-language Support', 'Implement multi-language options', 0, 4, '2024-02-12', '2024-02-17', 5, 8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
('Security Patching', 'Fix security vulnerabilities', 1, 5, '2024-02-14', '2024-02-19', 6, 8, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14'));

-- Insert 5 tasks for Project 9
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('Cloud Migration', 'Migrate services to cloud infrastructure', 0, 5, '2024-02-07', '2024-02-12', 6, 9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
('Accessibility Testing', 'Ensure app meets accessibility standards', 1, 3, '2024-02-09', '2024-02-14', 4, 9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
('Log Monitoring', 'Set up real-time logging system', -1, 4, '2024-02-11', '2024-02-16', 5, 9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
('Dark Mode Feature', 'Enable dark mode in UI', 0, 3, '2024-02-13', '2024-02-18', 4, 9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
('Automated Backups', 'Set up automatic backups for data', 1, 5, '2024-02-15', '2024-02-20', 6, 9, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19'));

-- Insert 10 tasks for Project 10
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('API Development', 'Develop RESTful APIs for the app', 0, 4, '2024-02-06', '2024-02-11', 6, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
('Database Indexing', 'Optimize DB performance with indexing', 1, 5, '2024-02-07', '2024-02-12', 5, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
('Mobile UI Design', 'Improve mobile user interface', -1, 3, '2024-02-08', '2024-02-13', 4, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
('OAuth Integration', 'Implement OAuth for authentication', 0, 4, '2024-02-09', '2024-02-14', 5, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
('Bug Tracking', 'Identify and resolve software bugs', 1, 3, '2024-02-10', '2024-02-15', 4, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5')),
('AI Model Training', 'Train AI models for prediction', 0, 5, '2024-02-11', '2024-02-16', 6, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user6')),
('Load Testing', 'Analyze system performance under load', -1, 4, '2024-02-12', '2024-02-17', 5, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user7')),
('Dark Mode Enhancement', 'Improve dark mode visuals', 1, 3, '2024-02-13', '2024-02-18', 4, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user8')),
('Data Encryption', 'Ensure data security via encryption', 0, 5, '2024-02-14', '2024-02-19', 6, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user9')),
('Automated Reports', 'Set up automated reporting system', 1, 4, '2024-02-15', '2024-02-20', 5, 10, (SELECT Id FROM AspNetUsers WHERE UserName = 'user10'));

-- Insert 10 tasks for Project 11
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('DevOps Pipeline', 'Implement CI/CD pipeline', 0, 5, '2024-02-06', '2024-02-11', 6, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user11')),
('GraphQL API', 'Implement GraphQL endpoints', 1, 4, '2024-02-07', '2024-02-12', 5, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user12')),
('Server Migration', 'Move servers to new infrastructure', -1, 3, '2024-02-08', '2024-02-13', 4, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user13')),
('Security Audit', 'Conduct full security assessment', 0, 4, '2024-02-09', '2024-02-14', 5, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user14')),
('Voice Recognition', 'Integrate voice-based commands', 1, 3, '2024-02-10', '2024-02-15', 4, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user15')),
('Data Backup Automation', 'Automate backup processes', 0, 5, '2024-02-11', '2024-02-16', 6, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user16')),
('Customer Dashboard', 'Enhance analytics dashboard', -1, 4, '2024-02-12', '2024-02-17', 5, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user17')),
('Push Notifications', 'Implement push notifications', 1, 3, '2024-02-13', '2024-02-18', 4, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user18')),
('Automated Testing', 'Set up Cypress & Jest testing', 0, 5, '2024-02-14', '2024-02-19', 6, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user19')),
('User Surveys', 'Collect user feedback for improvements', 1, 4, '2024-02-15', '2024-02-20', 5, 11, (SELECT Id FROM AspNetUsers WHERE UserName = 'user20'));

-- Insert 10 tasks for Project 12
INSERT INTO Tasks (Title, Description, Status, Importance, DateDebut, DateFin, Expected_duree, ProjectId, EmployeeId)
VALUES 
('UI Overhaul', 'Redesign UI/UX for better usability', 0, 4, '2024-02-06', '2024-02-11', 6, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user21')),
('Blockchain Integration', 'Add blockchain-based authentication', 1, 5, '2024-02-07', '2024-02-12', 5, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user22')),
('Data Science Dashboard', 'Create analytics dashboard', -1, 3, '2024-02-08', '2024-02-13', 4, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user23')),
('User Role Management', 'Improve role-based access control', 0, 4, '2024-02-09', '2024-02-14', 5, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user24')),
('Feature Toggle System', 'Implement A/B testing toggles', 1, 3, '2024-02-10', '2024-02-15', 4, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user25')),
('Performance Benchmarking', 'Analyze app performance bottlenecks', 0, 5, '2024-02-11', '2024-02-16', 6, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user1')),
('Automated Data Sync', 'Sync data across services', -1, 4, '2024-02-12', '2024-02-17', 5, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user2')),
('Multi-Tenancy Support', 'Enable multiple client management', 1, 3, '2024-02-13', '2024-02-18', 4, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user3')),
('Bug Bounty Program', 'Launch bug bounty for security testing', 0, 5, '2024-02-14', '2024-02-19', 6, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user4')),
('Gamification Features', 'Add badges & rewards system', 1, 4, '2024-02-15', '2024-02-20', 5, 12, (SELECT Id FROM AspNetUsers WHERE UserName = 'user5'));
