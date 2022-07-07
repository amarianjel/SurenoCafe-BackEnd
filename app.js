require('dotenv').config();

//Requiere
var express = require('express');
var cors = require('cors');
const { dbConnection } = require('./database/config');
//const mysql = require('mysql');

// Crea el servidor
var app = express();

// Configurar Cors
app.use(cors());

dbConnection();
// configuración de la conexión
/*const mc = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'sureno_cafe'
});*/

// conectar a la base de datos para
//mc.connect();

// Rutas
// Recuperar todos los productos
/*app.get('/dulces', function(req, res) {
    mc.query('SELECT * FROM dulces', function(error, results, fields) {
        if (error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de Dulces.'
        });
    });
});*/

app.get( '/', (req, res) => {
    res.json({
        ok:true,
        msg:'Hola mundo'
    })
});

// ? Escuchar peticiones
app.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + process.env.PORT);
});