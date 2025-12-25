<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff4e50, #f9d423);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .error-box {
            background: white;
            width: 420px;
            padding: 35px;
            border-radius: 18px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            animation: fadeIn 0.6s ease-in-out;
        }

        .error-box h1 {
            font-size: 70px;
            margin: 0;
            color: #ff4e50;
        }

        .error-box h2 {
            font-size: 26px;
            color: #333;
            margin-top: 10px;
        }

        .error-box p {
            color: #444;
            margin-top: 10px;
            line-height: 1.5;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: #ff4e50;
            border-radius: 8px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #e63b3d;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="error-box">
    <h1>⚠️</h1>
    <h2>Something Went Wrong</h2>

    <p>
        We couldn't process your request.<br>
        <strong><%= exception != null ? exception.getMessage() : "An unknown error occurred." %></strong>
    </p>

    <a href="index.jsp" class="btn">Go Back Home</a>
</div>

</body>
</html>
