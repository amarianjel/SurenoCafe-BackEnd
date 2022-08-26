require('dotenv').config();

//Requiere
var express = require('express');
//var cors = require('cors');
const bodyParser = require('body-parser'); //- Se usa para mandar atributos que no sean Json

// Crea el servidor
var app = express();

// Configurar Cors
app.use((req, res, next) => {
    //Enable CORS
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, x-client-key, x-client-token, x-client-secret, Authorization");
    next();
});

//Lectura y parseo del Body
//app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Routes
app.use('/dulces', require('./routes/dulces-route'));
app.use('/salados', require('./routes/salados-route'));
app.use('/cliente', require('./routes/cliente-route'));
app.use('/pedido', require('./routes/pedido-route'));

// ? Escuchar peticiones
app.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + process.env.PORT);
});

