<%-- 
    Document   : about
    Created on : Jan 19, 2025, 5:12:13 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us | Senior Care Connect</title>
  
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f1e8e3; /* Very light brown */
    }

    /* Header and navigation styles */
    header {
      background-color: #3e2723;
      color: white;
      padding: 20px;
      text-align: center;
    }

    nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #735445; /* Chocolate color */
            padding: 10px 20px;
        }
        .nav-links {
            display: flex;
            gap: 20px;
        }
        nav a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
        }
        nav a:hover {
            background-color: #6d4c41; /* Light chocolate color */
        }
        .login-buttons {
        display: flex;
        gap: 10px;
        }
        .login-btn {
            background-color: #3e2723; /* Chocolate color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
        }
        .login-btn:hover {
            background-color: #6d4c41; /* Light chocolate color */
        }

    .content {
      max-width: 1200px;
      margin: 40px auto;
      padding: 20px;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .about-box {
      padding: 20px;
      margin-bottom: 30px;
      border: 2px solid #8b6a59; /* Soft brown */
      border-radius: 8px;
      background-color: #f9f9f9;
    }

    .about-box h2 {
      color: #8b6a59; /* Soft brown */
    }

    .about-box p {
      color: #735445; /* Darker soft brown */
      line-height: 1.8;
    }

    .team-section {
      margin-top: 30px;
    }

    .team-member {
      display: inline-block;
      width: 30%;
      margin: 10px;
      padding: 10px;
      text-align: center;
      background-color: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .team-member img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
    }

    .team-member h4 {
      margin: 10px 0 5px;
      color: #8b6a59; /* Soft brown */
    }

    .team-member p {
      color: #735445; /* Darker soft brown */
      font-size: 14px;
    }
  </style>
</head>
<body>
  <!-- Header -->
  <header>
    <h1>Senior Care Connect</h1>
  </header>

  <!-- Navbar -->
  <nav>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="services.jsp">Services</a>
        <a href="location.jsp">Location</a>
    </div>
    <div class="login-buttons">
        <a href="employeeLogin.jsp" class="login-btn">Employee Login</a>
        <a href="login.jsp" class="login-btn">Patient Login</a>
    </div>
</nav>

  <!-- About Us Content -->
  <div class="content">
    <div class="about-box">
      <h2>About Us</h2>
      <p>
        At Senior Care Connect, we are dedicated to providing exceptional care and services for seniors. 
        Our mission is to create a supportive and nurturing environment where seniors can enjoy 
        a fulfilling and meaningful life. We pride ourselves on offering top-quality services, 
        compassionate care, and a wide range of activities tailored to meet the needs of our residents.
      </p>
      <p>
        Founded in 2020, our company has grown to become a trusted name in senior care. 
        With a team of experienced professionals and a passion for excellence, 
        we strive to make every day special for our residents.
      </p>
    </div>

    <!-- Team Section -->
    <div class="team-section">
      <h3>Meet Our Team</h3>
      <div class="team-member">
        <img src="image/adam.png" alt="Team Member 1">
        <h4>Adam Haqimi</h4>
        <p>Founder & CEO</p>
      </div>
      <div class="team-member">
        <img src="image/amir.png" alt="Team Member 2">
        <h4>Amir Firdaus</h4>
        <p>Head of Operations</p>
      </div>
      <div class="team-member">
        <img src="image/nisa.png" alt="Team Member 3">
        <h4>Khairunnisa</h4>
        <p>Care Coordinator</p>
      </div>
      <div class="team-member">
        <img src="image/azz.png" alt="Team Member 4">
        <h4>Azrena Ameera</h4>
        <p>Activities Manager</p>
      </div>
    </div>
  </div>
</body>
</html>


