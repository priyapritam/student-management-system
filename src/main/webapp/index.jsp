<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student DashBoard</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #2b95a1, #081e44);
        color: #fff;
        text-align: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    .header {
        position: fixed;
        top: 0;
        width: 100%;
        background: rgba(0, 0, 0, 0.12);
        padding: 10px 20px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 1rem;
        z-index: 1000;
    }
    
    .contact{
    	padding-left: 30px;
    }

    .header .contact {
        font-weight: bold;
    }

    .header .social-icons a {
        margin: 0 10px;
        color: white;
        text-decoration: none;
        font-size: 1.2rem;
        transition: transform 0.3s;
    }

    .header .social-icons a:hover {
        transform: scale(1.2);
    }

    h1 {
        font-size: 3rem;
        margin-top: 80px;
        animation: fadeInDown 1s ease-in-out;
    }

    h2 {
        font-size: 1.5rem;
        margin-top: 30px;
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

    button a {
        text-decoration: none;
        color: inherit;
    }

    button:hover {
        transform: scale(1.1);
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
    }

    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes slideInLeft {
        from {
            transform: translateX(-100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    @keyframes slideInRight {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    .btn-add {
        animation: slideInLeft 1s ease-in-out;
    }

    .btn-display {
        animation: slideInRight 1s ease-in-out;
    }

    footer {
        position: absolute;
        bottom: 10px;
        font-size: 0.9rem;
        font-weight: bold;
        font-style: italic;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
    }
</style>
</head>
<body>
    <div class="header">
        <div class="contact">priyapritam.pritam@gmail.com</div>
        <div class="social-icons">
            <a href="https://www.linkedin.com/in/priyapritam" target="_blank">LinkedIn</a>
            <a href="https://github.com/priyapritam" target="_blank">GitHub</a>
            <a href="https://www.facebook.com/priyapritam03" target="_blank">Facebook</a>
            <a href="https://x.com/PriyaPritam03" target="_blank">X</a>
        </div>
    </div>
    
    <h1>Welcome to Student Dashboard</h1>
    <h2>
        <button type="submit" class="btn-add"><a href="add_student.jsp">ADD</a></button>
        <button type="submit" class="btn-display"><a href="display-all-students">DISPLAY</a></button>
    </h2>
    
    <footer>
        &copy; <span style="color: #FFD700; font-weight: bold;">2025 Priya Pritam Behera</span> <br>
        <span style="color: #FFA07A; font-weight: bold;">All Rights Reserved</span> <br>
        <span style="color: #90EE90; font-weight: bold;">Designed with Passion</span>
    </footer>
</body>
</html>
