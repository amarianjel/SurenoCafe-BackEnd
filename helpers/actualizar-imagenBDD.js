const { response } = require('express');
const mysqlConnection  = require('../database/config');

const actualizarImagen = async(tipo, id, nombreArchivo) => {

    let pathViejo = '';
    
    switch (tipo) {
        case 'auth':
            console.log(id);
            
            //*const auth = await Usuario.findById(id);
            
            /*return new Promise((resolve, reject) => {
                mysqlConnection.query(`INSERT INTO auth
                      WHERE userId = ?
                      values ?`,
                  [id, nombreArchivo], (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados.insertId);
                });
            });*/

            return true;

            /*if (!auth) {
                console.log('No es un auth por id');
                return false;
            }

            pathViejo = `./uploads/hospitales/${ auth.img }`;
            borrarImagen(pathViejo);

            usuario.img = nombreArchivo;
            await usuario.save();
            return true;*/
    }
}

module.exports = {
    actualizarImagen
}