const { response } = require('express');
const bcrypt = require('bcrypt');
const mysqlConnection  = require('../database/config');
const { generarJWT } = require('../helpers/jwt');



const getClientes = async ( req, res = response ) => {
    mysqlConnection.query('SELECT * FROM cliente', (err, rows, fields) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
}

/*const crearCliente = async( req, res ) => {
    try{
        let datosAuth = {
            //userId autoincremental
            userName: req.body.name,
            userEmail: req.body.email,
            userPassword: bcrypt.hashSync(req.body.password, 10),
            userImg: req.body.img,
            userRole: req.body.role,
        };

        mysqlConnection.query("INSERT INTO cliente SET ?", datosAuth, (error, result) => {
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
}*/

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

const borrarAuth =  async(req, res) => {
    const id = req.params.id;
    console.log(id);

    try{
        mysqlConnection.query("DELETE FROM auth WHERE prodId = ?", id, (error, result) => {
            if (error) {
                return res.status(500).json({ Mensaje: "Error" });
            } else {
                return res.status(200).json({ Mensaje: "Registro con id=" + id + " Borrado" });
            }
        });

    }catch (error) {

        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Hable con el administrador'
        });
    }
}

module.exports = {
    getAuths,
    crearAuth,
    login,
    actualizarAuth,
    borrarAuth
}