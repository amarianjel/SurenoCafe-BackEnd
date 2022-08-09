const { response } = require('express');
const path = require('path');
const { actualizarImagen } = require('../helpers/actualizar-imagenBDD');
/*
const fs = require('fs');

;*/


const fileUpload = (req, res = response) => {
    const tipo = req.params.tipo;
    const id = req.params.id;

    // Validar tipos
    const tiposValidos = ['auth', 'dulces', 'salados'];
    if(!tiposValidos.includes(tipo)){
        return res.status(400).json({
            ok: false,
            msg: 'No es un auth o dulce o salado'
        })
    }

    // Validar que exista un archivo
    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).json({
            ok: false,
            msg: 'No hay archivo'
        });
    }

    //* Procesar la Imagen
    const file = req.files.imagen;

    const nombreCortado = file.name.split('.'); // hola.1.3.jpg
    const extensionArchivo = nombreCortado[nombreCortado.length - 1];

    // Validar extension
    const extensionesValidas = ['png', 'jpg', 'jpeg', 'gif'];
    if (!extensionesValidas.includes(extensionArchivo)) {
        return res.status(400).json({
            ok: false,
            msg: 'No es una extensión permitida'
        });
    }

    // Generar el nombre del archivo
    const nombreArchivo = `${id} - ${nombreCortado[0]}_${ new Date().getMilliseconds()}_${ tipo }.${ extensionArchivo }`;
    
    // Path para guardar la imagen
    const path = `./uploads/${ tipo }/${ nombreArchivo }`;

    actualizarImagen(tipo, id, nombreArchivo);

    // Mover la imagen
    /*file.mv(path, (err) => {
        if (err) {
            console.log(err)
            return res.status(500).json({
                ok: false,
                msg: 'Error al mover la imagen'
            });
        }

        // Actualizar base de datos

        res.json({
            ok: true,
            msg: 'Archivo subido',
            nombreArchivo
        });
    });*/
}

/*const retornaImagen = (req, res = response) => {

    const tipo = req.params.tipo;
    const foto = req.params.foto;

    const pathImg = path.join(__dirname, `../uploads/${ tipo }/${ foto }`);

    // imagen por defecto
    if (fs.existsSync(pathImg)) {
        res.sendFile(pathImg);
    } else {
        const pathImg = path.join(__dirname, `../uploads/no-img.png`);
        res.sendFile(pathImg);
    }

}*/


module.exports = {
    fileUpload,
    //retornaImagen
}