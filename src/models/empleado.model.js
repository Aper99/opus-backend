const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

const EmpleadoModel = sequelize.define('Empleado', {
  // Model attributes are defined here
  emp_codigo: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  emp_nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  emp_telefono: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  emp_ci: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  emp_direccion: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  emp_codusu: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  tableName: 'empleado',
  timestamps: false,
});

module.exports = {
  EmpleadoModel,
};
