const sequelize = require('./src/conexiones/connection');
// const Catalogo = require('./src/modelos/catalogo');
const Categorias = require('./src/modelos/categorias');
const vwCatGen = require('./src/modelos/vwCatGen');
const vwCatalogo= require('./src/modelos/vwCatalogo')
const Generos = require('./src/modelos/tbgenero')
const express = require('express');
const { parse } = require('dotenv');
const app = express();
const PORT = process.env.PORT || 3000
// const PORT = 3000

let listaCat = ""
let listaCateg = ""

app.use(express.json());

//>>>>>>>>>>>>> ENDPOINT CATEGORIAS <<<<<<<<<<<<<<<<<<
app.get ("/categorias", async (_req, res) =>{
    try {
      await sequelize.authenticate();
      console.log('Conexión exitosa a la base de datos.');
      await Categorias.sync();
      const allcategorias = await Categorias.findAll();
      res.status(200).json(allcategorias);
      listaCat = allcategorias.map((categoria) => categoria.dataValues.categoria);
    } catch (error) {
      res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
    }
    listaCateg = listaCat.join(', ')
    console.log(listaCateg); // "Serie, Película"
  })

  //>>>>>>>>>>>>> ENDPOINT CATALOGO Y CATEGORIAS <<<<<<<<<<<<<<<<<<
app.get('/catalogo/categorias/', async (req, res) => {
  const l = await app.get('/categorias') 
  res.status(400).send(`Ingrese una de las siguientes categorias:  ${listaCateg}`)
});
  
//>>>>>>>>>>>>> ENDPOINT CATALOGO <<<<<<<<<<<<<<<<<<<
  app.get ("/catalogo", async (_req, res) =>{
    try {
      await sequelize.authenticate();
      console.log('Conexión exitosa a la base de datos.');
      await vwCatalogo.sync();
      const allCatalogo = await vwCatalogo.findAll();
      res.status(200).json(allCatalogo);
    } catch (error) {
      res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
    }
  })

//>>>>>>>>>>>>> CONSULTAR POR TITULOS Y SUS ID <<<<<<<<<<<<<<<<<<<
  app.get('/catalogo/TITULOS', async (req, res) => {
    try {
      const titulos = await vwCatalogo.findAll({
        attributes: ['idcatalogo','Titulo'], // Solo selecciona el campo 'Titulo'
      });
      res.json(titulos);
    } catch (error) {
      console.error('Error al obtener los títulos:', error);
      res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
    }
  });

//>>>>>>>>>>>>> ENDPOINT TITULOS POR ID <<<<<<<<<<<<<<<<<<
app.get('/catalogo/titulos/:id', async (req, res) => {
  const { id } = req.params;
  
  try {
    const elemento = await vwCatalogo.findByPk(id);
    if (elemento) {
      res.status(200).json (elemento);  
    } else {
      res.status(404).send('Elemento no encontrado');
    }
  } catch (error) {
    console.error('Error al buscar por ID:', error);
    res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
  }
});

//>>>>>>>>>>>>> ENDPOINT TITULOS POR NOMBRE <<<<<<<<<<<<<<<<<<
app.get('/catalogo/titulo/:titulo', async (req, res) => {
  const { titulo } = req.params;
  try {
    const elemento = await vwCatalogo.findOne({
      where: { Titulo: titulo },
    });
    if (elemento) {
      res.status(200).json (elemento);    } else {
      res.status(404).send('Elemento no encontrado');
    }
  } catch (error) {
    console.error('Error al buscar por título:', error);
    res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
  }
});

//>>>>>>>>>>>>> ENDPOINT BUSCA POR CATEGORIA <<<<<<<<<<<<<<<<<<
app.get('/catalogo/categorias/:categoria', async (req, res) => {
  const { categoria } = req.params;
  try {
    const elemento = await vwCatalogo.findAll({
      where: { categoria: categoria },
    });
    if (elemento) {
      res.status(200).json (elemento);
    } else {
      res.status(404).send('Elemento no encontrado');
    }
  } catch (error) {
    console.error('Error al buscar por título:', error);
    res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
  }
});


//>>>>>>>>>>>>> ENDPOINT PARA LISTAR LA LISTA DE GENEROS DISPONIBLES <<<<<<<<<<<<<<<<<<
app.get('/catalogo/genero', async (req, res) => {
    try {
      const allGeneros = await Generos.findAll();
      const listaGen = allGeneros.map((genero) => genero.dataValues.genero);
      res.status(200).json(listaGen);
    } catch (error) {
      res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
    }
  })


//>>>>>>>>>>>>> ENDPOINT TITULOS POR GENERO <<<<<<<<<<<<<<<<<<
app.get('/catalogo/genero/:genero', async (req, res) => {
  const { genero } = req.params;

  const generoSinComillas = genero.replace(/[^\w]/g, ""); // de este modo elimino algunos caracteres especiales como las comillas de una palabra
                                                          // ejemplo "Misterio" debe devolver Misterio
  try {
    const elemento = await vwCatGen.findAll({
      where: { genero: generoSinComillas },
    });
    if (elemento) {
      res.status(200).json (elemento);    } else {
      res.status(404).send('Elemento no encontrado');
    }
  } catch (error) {
    console.error('Error al buscar por título:', error);
    res.status(500).json({ error: 'error en el servidor', descripcion: error.message });
  }
});

//>>>>>>>>>>>>> INICIAMOS EL SERVIDOR <<<<<<<<<<<<<<<<<<
  app.listen(PORT, () => {
    console.log(`Servidor iniciado en el puerto ${PORT}`);
  });


