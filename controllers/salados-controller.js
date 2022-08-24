const { validationResult } = require('express-validator');
const mysqlConnection  = require('../database/config');

const getSalados = async(req, res) => {
    mysqlConnection.query('SELECT * FROM salados', (err, rows, fields) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      }); 
}

const getSalado = async(req, res) => {
    const { id } = req.params;

    try{
        mysqlConnection.query('SELECT * FROM salados WHERE prodId = ?', [id], (error, results, fields) => {

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

const crearSalado = async(req, res) => {
    try{
        let datosSalado = {
            tipo: req.body.tipo,
            name: req.body.name,
            cantidad: req.body.cantidad,
            price: req.body.price,
            description: req.body.description,
            imageUrl: req.body.imageUrl,
            stock: req.body.stock
        };

        mysqlConnection.query("INSERT INTO salados SET ?", datosSalado, (error, results) => {
            if (error) {
                res.status(400).json({ 
                    Mensaje: "Error" 
                });
            } else {
                res.status(200).json({ 
                    Mensaje: "Insertado el Salado ",
                    Nombre_Dulce: datosSalado["name"],
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

const actualizarSalado = async(req, res) => {
    const id = req.params.id;
    const salado = req.body;

    try{
        console.log(id);
        console.log(salado);

        //* Mapeo los errores del Check
        const errores = validationResult( req );
        if (!errores.isEmpty()){
            return res.status(400).json({
                ok: false,
                errores: errores.mapped()
            });
        }

        if(!id || !salado){
            return res.status(404).send({
                error: salado,
                mensaje: 'Debe proveer un id y los datos del salado'
            });
        }

        mysqlConnection.query("UPDATE salados SET ? WHERE prodId = ?", [salado, id], (error, results, fields) => {
            if(error) throw error;
            return res.status(200).json({
                Mensaje: "Registro con id= " + id + " ha sido actualizado"
            });
        });

    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Error inesperado'
        })
    }
}

const borrarSalado =  async(req, res) => {
    const id = req.params.id;
    console.log(id);

    try{
        mysqlConnection.query("DELETE FROM salados WHERE prodId = ?", id, (error, result) => {
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

// Todo: Exportaciones de modulos
module.exports = {
    getSalados,
    getSalado,
    crearSalado,
    actualizarSalado,
    borrarSalado
}