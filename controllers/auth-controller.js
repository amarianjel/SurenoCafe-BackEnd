const { response } = require('express');
const bcrypt = require('bcrypt');
const mysqlConnection  = require('../database/config');
const { generarJWT } = require('../helpers/jwt');



const getAuths = async ( req, res = response ) => {
    mysqlConnection.query('SELECT * FROM auth', (err, rows, fields) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
}

const crearAuth = async( req, res ) => {
    try{
        let datosAuth = {
            //userId autoincremental
            userName: req.body.name,
            userEmail: req.body.email,
            userPassword: bcrypt.hashSync(req.body.password, 10),
            userImg: req.body.img,
            userRole: req.body.role,
        };

        mysqlConnection.query("INSERT INTO auth SET ?", datosAuth, (error, result) => {
            if(error){
                return res.status(400).json({
                    ok: false,
                    mensaje: 'Error al crear al Administrador',
                    errors: error
                });
            }else{
                res.status(200).json({
                    Mensaje: "Insertado el Auth",
                    ok: true,
                    Nombre_Auth: datosAuth["userName"],
                });
            }
    });

    }catch (err) {
        console.log(err);
        res.status(500).json({
            ok: false,
            msg: 'Error insesperado.. revisar logs'
        });
    }
}

const login = async( req, res ) => {
    const { email, password } = req.body;

    try{

        mysqlConnection.query("SELECT * FROM auth WHERE userEmail = ?", email, (error, results,fields) => {
            if(error){
                return res.status(500).json({
                    ok: false,
                    mensaje: 'Error al buscar al Auth',
                    errors: error
                });
            }
            if(!results.length){
                return res.status(400).json({
                    ok:false,
                    mensaje: 'Credenciales incorrectas - email',
                    errors:error
                });
            }

            // + Installar Cors
            if(!bcrypt.compareSync(password, results[0].userPassword)){
                return res.status(400).json({
                    ok:false,
                    mensaje: 'Credenciales incorrectas - password',
                    errors:error
                });
            }

            

            //+ Generar el TOKEN - JWT
            generarJWT( results[0].userPassword ).then(( token ) => {
                res.status(200).json({
                    ok:true,
                    Auth: results,
                    id: results[0].userId,
                    token: token
                });
            });

            /*let token = jwt.sign({
                usuario: results[0].userPassword
            },
            process.env.JWT_SECRET, ({
                expiresIn: 14400
            }));

            res.status(200).json({
                ok:true,
                usuario: results,
                id: results[0].userId,
                token: j
            });*/

        });

    }catch (error){
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Hable con el administrador'
        })
    }
}

const actualizarAuth =  async(req, res) => {
    let id = req.params.id;
    let auth = req.body;

    if (!id || !auth) {
        return res.status(400).send({ error: producto, message: 'Debe proveer un id y los datos de un producto' });
    }
    
    mysqlConnection.query("UPDATE auth SET ? WHERE userId = ?", [auth, id], function(error, results, fields) {
        if (error) throw error;
        return res.status(200).json({ "Mensaje": "Registro con id=" + id + " ha sido actualizado"
        });
    });
}

const actualizarImagenAuth = (req, res) => {
    /*let id = req.params.id;
    if (!req.files) {
        return res.status(400).json({
            ok: false,
            mensaje: "No selecciono nada",
            errors: { message: 'Debe seleccionar una imagen' }
        });
    }
    // Obtener nombre del archivo
    let archivo = req.files.img;
    let nombreCortado = archivo.name.split('.');
    let extensionArchivo = nombreCortado[nombreCortado.length - 1];

    //Solo estas extensiones
    let extensionesValidas = ['png', 'jpeg', 'jpg', 'gif'];
    if (extensionesValidas.indexOf(extensionArchivo) < 0) {
        return res.status(400).json({
            ok: false,
            mensaje: 'Extension no valida',
            errors: { message: 'Las extensiones válidas son ' + extensionesValidas.json(', ') }
        });
    };
    // Nombre personalizado del archivo
    let nombreArchivo = `${id}-${new Date().getMilliseconds()}.${extensionArchivo}`;

    //Mover el archivo del temporal a un path
    let path = `./uploads/auth/${nombreArchivo}`;

    console.log(path);

    archivo.mv(path, err => {
        if (err) {
            return res.status(500).json({
                ok: false,
                mensaje: 'Error al mover archivo',
                errors: err
            });
        }

        return res.status(200).json({
            ok: true,
            mensaje: 'petición realizada correctamente'
        });
    });*/
}

module.exports = {
    getAuths,
    crearAuth,
    login,
    actualizarAuth,
    actualizarImagenAuth,
}