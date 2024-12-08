<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Estilos para los campos del formulario */
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            color: #333;
        }

        /* Botón de registro */
        button {
            width: 100%;
            background: #4CAF50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background: #45a049;
        }

        /* Efectos de enfoque en los campos */
        input:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registro de Usuario</h1>
        <form action="srvUsuario" method="post">
            <!-- Nombre completo -->
            <div class="form-group">
                <label for="nombre">Nombre Usuario</label>
                <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu nombre completo" required>
            </div>
            
     
            
            <!-- Contraseña -->
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña" required>
            </div>
            
             <!-- estado -->
            <div class="form-group">
                <label for="nombre">Estado</label>
                <input type="text" id="estado" name="nombre" placeholder="Ingresa tu nombre completo" required>
            </div><!-- comment -->
            
             <!-- Cargo -->
            <div class="form-group">
                <label for="nombre">Cargo</label>
                <input type="text" id="cargo" name="nombre" placeholder="Ingresa tu nombre completo" required>
            </div>
            
          <div class="form-group">
    

<div class="form-group">
    <!-- Botón estilo enlace -->
    <a href="/sistema2/identificar.jsp" class="btn">Registrar</a>
</div>
        </form>
    </div>
</body>
</html>
