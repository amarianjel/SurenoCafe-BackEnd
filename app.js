require('dotenv').config();

//Requiere
var express = require('express');
const mysql=require('mysql');
var bcrypt= require('bcrypt');
//var cors = require('cors');
const bodyParser = require('body-parser'); //- Se usa para mandar atributos que no sean Json

// Crea el servidor
var app = express();

const mc=mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'sureno_cafe'
});

mc.connect();

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

app.post('/cliente', function(req,res){
    let datosCliente={
        email:req.body.email,
        nombre_cliente:req.body.name,
        contrasenia:bcrypt.hashSync(req.body.password, 10),
        telefono:parseInt(req.body.phone)
        
        
    };
    if(mc){
        mc.query("INSERT INTO cliente SET ?", datosCliente, function(err, result){
            if(err){
                res.json({
                    ok:false,
                    mensaje: 'Error al crear al Cliente'
                });
            }else{
                res.json({
                    ok:true,
                    mensaje:'Cliente creado correctamente'
                });
            }
        });
    }
});

// Routes
app.use('/dulces', require('./routes/dulces-route'));
app.use('/salados', require('./routes/salados-route'));
app.use('/auth', require('./routes/auth-route'));
app.use('/cliente', require('./routes/cliente-route'));
app.use('/pedido', require('./routes/pedido-route'));

// ? Escuchar peticiones
app.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto http://localhost:' + process.env.PORT);
});

