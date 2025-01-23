<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.pritam.spring.studentdb.entity.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2b95a1, #8894bb);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            animation: fadeInBody 1s ease-in-out;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            max-width: 900px;
            width: 100%;
            animation: slideInContainer 1s ease-out;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            animation: fadeInHeader 1s ease-out;
        }

        .row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
            position: relative;
        }

        .column {
            flex: 1;
            min-width: 300px;
            padding: 10px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
        }

        .column h3 {
            text-align: center;
            margin-bottom: 10px;
            color: #ffeb3b;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        p, input {
            width: 100%;
            margin: 5px 0;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        input {
            background: #f4f4f4;
            color: #333;
            transition: all 0.3s ease;
        }

        input[readonly] {
            background: #ddd;
        }

        input:focus {
            outline: none;
            border: 2px solid #2b95a1;
            transform: scale(1.02);
        }

        .btn {
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 10px;
        }

        .btn:hover {
            background: #45a049;
        }

        .back-btn {
            background: #32457a;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 10px;
        }

        .back-btn:hover {
            background: #3259c1;
        }

        .error, .success {
            font-size: 1.15rem;
            margin: 10px 0;
            font-weight: bold;
        }

        .error {
            color: #f44336;
            text-align: center;
            font-weight: bold;
        }

        .success {
            color: #00ff0a;
            text-align: center;
            font-weight: bold;
        }

        
        @keyframes fadeInBody {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideInContainer {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInHeader {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideUpButton {
            from {
                bottom: -50px;
                opacity: 0;
            }
            to {
                bottom: 10px;
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Update Student Details</h1>

        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            String successMessage = (String) request.getAttribute("successMessage");
            Student student = (Student) request.getAttribute("student");
        %>

        <% if (errorMessage != null) { %>
            <p class="error"><%= errorMessage %></p>
        <% } %>
        <% if (successMessage != null) { %>
            <p class="success"><%= successMessage %></p>
        <% } %>

        <% if (student == null) { %>
            
            <form action="validate-student" method="post">
                <label for="studentId">Enter Student ID:</label>
                <input type="number" id="studentId" name="studentId" placeholder="Enter Student ID" required>
                <button type="submit" class="btn">Validate</button>
            </form>
        <% } else { %>
            
            <div class="row">
                <div class="column" style="animation: slideInRight 1s ease-out;">
                    <h3>Current Details</h3>
                    <p><strong>Student ID:</strong> <%= student.getStudentId() %></p>
                    <p><strong>Name:</strong> <%= student.getStudentName() %></p>
                    <p><strong>Email:</strong> <%= student.getStudentEmail() %></p>
                    <p><strong>Age:</strong> <%= student.getStudentAge() %></p>
                    <p><strong>Marks:</strong> <%= student.getStudentMarks() %></p>
                </div>

                
                <div class="column" style="animation: slideInLeft 1s ease-out;">
                    <h3>Update Details</h3>
                    <form action="update-student" method="post">
                        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">

                        <label for="studentName">Name:</label>
                        <input type="text" id="studentName" name="studentName" value="<%= student.getStudentName() %>" required>

                        <label for="studentEmail">Email:</label>
                        <input type="email" id="studentEmail" name="studentEmail" value="<%= student.getStudentEmail() %>" required>

                        <label for="studentAge">Age:</label>
                        <input type="number" id="studentAge" name="studentAge" value="<%= student.getStudentAge() %>" required>

                        <label for="studentMarks">Marks:</label>
                        <input type="number" id="studentMarks" name="studentMarks" value="<%= student.getStudentMarks() %>" required>

                        <button type="submit" class="btn">Update Student</button>
                    </form>
                </div>
            </div>

            <form action="display-all-students" method="get">
                <button type="submit" class="back-btn">Back to Display Page</button>
            </form>
        <% } %>
    </div>
</body>
</html>
