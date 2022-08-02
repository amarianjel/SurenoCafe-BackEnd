const { response } = require('express');
const { generarJWT } = require('../helpers/jwt');

const login = async( req, res = response ) => {
    const { email, password } = req.body;

    try{
        // ? Validar Administrador estatico
        let emailAdmin = 'sureno@gmail.com';
        
        if(email != emailAdmin){
            return res.status(404).json({
                ok: false,
                msg: 'Email no valido para el Adminstrador'
            });
        }


        // ? Validar pas Administrador estatico 
        let passwordAdmin = 'sureno';

        if(password != passwordAdmin){
            return res.status(404).json({
                ok: false,
                msg: 'Password no valido para el Adminstrador'
            });
        }

        // Generar Token con id
        const id = 1;
        const token = await generarJWT( id );

        res.json({
            ok: true,
            msg: 'Hola Mundo',
            token
        })

    }catch (error){
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Hable con el administrador'
        })
    }
}

module.exports = {
    login,
}