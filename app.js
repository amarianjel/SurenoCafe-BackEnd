require('dotenv').config();

//Requiere
var express = require('express');
var cors = require('cors');
//const bodyParser = require('body-parser'); //- Se usa para mandar atributos que no sean Json

// Crea el servidor
var app = express();

// Configurar Cors
app.use(cors());

//Lectura y parseo del Body
app.use(express.json());
/*app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));*/


// Routes
app.use('/dulces', require('./routes/dulces-route'));
app.use('/salados', require('./routes/salados-route'));

// ? Escuchar peticiones
app.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + process.env.PORT);
});