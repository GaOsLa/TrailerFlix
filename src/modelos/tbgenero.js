const { DataTypes } = require('sequelize');
const sequelize = require('../conexiones/connection'); // Asegúrate de ajustar la ruta según tu estructura de archivos

const Generos = sequelize.define('Generos', {
    idGenero: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    genero:{
      type: DataTypes.STRING,
    },
  }, {
    tableName: 'tbGenero',
    timestamps: false,
});

module.exports = Generos;