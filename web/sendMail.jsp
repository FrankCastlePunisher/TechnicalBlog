<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | TechBlog</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #7b4397, #dc2430);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-wrapper {
            background-color: #ffffff;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
        }

        .form-wrapper h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .form-wrapper label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            color: #444;
        }

        .form-wrapper input[type="text"],
        .form-wrapper textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border 0.3s;
        }

        .form-wrapper input[type="text"]:focus,
        .form-wrapper textarea:focus {
            border-color: #7b4397;
            outline: none;
        }

        .form-wrapper input[type="submit"] {
            background-color: #7b4397;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
        }

        .form-wrapper input[type="submit"]:hover {
            background-color: #5e2a84;
        }

        .result-msg {
            text-align: center;
            color: green;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="form-wrapper">
        <h1>Contact Us</h1>
        
        <c:if test="${not empty param.result}">
            <div class="result-msg">${param.result}</div>
        </c:if>

        <form action="EmailController" method="post">
            <!-- Admin email is hardcoded here -->
            <input type="hidden" name="recipients" value="thepunishersanket@gmail.com" />

            <label>Subject:</label>
            <input type="text" name="subject" placeholder="Enter your subject..." required />

            <label>Message:</label>
            <textarea name="message" rows="6" placeholder="Write your message here..." required></textarea>

            <input type="submit" value="Send Message" />
        </form>
    </div>
</body>
</html>
