const mysql = require('mysql');

/*const dbConnection = async () => {

    try{
        const mc = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'sureno_cafe'
        });

        console.log('DB de Sureno Abraham Conectada ')
        return mc.connect();
    }catch(err){
        console.log(err);
        throw new Err('Error a la hora de inciar la Bd, ver logs');
    }
}*/
const dbConnection = async () => {
    try{
        const mc = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'sureno_cafe'
        });
        mc.connect();

        console.log('DB de Sureno Abraham Conectada ');
    }catch(err){
        console.log(err);
        throw new Err('Error a la hora de inciar la Bd, ver logs');
    }
}

module.exports = {
    dbConnection
}