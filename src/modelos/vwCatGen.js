const { DataTypes } = require('sequelize');
const sequelize = require('../conexiones/connection'); // Asegúrate de ajustar la ruta según tu estructura de archivos

const vwCatGen = sequelize.define('vwCatGen', {
    idcatgen: {
      type: DataTypes.INTEGER
      },
    idCatalogo: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      },
    idgenero:{
      type: DataTypes.INTEGER,
      },
    genero:{
      type: DataTypes.STRING,
    },
    titulo:{
      type: DataTypes.STRING
      },
    resumen:{
      type: DataTypes.STRING
      },
    trailer:{
      type: DataTypes.STRING
      },
    temporada:{
      type: DataTypes.STRING
      },
    poster:{
      type: DataTypes.STRING
      },
    idcategoria:{
      type: DataTypes.INTEGER
      },
    categoria:{
      type: DataTypes.STRING
      },
    Actores:{
      type: DataTypes.STRING
      },
  }, {
    tableName: 'vwcatalogogenero',
    timestamps: false,
});

module.exports = vwCatGen;

/*
1 idcatgen int 
1 idCatalogo int 
1 genero varchar(25) 
1 titulo varchar(255) 
1 resumen text 
1 trailer varchar(255) 
1 Temporada varchar(30) 
1 Poster varchar(255) 
1 idCategoria int 
1 Actores text

/*
idCatalogo: {
  type: DataTypes.INTEGER,
  primaryKey: true,
},
idcatalogo:{
type: DataTypes.INTEGER
},

Generos:{
type: DataTypes.STRING
},


idgenero:{
  type: DataTypes.INTEGER,
},
genero:{
type: DataTypes.STRING,
},
}, {
tableName: 'vwcatalogogenero',
timestamps: false,
});*/