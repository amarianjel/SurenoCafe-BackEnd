const { response } = require('express');
const { validationResult } = require('express-validator');
const mysqlConnection  = require('../database/config');

const getDulces = async(req, res) => {
    mysqlConnection.query('SELECT * FROM dulces', (err, rows, fields) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      }); 
    /*mysqlConnection.query('SELECT * FROM dulces', (error, results, fields) => {
        if (error) throw error;
        return res.send({
            message: 'Lista de Productos.',
            error: false,
            data: results,
        });
    });*/
}

//+ En ambos casos es lo mismo en el llamado de mysqlConnection solo cambia la vista
const getDulce = async(req, res) => {
    const { id } = req.params;

    try{
        mysqlConnection.query('SELECT * FROM dulces WHERE prodId = ?', [id], (error, results, fields) => {

            if(!error) {
                res.json(results[0]);
              } else {
                console.log(error);
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

const crearDulce = async(req, res) => {
    try{
        let datosDulce = {
            tipo: req.body.tipo,
            name: req.body.name,
            cantidad: req.body.cantidad,
            price: req.body.price,
            description: req.body.description,
            imageUrl: req.body.imageUrl
        };

        //* Mapeo los errores del Check
        const errores = validationResult( req );
        if (!errores.isEmpty()){
            return res.status(400).json({
                ok: false,
                errores: errores.mapped()
            });
        }

        mysqlConnection.query("INSERT INTO dulces SET ?", datosDulce, (error, results) => {
            if (error) {
                res.status(400).json({ 
                    Mensaje: "Error" 
                });
            } else {
                res.status(200).json({ 
                    Mensaje: "Insertado el Dulce ",
                    Nombre_Dulce: datosDulce["name"],
                    Arreglo: results
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

const actualizarDulce = async(req, res) => {
    const id = req.params.id;

    try{
        

    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Error inesperado'
        })
    }
}

// Todo: Exportaciones de modulos
module.exports = {
    getDulces,
    getDulce,
    crearDulce,
    actualizarDulce,
}