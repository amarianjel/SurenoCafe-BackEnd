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

const crearCliente = async( req, res ) => {
    try{
        let datosCliente = {
            //userId autoincremental
            cliName: req.body.name,
            cliEmail: req.body.email,
            cliPassword: bcrypt.hashSync(req.body.password, 10),
            cliImg: req.body.img,
            cliTelefono: req.body.telefono
        };

        mysqlConnection.query("INSERT INTO cliente SET ?", datosCliente, (error, result) => {
            if(error){
                return res.status(400).json({
                    ok: false,
                    mensaje: 'Error al crear al Administrador',
                    errors: error
                });
            }else{
                res.status(200).json({
                    Mensaje: "Insertado el Cliente",
                    ok: true,
                    Nombre_Cliente: datosCliente["cliName"],
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

        mysqlConnection.query("SELECT * FROM cliente WHERE cliEmail = ?", email, (error, results,fields) => {
            if(error){
                return res.status(500).json({
                    ok: false,
                    mensaje: 'Error al buscar al Cliente',
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
            if(!bcrypt.compareSync(password, results[0].cliPassword)){
                return res.status(400).json({
                    ok:false,
                    mensaje: 'Credenciales incorrectas - password',
                    errors:error
                });
            }

            

            //+ Generar el TOKEN - JWT
            generarJWT( results[0].cliPassword ).then(( token ) => {
                res.status(200).json({
                    ok:true,
                    Auth: results,
                    id: results[0].cliId,
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

const actualizarCliente =  async(req, res) => {
    let id = req.params.id;
    let cliente = req.body;

    if (!id || !cliente) {
        return res.status(400).send({ error: producto, message: 'Debe proveer un id y los datos de un producto' });
    }
    
    mysqlConnection.query("UPDATE cliente SET ? WHERE cliId = ?", [cliente, id], function(error, results, fields) {
        if (error) throw error;
        return res.status(200).json({ "Mensaje": "Registro con id=" + id + " ha sido actualizado"
        });
    });
}

const borrarCliente =  async(req, res) => {
    const id = req.params.id;
    console.log(id);

    try{
        mysqlConnection.query("DELETE FROM cliente WHERE cliId = ?", id, (error, result) => {
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
    getClientes,
    crearCliente,
    login,
    actualizarCliente,
    borrarCliente
}