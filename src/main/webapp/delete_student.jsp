<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.pritam.spring.studentdb.entity.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <style>
        
        @keyframes zoomIn {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        
        @keyframes evaporate {
            0% {
                opacity: 1;
                transform: translateX(0);
            }
            100% {
                opacity: 0;
                transform: translateX(100%);
            }
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2b95a1, #8894bb);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            width: 100%;
            animation: zoomIn 0.5s ease-in-out; /* Adding the zoom-in effect */
            position: relative;
            overflow: hidden;
        }

        .id-validation {
            text-align: left;
            margin-bottom: 10px;
        }

        .btn {
            background: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        .btn:hover {
            background: #e53935;
        }

        .btn-secondary {
            background: #307d7f;
            margin-top: 10px;
        }

        .btn-secondary:hover {
            background: #31a5a7;
        }

        input[type="number"] {
            padding: 10px;
            font-size: 1rem;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 10px;
        }

        .error, .success {
            font-size: 1rem;
            margin: 10px 0;
            font-weight: bold;
            text-align: center;
        }

        .error {
            color: #f44336;
        }

        .success {
            color: #00ff0a;
        }

        
        .evaporate {
            animation: evaporate 1s forwards; 
        }

        .evaporate span {
            display: inline-block;
            animation: evaporate 1s forwards;
            animation-delay: 0.1s; 
        }

        .evaporate span:nth-child(2) {
            animation-delay: 0.2s;
        }

        .evaporate span:nth-child(3) {
            animation-delay: 0.3s;
        }

        .evaporate span:nth-child(4) {
            animation-delay: 0.4s;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1 style="text-align: center;">Delete Student</h1>

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
            
            <form action="validate-student-for-delete" method="post">
                <label class="id-validation" for="studentId" style="text-align: left;">Enter Student ID:</label>
                <input type="number" id="studentId" name="studentId" required>
                <button style="width: 104%" type="submit" class="btn">Validate</button>
            </form>
        <% } else { %>
            
            <form id="delete-form" style="text-align: center;" action="delete-student" method="post">
                <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">

                <div class="student-data">
                    <p><strong>Name:</strong> <span id="name"><%= student.getStudentName() %></span></p>
                    <p><strong>Email:</strong> <span id="email"><%= student.getStudentEmail() %></span></p>
                    <p><strong>Age:</strong> <span id="age"><%= student.getStudentAge() %></span></p>
                    <p><strong>Marks:</strong> <span id="marks"><%= student.getStudentMarks() %></span></p>
                </div>

                <button type="submit" id="confirm-btn" class="btn">Confirm Deletion</button>
            </form>

            
            <form action="display-all-students" method="get">
                <button type="submit" class="btn btn-secondary">Go to Display Page</button>
            </form>

            <form action="index.jsp" method="get">
                <button type="submit" class="btn btn-secondary">Go to Home Page</button>
            </form>
        <% } %>
    </div>

    <script>
        
        document.getElementById("confirm-btn").addEventListener("click", function(event) {
            event.preventDefault(); 

            const studentData = document.querySelectorAll('.student-data span');
            
            
            studentData.forEach(function(element, index) {
                setTimeout(function() {
                    element.classList.add('evaporate');
                }, index * 100); 
            });

            
            setTimeout(function() {
                document.getElementById("delete-form").submit(); 
            }, 1000);
        });
    </script>
</body>
</html>
