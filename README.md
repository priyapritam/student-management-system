# Student Management System

## 📌 Overview
The **Student Management System** is a web-based application designed to manage student records efficiently. It provides full CRUD (Create, Read, Update, Delete) functionality using **Spring MVC**, **Hibernate (JPA)**, and **MySQL**. The project follows the **MVC architecture**, ensuring a clean separation of concerns, modular design, and easy maintainability.


## 🚀 Features
- ✔ **Add Student** – Register new students with unique **ID, Name, Email, Age, and Marks**.
- ✔ **Display Students** – Retrieve and display all student records in a structured format.
- ✔ **Update Student** – Modify student details securely after validation.
- ✔ **Delete Student** – Remove a student entry from the database with confirmation.
- ✔ **Validation Mechanism** – Prevents duplicate student IDs and ensures data consistency.
- ✔ **User-Friendly Interface** – Provides clear success and error messages for smooth interaction.


## 🛠 Tech Stack
- **Backend**: Java, Spring MVC, Hibernate (JPA)  
- **Frontend**: JSP, HTML, CSS, JavaScript  
- **Database**: MySQL  
- **Build Tool**: Maven  
- **Server Deployment**: Apache Tomcat  

## 🎯 Project Structure
```plaintext
studentdb/
│── src/main/java/com/jsp/pritam/spring/studentdb
│   ├── config/          (Spring Configuration classes)
│   ├── controller/      (Handles HTTP requests and business logic mapping)
│   ├── entity/          (Defines Student entity model)
│   ├── repository/      (Handles database operations using Hibernate)
│   ├── service/         (Implements business logic and service layer)
│── src/main/webapp/
│   ├── WEB-INF/jsp/     (JSP pages for dynamic UI)
│   ├── css/             (Custom styles and animations)
│   ├── js/              (JavaScript for UI enhancements)
│── pom.xml              (Maven dependencies and configurations)
│── README.md            (Documentation)

```

## 🏗 Installation & Setup
### 🔹 Prerequisites
Ensure the following are installed on your system:

- ✅ Java 8+
- ✅ MySQL Database
- ✅ Apache Tomcat (or any compatible servlet container)
- ✅ Maven (for dependency management & build automation)

### 🔹 Steps to Run the Project
**1️⃣ Clone the repository:**

```
git clone https://github.com/yourusername/student-management-system.git
cd student-management-system
```

**2️⃣ Configure MySQL Database:**

Open ``persistence.xml`` and update database connection details:

```
<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/studentdb"/>
<property name="javax.persistence.jdbc.user" value="root"/>
<property name="javax.persistence.jdbc.password" value="yourpassword"/>
```

**3️⃣ Build the project using Maven:**
```
mvn clean install
```

**4️⃣ Deploy on Apache Tomcat:**

Copy the generated **WAR file** from the ``target/`` folder and deploy it in the ``webapps/`` directory of Tomcat.

**5️⃣ Run the application in your browser:**
```
http://localhost:8080/studentdb/
```

## 📜 API Endpoints

| HTTP Method | Endpoint                      | Description                           |
|-------------|-------------------------------|---------------------------------------|
| POST        | `/add-students`               | Adds a new student to the system      |
| GET         | `/display-all-students`       | Retrieves and displays all students   |
| POST        | `/validate-student`           | Validates student ID before updating  |
| POST        | `/update-student`             | Updates student details               |
| POST        | `/validate-student-for-delete`| Validates student ID before deletion  |
| POST        | `/delete-student`             | Deletes a student from the database   |

## 🎨 UI & UX Enhancements

- ✨ **Dynamic Visuals**: Enhanced interface with visually engaging transitions for a polished user experience.  
- ✅ **Intuitive Feedback**: Clear and concise success/error messages ensure seamless interaction.  
- 📱 **Responsive Design**: Optimized for an exceptional experience across all devices, from desktops to smartphones.


## 📷 Screenshots

**Home Page:**

![Home Page](https://github.com/user-attachments/assets/d241eb53-c12f-4b21-9561-813103399e92) 

**Add Student Page:**

![Add Student Page](https://github.com/user-attachments/assets/6d0f65e4-7dd2-4778-a542-4dca69ef0174) 

**Display Students Page:**

![Display Students Page](https://github.com/user-attachments/assets/2866a66b-e54c-4dfb-b488-d1999cec15ed) 

**Display Students Searching By Id Page:**

![Display Students Searching By Id Page](https://github.com/user-attachments/assets/de265f14-b9bc-4a92-ac87-c602fcfe33b3) 

**Update Student Page:**

![Update Student Page](https://github.com/user-attachments/assets/b999c7a0-d1be-441f-ba77-1eb5434ccbd0) 

**Delete Student Page:**

![Delete Student Page](https://github.com/user-attachments/assets/da4b28c8-8071-404a-a6d4-9176aff75c4e) 


## 🎥 Demo Video

> Click To Watch The Video!  
[![Demo Video](https://github.com/user-attachments/assets/d241eb53-c12f-4b21-9561-813103399e92)](https://youtu.be/AgiMvcyfVWE)

## 🤝 Contribution Guidelines
🚀 Contributions are welcome! If you’d like to enhance this project:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-branch`
3. Make improvements and commit changes.
4. Push to your forked repository and submit a Pull Request.

## 🌟 Connect with Me

- 🔹 **GitHub**: [Priya Pritam](https://github.com/priyapritam)  
- 🔹 **LinkedIn**: [Priya Pritam](https://www.linkedin.com/in/priyapritam) 
