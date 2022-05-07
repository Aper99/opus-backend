const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');
const { ClienteModel } = require('./cliente.model');
const { EmpleadoModel } = require('./empleado.model');
const { SistemaModel } = require('./sistema.model');

const TareaModel = sequelize.define('Tarea', {
  // Model attributes are defined here
  tra_numero: {
    autoIncrement: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  tra_fecha: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  tra_codsis: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'sistema',
      key: 'sis_codigo',
    },
  },
  tra_codcli: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'cliente',
      key: 'cli_codigo',
    },
  },
  tra_codemp: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'empleado',
      key: 'emp_codigo',
    },
  },
  tra_descripcion: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  tra_estado: {
    // eslint-disable-next-line new-cap
    type: DataTypes.CHAR(1),
    allowNull: true,
  },
  tra_obs: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
}, {
  tableName: 'tarea',
  timestamps: false,
});

TareaModel.belongsTo(SistemaModel, {foreignKey: 'tra_codsis'});
TareaModel.belongsTo(ClienteModel, {foreignKey: 'tra_codcli'});
TareaModel.belongsTo(EmpleadoModel, {foreignKey: 'tra_codemp'});


module.exports = {
  TareaModel,
};
