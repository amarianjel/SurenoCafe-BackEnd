require('dotenv').config();

//Requiere
var express = require('express');
var cors = require('cors');


// Crea el servidor
var app = express();

// Configurar Cors
app.use(cors());

// Middlewares
app.use(express.json());

// Routes
app.use('/dulces', require('./routes/dulces-route'));

// ? Escuchar peticiones
app.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + process.env.PORT);
});