<html>
<head>
    <title>Welcome to Techie Horizon</title>
    <style>
        /* Full screen gradient violent background */
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #ff0057, #7b2ff7);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            text-align: center;
            animation: fadeIn 2s ease-in;
        }

        h1 {
            font-size: 3.5em;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 3px;
            text-shadow: 3px 3px 8px rgba(0, 0, 0, 0.6);
            animation: glow 2s infinite alternate;
        }

        h2 {
            font-size: 2em;
            margin-top: 10px;
            color: #ffe600;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
            animation: slideUp 1.5s ease-out;
        }

        /* Animations */
        @keyframes glow {
            from { text-shadow: 0 0 10px #ff0057, 0 0 20px #ff0057, 0 0 30px #7b2ff7; }
            to { text-shadow: 0 0 20px #ffe600, 0 0 40px #ff0057, 0 0 50px #7b2ff7; }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Button style */
        .btn {
            margin-top: 30px;
            padding: 12px 25px;
            font-size: 1.2em;
            font-weight: bold;
            border: none;
            border-radius: 30px;
            background: #ffe600;
            color: #111;
            cursor: pointer;
            transition: 0.3s;
            text-transform: uppercase;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
        }

        .btn:hover {
            background: #ff0057;
            color: #fff;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <h1>Welcome to Techie Horizon </h1>
    <h2>Enter the World of DevOps</h2>
<h1>Its a JENKINS multi stage pipeline job</h1>
    <button class="btn">Get Started</button>
</body>
</html>
