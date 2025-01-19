<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services | SeniorCareConnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #735445; /* Cream background */
        }
        header {
            background-color: #3e2723; /* Chocolate color */
            color: #EEE9C8;
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
        height: 500px;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
    }
    .hero-overlay {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('image/seniorcarepicture.jpg') no-repeat center center/cover;
        filter: blur(4px); /* Blurs the background image */
        z-index: -1; /* Ensures the overlay stays behind the text */
    }
    .hero h1 {
        font-size: 3.5em; /* Increased font size */
        font-weight: bold;
        text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.8); /* Stronger text shadow for better contrast */
        position: relative;
        z-index: 1; /* Ensures text stays above the overlay */
    }
        .section {
            padding: 50px;
            text-align: center;
        }
        .facility-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .facility {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .facility img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-bottom: 2px solid #735445;
        }
        .facility h3 {
            color: #3e2723; /* Dark chocolate */
            padding: 10px 15px;
        }
        .facility p {
            padding: 0 15px 20px;
            color: #555; /* Soft text */
        }
        footer {
            background-color: #3e2723; /* Dark chocolate */
            color: white;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>

<header>
    <h1>SeniorCareConnect</h1>
    <p>Exceptional Services for Comfortable Living</p>
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
    <h1>Our Services</h1>
</div>

<div class="section">
    <h2>Explore Our State-of-the-Art Services</h2>
    <p>We provide a comfortable and safe environment for seniors, ensuring their well-being and quality of life.</p>
    <div class="facility-grid">
        <div class="facility">
            <img src="image/morningexercise.jpg" alt="Morning Exercise">
            <h3>Morning Exercise</h3>
            <p>Gentle morning exercises promote flexibility, strength, and overall wellness.</p>
        </div>
        <div class="facility">
            <img src="image/gardening.jpg" alt="Gardening">
            <h3>Gardening</h3>
            <p>Gardening enhances relaxation, engagement, and connection with nature daily.</p>
        </div>
        <div class="facility">
            <img src="image/healthymeals.jpg" alt="Healthy Meals ">
            <h3>Healthy Meals</h3>
            <p>Nutritious meals served in a communal dining space designed for interaction.</p>
        </div>
        <div class="facility">
            <img src="image/knitting.jpg" alt="Knitting Class">
            <h3>Knitting Class</h3>
            <p>Knitting classes foster creativity, dexterity, and social connections for seniors.</p>
        </div>
        <div class="facility">
            <img src="image/weaving.jpg" alt="Weaving Art Class">
            <h3>Weaving Art Class</h3>
            <p>Weaving classes enhance creativity, motor skills, and relaxation for seniors.</p>
        </div>
        <div class="facility">
            <img src="image/singing.jpg" alt="Singing Class">
            <h3>Singing Class</h3>
            <p>Singing classes uplift spirits, enhance memory, and foster joyful connections.</p>
        </div>
    </div>
</div>

</body>
</html>