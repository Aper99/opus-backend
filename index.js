const express = require('express');
const app = express();
const port = 3000;


app.use(express.urlencoded({extended: true}));
app.use(express.json());

const clienteRouter = require('./src/routes/cliente.routes');
const empleadoRouter = require('./src/routes/empleado.routes');
const rutaRouter = require('./src/routes/ruta.routes');


app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.use('/clientes', clienteRouter);
app.use('/empleados', empleadoRouter);
app.use('/rutas', rutaRouter);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
