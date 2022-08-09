const jwt = require('jsonwebtoken');

const generarJWT = (user) => {
    let jj;
    return new Promise((resolve, reject) => {

        const payload = {
            user,
        };

        jwt.sign(payload, process.env.JWT_SECRET, {
            expiresIn: '12h'
        }, (err, token) => {

            if (err) {
                console.log(err);
                reject('No se pudo generar el JWT');
            } else {
                resolve(token);
            }
            return jj = token;

        });

    });

}
//! Funciona dentro de la promesa

module.exports = {
    generarJWT,
}