<!DOCTYPE html>
<html>
<head>
    <title>Insertar Producto con Imagen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
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
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            color: #333;
        }
        button {
            width: 100%;
            background: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background: #0056b3;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Insertar Nuevo Producto</h2>
        <form action="guardarproducto_new.jsp" method="post" enctype="multipart/form-data">
        
            <div class="form-group">
                <label>Nombre:</label>
                <input type="text" name="nombre" placeholder="Escribe el nombre del producto" required>
            </div>
            <div class="form-group">
                <label>Valor aproximado:</label>
                <input type="number" name="precio" step="0.01" placeholder="Escribe el precio del producto" required>
            </div>
            <div class="form-group">
                <label>Descripción:</label>
                <textarea name="descripcion" placeholder="Escribe una descripción del producto" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label>Imagen:</label>
                <input type="file" name="imagen" accept="image/*" required>
            </div>
            <button type="submit">Guardar Producto</button>
        </form>
    </div>
</body>
</html>
