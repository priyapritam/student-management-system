<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jsp.pritam.spring.studentdb.entity.Student"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display All Students</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #2b95a1, #8894bb);
        color: #fff;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }

    h1 {
        font-size: 3rem;
        margin-bottom: 20px;
        text-align: center;
        animation: fadeIn 1s ease-out;
    }

    .table-container {
        width: 90%;
        max-width: 2000px;
        margin: 20px;
        padding: 20px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        position: relative;
        animation: tableFadeIn 1.5s ease-in-out;
    }

   
    .search-container {
        position: absolute;
        top: 20px;
        right: 20px;
    }

    .search-container input {
        padding: 8px;
        font-size: 1rem;
        border-radius: 5px;
        border: 1px solid #ddd;
        outline: none;
        width: 200px;
        transition: 0.3s;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
        margin-top: 40px;
        
    }

    th {
        text-align: center;
        background-color: #2b95a1;
        color: white;
        padding: 12px;
        font-size: 1.1rem;
    }

    td {
        padding: 12px;
        border: 1px solid #ddd;
        color: black;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.8);
        transition: background 0.3s ease-in-out, transform 0.3s ease;
    }

    td:hover {
        background-color: rgba(255, 255, 255, 0.5);
        transform: scale(1.02);
    }

    tr {
        transition: transform 0.3s ease-in-out;
    }

    tr:hover {
        background-color: #ddd;
        transform: scale(1.02);
    }

    
    .btn {
        display: inline-block;
        margin: 0 10px;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: bold;
        color: black;
        text-decoration: none;
        background: #ffffff;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .btn:hover {
        background: #f9ff96;
        transform: translateY(-3px);
        box-shadow: 2px 2px 15px rgba(0, 0, 0, 0.3);
    }

    .btn-danger {
        background: linear-gradient(135deg, #f44336, #e53935);
        color: white;
    }

    .btn-danger:hover {
        background: linear-gradient(135deg, #e53935, #f44336);
    }

    
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes tableFadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
             transform: translateY(0);
        }
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
</style>
</head>
<body>

    <h1>Student Details</h1>

    <div class="table-container">
        <!-- Search Bar -->
        <div class="search-container">
            <input type="text" id="searchInput" onkeyup="searchStudent()" placeholder="Search by ID...">
        </div>

        <table id="studentTable">
            <tr>
                <th>ID No.</th>
                <th>Name</th>
                <th>Email ID</th>
                <th>Age</th>
                <th>Marks</th>
                <th>Update</th>
        		<th>Delete</th>
            </tr>

            <% 
                // Fetch the student data from the database
                List<Student> students = (List) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
                    for (Student student : students) {
            %>
                        <tr>
                            <td><%= student.getStudentId() %></td>
                            <td><%= student.getStudentName() %></td>
                            <td><%= student.getStudentEmail() %></td>
                            <td><%= student.getStudentAge() %></td>
                            <td><%= student.getStudentMarks() %></td>
                        
                    <td style="text-align: center;">
                        <form action="validate-student" method="post">
                            <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                            <button type="submit" class="btn" style="background-color: #66d6dc;">Update</button>
                        </form>
                    </td>

                    
                    <td style="text-align: center;">
                        <form action="validate-student-for-delete" method="post">
                            <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No Students Found</td>
                    </tr>
            <% 
                }
            %>
        </table>
    </div>

    <div class="btn-container">
        <a href="index.jsp" class="btn">HOME</a>
    </div>

    <script>
        function searchStudent() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("studentTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows
            for (i = 1; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0]; // Get the first column (ID)
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "Not Found";
                    }
                }       
            }
        }
    </script>

</body>
</html>
