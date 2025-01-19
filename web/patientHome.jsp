<%-- 
    Document   : patientHome
    Created on : Jan 19, 2025, 3:24:12 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Home | SeniorCareConnect</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f1e8e3; /* Very light brown */
    }

/* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #8b6a59; /* Soft brown */
            padding: 10px 20px;
            color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .navbar img {
         height: 500px; /* Adjust the size of the logo */
         vertical-align: middle; /* Center it vertically with text */
         border-radius: 50px;
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 8px 16px;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: #735445; /* Darker soft brown */
        }


    .container {
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .reviews, .services {
      margin-top: 20px;
    }

    .reviews h3{
      margin-bottom: 10px;
      color: #8b6a59; /* Soft brown */
    }

    .review-item {
      padding: 10px;
      margin: 10px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background-color: #f9f9f9;
    }

    .video-section {
      margin-top: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    video {
      width: 100%;
      max-width: 1000px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Updated Service Section Styles */
.services h3 {
  font-size: 28px;
  text-align: center;
  margin-bottom: 20px;
  color: #6e4a38;
  font-weight: bold;
}

.service-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  justify-content: center; /* Ensures the content stays centered */
}

.service-item {
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  text-align: center;
  transition: transform 0.3s, box-shadow 0.3s;
}

.service-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
}

.service-item img {
  width: 100%;
  height: 150px;
  object-fit: cover;
  border-bottom: 2px solid #8b6a59;
}

.service-item h4 {
  font-size: 20px;
  color: #8b6a59;
  margin: 15px 0 5px;
}

.service-item p {
  font-size: 14px;
  color: #735445;
  margin: 5px 10px;
}

.service-item .price {
  font-size: 18px;
  font-weight: bold;
  color: #6e4a38;
  margin-top: 10px;
}

.service-item button {
  display: inline-block;
  margin-top: 10px;
  padding: 10px 20px;
  background-color: #8b6a59;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s;
}

.service-item button:hover {
  background-color: #735445;
}


    .footer {
        margin-top: 20px;
        text-align: center;
        padding: 10px;
        background-color: #6e4a38;
        color: white;
        border-radius: 8px;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
<div class="navbar">
    <div style="display: flex; align-items: center;">
        <!-- Logo with White Background -->
        <div style="background-color: none; border-radius: 50px; padding: 3px; margin-right: 5px;">
            <img src="image/logo.png" alt="Logo" style="height: 60px; vertical-align: middle;">
        </div>
        <h1 style="margin: 0; font-size: 24px; color: white;">Senior Care Connect</h1>
    </div>
    <div>
        <a href="patientHome.jsp">Home</a>
        <a href="patientDasboard.jsp">Booking</a>
          
                <form action="EditPatientInfoServlet" method="GET" style="display: inline;">
            <button type="submit" class="btn" style="background: none; border: none; color: white; cursor: pointer;">Edit My Information</button>
        </form>

        <a href="home.jsp">Logout</a>
    </div>
</div>

  <div class="container">

    <!-- Video Section -->
    <div class="video-section">
      <video autoplay loop muted>
        <source src="image/VideoPatient.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </div>

    <!-- Reviews Section -->
    <div class="reviews">
      <h3>Patient Reviews</h3>
      <div class="review-item">
        <strong>Saleha Salleh:</strong> "The services are excellent! Highly recommended."
      </div>
      <div class="review-item">
        <strong>Kumaran:</strong> "Friendly staff and very professional."
      </div>
      <div class="review-item">
        <strong>Chong Jun Yi:</strong> "A truly remarkable experience. The staff is caring and attentive."
      </div>
    </div>

    <!-- Services Section -->
    <div class="services">
      <h3>Our Services</h3>
      <div class="service-grid">
        <%
          // Database connection details
          String dbURL = "jdbc:derby://localhost:1527/SeniorCareDB";
          String dbUsername = "app";
          String dbPassword = "app";

          try (Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword)) {
              String query = "SELECT Package_Name, Package_Description, Package_Price FROM Package";
              PreparedStatement stmt = conn.prepareStatement(query);
              ResultSet rs = stmt.executeQuery();

              while (rs.next()) {
                  String packageName = rs.getString("Package_Name");
                  String packageDescription = rs.getString("Package_Description");
                  double packagePrice = rs.getDouble("Package_Price");
        %>
        <div class="service-item">
          <h4><%= packageName %></h4>
          <p><%= packageDescription %></p>
          <p class="price">$<%= String.format("%.2f", packagePrice) %></p>
        </div>
        <%
              }
              rs.close();
              stmt.close();
          } catch (Exception e) {
              out.println("<p>Error fetching packages: " + e.getMessage() + "</p>");
          }
        %>
      </div>
    </div>


  <!-- Footer -->
  <footer class="footer">
      <p>&copy; 2025 Senior Care Connect</p>
  </footer>
</body>
</html>
