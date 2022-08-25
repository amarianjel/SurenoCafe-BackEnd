const { response } = require('express');
const bcrypt = require('bcrypt');
const mysqlConnection  = require('../database/config');
const { generarJWT } = require('../helpers/jwt');



const getPedidos = async ( req, res = response ) => {
    mysqlConnection.query('SELECT * FROM pedido', (err, rows, fields) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
}

const crearPedido = async( req, res ) => {
    try{
        let datosPedido = {
            //id autoincremental
            fecha_pedido: req.body.fPedido,
            fecha_agendada: req.body.fAgendada,
            email: req.body.email,
            hora: req.body.hora,
            local: req.body.local
        };

        mysqlConnection.query("INSERT INTO pedido SET ?", datosPedido, (error, result) => {
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
                    Nombre_Auth: datosPedido["fecha_pedido"],
                    id: result.insertId
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

const borrarPedido =  async(req, res) => {
    const id = req.params.id;
    console.log(id);

    try{
        mysqlConnection.query("DELETE FROM pedido WHERE id_pedido = ?", id, (error, result) => {
            if (error) {
                return res.status(500).json({ Mensaje: "Error" });
            } else {
                return res.status(200).json({ Mensaje: "Registro con id =" + id + " Borrado" });
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
    getPedidos,
    crearPedido,
    borrarPedido
}