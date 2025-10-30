<html>
<head>
    <title>DevOps Pipeline Success - Techie Horizon</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            animation: fadeIn 1.8s ease-in;
            text-align: center;
        }

        h1 {
            font-size: 3.2em;
            font-weight: 800;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
            margin-bottom: 10px;
            animation: zoomIn 1.5s ease-out;
        }

        h2 {
            font-size: 1.8em;
            color: #4de0ff;
            font-weight: 500;
            margin-top: 5px;
            animation: slideUp 1.8s ease-out;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        p {
            margin-top: 15px;
            font-size: 1.2em;
            opacity: 0.9;
        }

        .badge {
            margin-top: 18px;
            padding: 10px 22px;
            font-size: 1em;
            border-radius: 50px;
            background: #4de0ff;
            color: #001f2b;
            font-weight: bold;
            text-transform: uppercase;
            box-shadow: 0px 4px 18px rgba(0, 255, 255, 0.4);
        }

        .btn {
            margin-top: 35px;
            padding: 12px 28px;
            font-size: 1.2em;
            font-weight: bold;
            border: none;
            border-radius: 30px;
            background: #ffca28;
            color: #000;
            cursor: pointer;
            transition: 0.3s;
            text-transform: uppercase;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.4);
        }

        .btn:hover {
            background: #ff9800;
            color: #fff;
            transform: scale(1.1);
        }

        /* Animations */
        @keyframes fadeIn { from {opacity:0;} to {opacity:1;} }
        @keyframes slideUp { from {transform:translateY(40px); opacity:0;} to {transform:translateY(0); opacity:1;} }
        @keyframes zoomIn { 0% {transform:scale(0.8);} 100% {transform:scale(1);} }
    </style>

</head>

<body>
    <h1>🚀 Techie Horizon</h1>
    <h2>CI/CD Pipeline Successfully Deployed!</h2>

    <p>
        This application was built & deployed using <b>Jenkins + Docker + Kubernetes + ArgoCD</b>
    </p>

    <div class="badge">✅  Jenkins Pipeline | ✅ Automated Deployments</div>

    <button class="btn">Explore DevOps Journey</button>
</body>
</html>
