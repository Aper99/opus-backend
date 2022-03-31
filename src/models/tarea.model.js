const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

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

module.exports = {
  TareaModel,
};
