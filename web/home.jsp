<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senior Care</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #735445; /* Cream background */
        }
        header {
            background-color: #3e2723; /* Chocolate color */
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
        .hero {
        position: relative; /* To position overlay and text correctly */
        background: url('image/home.jpg') no-repeat center center/cover;
        height: 500px;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
    }
        .hero-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Dark overlay with transparency */
        backdrop-filter: blur(4px); /* Blur effect */
        z-index: 1; /* Ensures overlay is below text */
    }
    .hero h1 {
        position: relative;
        z-index: 2; /* Ensures text is above overlay */
        font-size: 3.5em; /* Increased size for visibility */
        font-weight: bold;
        text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.8); /* Enhances text readability */
    }
        .section {
            padding: 50px;
            text-align: center;
        }
        .services, .testimonials {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .service, .testimonial {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            width: 250px;
            margin: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .service h3, .testimonial p {
            color: #3e2723; /* Chocolate color */
        }
        .service p, .testimonial strong {
            color: #6d4c41; /* Light chocolate color */
        }
        input[type="text"], input[type="email"], input[type="submit"] {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #6d4c41; /* Light chocolate color */
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
            background-color: #f5f5f1; /* Cream background */
            color: #3e2723; /* Chocolate color */
        }
        input[type="submit"] {
            background-color: #3e2723; /* Chocolate color */
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #6d4c41; /* Light chocolate color */
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to The SeniorCareConnect</h1>
    <p>We provide premium nursing care in an environment that feels like home</p>
</header>

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

<div class="hero">
    <div class="hero-overlay"></div> <!-- Added overlay -->
    <h1>The Right Choice for Your Loved Ones</h1>
</div>

<div class="section services">
    <div class="service">
        <h3>Assisted Living</h3>
        <p>Comprehensive care with support for daily living activities.</p>
    </div>
    <div class="service">
        <h3>Long Term Nursing Care</h3>
        <p>For individuals who need continuous medical attention.</p>
    </div>
    <div class="service">
        <h3>Dementia Care</h3>
        <p>Specialized care to support cognitive decline.</p>
    </div>
</div>

<div class="section testimonials">
    <div class="testimonial">
        <p>"The Senior Care is a wonderful place for my father. The staff are amazing, and the atmosphere feels like home!"</p>
        <strong>Family of Mr. Eu</strong>
    </div>
    <div class="testimonial">
        <p>"We were so happy with the care provided. It truly was a home away from home for our mother."</p>
        <strong>Ms. Tan</strong>
    </div>
</div>

<div class="section">
    <h2>Contact Us</h2>
    <p>For more information or inquiries, please reach out to us!</p>
    <form action="#">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name"><br>
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email"><br><br>
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
