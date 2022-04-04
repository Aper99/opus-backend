const express = require('express');
const app = express();
const cors = require('cors');
const port = 3000;


app.use(express.urlencoded({extended: true}));
app.use(express.json());

const allowedOrigins = [
  'capacitor://localhost',
  'ionic://localhost',
  'http://localhost',
  'http://localhost:8080',
  'http://localhost:8100',
];

const corsOptions = {
  origin: (origin, callback) => {
    console.log(origin);
    if (allowedOrigins.includes(origin) || !origin) {
      callback(null, true);
    } else {
      callback(new Error('Origin not allowed by CORS'));
    }
  },
};

app.use(cors(corsOptions));

const clienteRouter = require('./src/routes/cliente.routes');
const empleadoRouter = require('./src/routes/empleado.routes');
const rutaRouter = require('./src/routes/ruta.routes');
const sistemaRouter = require('./src/routes/sistema.routes');
const tareaRouter = require('./src/routes/tarea.routes');
const usuarioRouter = require('./src/routes/usuario.routes');


app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.use('/clientes', clienteRouter);
app.use('/empleados', empleadoRouter);
app.use('/rutas', rutaRouter);
app.use('/sistemas', sistemaRouter);
app.use('/tareas', tareaRouter);
app.use('/usuarios', usuarioRouter);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
