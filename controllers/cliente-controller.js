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
            cliName: req.body.name,
            cliEmail: req.body.email,
            cliPassword: bcrypt.hashSync(req.body.password, 10),
            cliImg: req.body.img,
            cliTelefono: req.body.telefono
        };

        console.log(datosCliente);

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
                    Cliente: results,
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
    let email = req.params.email;   //+ Aqui debio ser un id, ya que es más fácil localizar por que es único
    let cliente = req.body;

    if (!email || !cliente) {
        return res.status(400).send({ error: cliente, message: 'Debe proveer un email existente y los datos de un cliente' });
    }
    
    mysqlConnection.query("UPDATE cliente SET ? WHERE cliEmail = ?", [cliente, email], function(error, results, fields) {
        if (error) throw error;
        return res.status(200).json({ "Mensaje": "Registro con el email =" + email + " ha sido actualizado"
        });
    });
}

const borrarCliente =  async(req, res) => {
    const email = req.params.email;

    try{
        mysqlConnection.query("DELETE FROM cliente WHERE cliEmail = ?", email, (error, result) => {
            if (error) {
                return res.status(500).json({ Mensaje: "Error" });
            } else {
                return res.status(200).json({ Mensaje: "Registro con el email =" + email + " Borrado" });
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