const { DataTypes } = require('sequelize');
const sequelize = require('../conexiones/connection'); // Asegúrate de ajustar la ruta según tu estructura de archivos

const Categorias = sequelize.define('Categorias', {
    idcategoria: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    categoria:{
      type: DataTypes.STRING,
    },
  }, {
    tableName: 'tbCategoria',
    timestamps: false,
});

module.exports = Categorias;
