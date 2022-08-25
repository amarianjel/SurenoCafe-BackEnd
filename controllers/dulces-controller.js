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
            imageUrl: req.body.imageUrl,
            stock: req.body.stock
        };

        //* Mapeo los errores del Check ahora esta en Validar Campos
        /*const errores = validationResult( req );
        if (!errores.isEmpty()){
            return res.status(400).json({
                ok: false,
                errores: errores.mapped()
            });
        }*/

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
    const dulce = req.body;

    try{
        console.log(id);
        console.log(dulce);

        //* Mapeo los errores del Check
        const errores = validationResult( req );
        if (!errores.isEmpty()){
            return res.status(400).json({
                ok: false,
                errores: errores.mapped()
            });
        }

        if(!id || !dulce){
            return res.status(404).send({
                error: dulce,
                mensaje: 'Debe proveer un id y los datos del dulce'
            });
        }

        mysqlConnection.query("UPDATE dulces SET ? WHERE prodId = ?", [dulce, id], (error, results, fields) => {
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




const crearContieneDulce = async(req, res) => {
    try{
        let datosContieneDulce = {
            id_pedido: req.body.id_pedido,
            prodId: req.body.prodId,
            cantidad_producto: req.body.cantidad_producto
        };

        mysqlConnection.query("INSERT INTO contienedulces SET ?", datosContieneDulce, (error, results) => {
            if (error) {
                res.status(400).json({ 
                    Mensaje: "Error" 
                });
            } else {
                res.status(200).json({ 
                    Mensaje: "Insertado el contiene dulce ",
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





const borrarDulce =  async(req, res) => {
    const id = req.params.id;
    console.log(id);

    try{
        mysqlConnection.query("DELETE FROM dulces WHERE prodId = ?", id, (error, result) => {
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
    getDulces,
    getDulce,
    crearDulce,
    actualizarDulce,
    borrarDulce, 
    crearContieneDulce
}