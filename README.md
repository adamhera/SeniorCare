SeniorCare
SeniorCare is a healthcare management system designed for the elderly, built using Java EE and the MVC architectural pattern. The application aims to streamline patient care, medication tracking, and caregiver communication.

Architecture (MVC)
The project follows a strict Model-View-Controller design pattern to ensure scalability and separation of concerns:

Model: Handles data logic and communication with the Oracle Database (using JPA or JDBC).

View: The user interface built with JSP (JavaServer Pages) and CSS.

Controller: Java Servlets that manage the flow of data between the View and the Model.

ech Stack
Language: Java

Platform: Java EE (Enterprise Edition)

IDE: NetBeans

Database: Oracle Database

Pattern: Model-View-Controller (MVC)

Getting Started
Prerequisites
NetBeans IDE (version 8.2 or higher recommended)

JDK 8 or higher

Oracle Database (Express Edition or Enterprise)

GlassFish or Apache Tomcat (configured within NetBeans)

Installation & Setup
Database Configuration:

Open your Oracle SQL Developer or SQL*Plus.

Run the provided SQL scripts (found in /database folder) to create the necessary tables and sequences.

Update the web.xml or your database connection class with your Oracle credentials:

Plaintext

URL: jdbc:oracle:thin:@localhost:1521:xe
User: your_username
Password: your_password
Open Project in NetBeans:

Launch NetBeans.

Go to File > Open Project.

Select the SeniorCare folder.

Build and Run:

Right-click on the project in the left sidebar.

Select Clean and Build.

Right-click again and select Run.

NetBeans will deploy the application to your local server and open it in your default browser.
