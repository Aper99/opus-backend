const express = require('express');
const app = express();
const port = 3000;

const clienteRouter = require('./src/routes/cliente.routes');
const empleadoRouter = require('./src/routes/empleado.routes');


app.use(express.urlencoded({extended: true}));
app.use(express.json());


app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.use('/clientes', clienteRouter);
app.use('/empleados', empleadoRouter);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
