<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ADD-Student Details</title>
    <style>
    
        html, body {
            margin: 0;
            padding: 0;
            height: 120vh;
            overflow: auto;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2b95a1, #8894bb);
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            animation: slideIn 1s ease-out;
        }

        h3 {
            margin-bottom: 20px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 500px;
            animation: zoomIn 0.8s ease-out;
            text-align: left;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: auto;
        }

        label {
            font-weight: bold;
            display: block;
            text-align: left;
            margin-bottom: 8px;
        }

        input {
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 15px;
            border: none;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
        }

        .button-container {
            text-align: center;
            margin-top: 15px;
        }

        button {
            background: #ffffff;
            color: #2a5298;
            padding: 15px 30px;
        	border: none;
        	border-radius: 8px;
        	cursor: pointer;
       	 	font-size: 1rem;
        	font-weight: bold;
        	margin: 10px;
        	transition: transform 0.3s, box-shadow 0.3s;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        }

       
        .success-message {
            text-align: center;
            color: #00ff00;
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .error-message {
            text-align: center;
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes zoomIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <h1>Enter Student Details</h1>
    <h3>*Please Fill All The Details</h3>

    <div class="form-container">
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (successMessage != null && !successMessage.isEmpty()) {
        %>
            <div class="success-message">
                <%= successMessage %>
            </div>
        <%
            } else if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="error-message">
                <%= errorMessage %>
            </div>
        <%
            }
        %>

        <form action="add-students" method="POST">
            <label for="studentId">ID No.:</label>
            <input id="studentId" type="number" placeholder="Enter Student ID" name="studentId" required><br>
            
            <label for="studentName">Name:</label>
            <input id="studentName" type="text" placeholder="Enter Student Name" name="studentName" required><br>
            
            <label for="studentEmail">Email ID:</label>
            <input id="studentEmail" type="email" placeholder="Enter Student Email ID" name="studentEmail" required><br>
            
            <label for="studentAge">Age:</label>
            <input id="studentAge" type="number" placeholder="Enter Student Age" name="studentAge" required><br>
            
            <label for="studentMarks">Marks:</label>
            <input id="studentMarks" type="number" placeholder="Enter Student Marks" name="studentMarks" required><br>
            
            <div class="button-container">
                <button type="submit" value="SAVE">SAVE</button>
            </div>
        </form>
    </div>

    
    <div class="outside-buttons">
        <button type="button" class="secondary-btn" onclick="window.location.href='index.jsp'">HOME</button>
        <button type="button" class="secondary-btn" onclick="window.location.href='display-all-students'">DISPLAY</button>
    </div>
</body>
</html>
