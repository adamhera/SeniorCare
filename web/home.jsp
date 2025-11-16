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
            color: #3e2723;
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
            position: relative;
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
            z-index: 1;
        }
        .hero h1 {
            position: relative;
            z-index: 2;
            font-size: 3.5em;
            font-weight: bold;
            text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.8);
        }
        .section {
            padding: 50px 20px;
            text-align: center;
        }
        .section h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #3e2723;
        }
        .cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            width: 300px;
            padding: 20px;
            text-align: left;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: #6d4c41;
        }
        .card p {
            font-size: 1em;
            line-height: 1.6;
            color: #5d4037;
        }
        .testimonial {
            text-align: center;
        }
        .testimonial strong {
            display: block;
            margin-top: 10px;
            font-size: 1.1em;
            color: #3e2723;
        }
        /* Responsive design */
        @media (max-width: 768px) {
            .card {
                width: 90%;
            }
        }
        
        .contact-us {
        background-color: #fff;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: 0 auto;
        text-align: left;
    }
    .contact-us h2 {
        color: #3e2723;
        margin-bottom: 20px;
    }
    .contact-us p {
        color: #5d4037;
        margin-bottom: 30px;
        font-size: 1.1em;
        text-align: center;
    }
    .contact-form label {
        display: block;
        margin-bottom: 5px;
        color: #6d4c41;
        font-weight: bold;
    }
    .contact-form input,
    .contact-form textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
        background-color: #f9f9f9;
    }
    .contact-form input:focus,
    .contact-form textarea:focus {
        border-color: #6d4c41;
        outline: none;
        box-shadow: 0 0 5px rgba(109, 76, 65, 0.5);
    }
    .contact-form button {
        background-color: #3e2723;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s;
    }
    .contact-form button:hover {
        background-color: #6d4c41;
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
    <div class="hero-overlay"></div>
    <h1>The Right Choice for Your Loved Ones</h1>
</div>

<div class="section services">
    <h2>Our Services</h2>
    <div class="cards">
        <div class="card">
            <h3>Assisted Living</h3>
            <p>Comprehensive care with support for daily living activities in a comfortable and safe environment.</p>
        </div>
        <div class="card">
            <h3>Long Term Nursing Care</h3>
            <p>Providing continuous medical attention and compassionate care tailored to individual needs.</p>
        </div>
        <div class="card">
            <h3>Dementia Care</h3>
            <p>Specialized programs designed to support cognitive decline and enhance quality of life.</p>
        </div>
    </div>
</div>

<div class="section testimonials">
    <h2>What Our Clients Say</h2>
    <div class="cards">
        <div class="card testimonial">
            <p>"The Senior Care is a wonderful place for my father. The staff are amazing, and the atmosphere feels like home!"</p>
            <strong>- Family of Mr. Eu</strong>
        </div>
        <div class="card testimonial">
            <p>"We were so happy with the care provided. It truly was a home away from home for our mother."</p>
            <strong>- Ms. Tan</strong>
        </div>
        <div class="card testimonial">
            <p>"The attention and warmth my grandmother received were outstanding. I highly recommend SeniorCareConnect."</p>
            <strong>- Mr. Lee</strong>
        </div>
    </div>
</div>



</body>
</html>
