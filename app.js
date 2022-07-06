//require('dotenv').config();

//Requiere
var express = require('express');

// Crea el servidor
var app = express();

// !Escuchar peticiones
/*app.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + process.env.PORT);
});*/
app.listen(3000, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + 3000);
});