/* eslint-disable max-len */
const express = require('express');
const app = express();
const cors = require('cors');
const port = 3000;

const clienteRouter = require('./src/routes/cliente.routes');
const empleadoRouter = require('./src/routes/empleado.routes');
const rutaRouter = require('./src/routes/ruta.routes');
const sistemaRouter = require('./src/routes/sistema.routes');
const tareaRouter = require('./src/routes/tarea.routes');
const usuarioRouter = require('./src/routes/usuario.routes');
const usersRouter = require('./src/routes/users.routes');

const authorizationMiddleware = require('./src/middleware/authorization.middleware');

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
    if (allowedOrigins.includes(origin) || !origin) {
      callback(null, true);
    } else {
      callback(new Error('Origin not allowed by CORS'));
    }
  },
};

app.use(cors(corsOptions));


app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.use('/clientes', authorizationMiddleware.authorization, clienteRouter);
app.use('/empleados', authorizationMiddleware.authorization, empleadoRouter);
app.use('/rutas', authorizationMiddleware.authorization, rutaRouter);
app.use('/sistemas', authorizationMiddleware.authorization, sistemaRouter);
app.use('/tareas', authorizationMiddleware.authorization, tareaRouter);
app.use('/usuarios', authorizationMiddleware.authorization, usuarioRouter);
app.use('/users', usersRouter);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
