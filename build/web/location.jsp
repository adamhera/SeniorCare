<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Location | SeniorCareConnect</title>
    <style>
        /* Basic reset and body styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
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

        /* Hero section styling */
        .hero {
            background-image: url('image/house.jpg');
            background-size: cover;
            background-position: center;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .hero h1 {
            font-size: 3em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7); /* Adding text shadow */
        }

        /* Section styling */
        .section {
            padding: 50px 20px;
            text-align: center;
        }

        /* Map container styling */
        #map {
            width: 100%;
            height: 400px;
            margin-top: 20px;
        }

        /* Footer styles */
        footer {
            background-color: #3e2723;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
    </style>
    <!-- Leaflet.js CDN -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</head>
<body>
    <header>
        <h1>SeniorCareConnect</h1>
        <p>Visit us at our convenient location</p>
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
        <h1>Find Us Here</h1>
    </div>

    <div class="section">
        <h2>Our Location</h2>
        <p>We are located at the heart of Petaling Jaya, Selangor. Visit us for a tour or any inquiries you may have!</p>

        <div id="map"></div>

        <div class="contact-info">
            <p><strong>Address:</strong> G-456, SS3, Taman Universiti, 47300 Petaling Jaya, Selangor, Malaysia</p>
        </div>
    </div>

    <script>
        // Initialize the map
        var map = L.map('map').setView([3.09713, 101.60860], 16);

        // Set the OpenStreetMap tile layer
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        // Add a marker to the map
        var marker = L.marker([3.09713, 101.60860]).addTo(map);

        // Create a popup with the location's details
        marker.bindPopup("<a href='https://www.openstreetmap.org/#map=16/3.09713/101.60860' target='_blank'>Get Directions</a>").openPopup();
    </script>
</body>
</html>
