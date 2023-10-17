const { DataTypes } = require('sequelize');
const sequelize = require('../conexiones/connection'); // Asegúrate de ajustar la ruta según tu estructura de archivos

const vwCatalogo = sequelize.define('vwCatalogo', {
    idCatalogo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    titulo:{
        type: DataTypes.STRING,
    },
    resumen:{
        type: DataTypes.STRING,
    },
    trailer:{
        type: DataTypes.STRING,
    },
    temporada:{
        type: DataTypes.STRING,
    },
    poster:{
      type: DataTypes.STRING,
    },
    generos:{
        type: DataTypes.STRING,
    },
    idcategoria:{
        type: DataTypes.INTEGER,
      },
    categoria:{
        type: DataTypes.STRING
    },
    actores:{
      type: DataTypes.STRING,
    },
  }, {
    tableName: 'vwcatalogo',
    timestamps: false,
});

module.exports = vwCatalogo;