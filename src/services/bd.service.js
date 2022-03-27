const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('bd_opus', 'postgres', 'admin', {
    host: 'localhost',
    port: 5433,
    dialect: 'postgres'
  });

  const testConnection = async () =>{
    try {
        await sequelize.authenticate();
        console.log('Connection to bd_opus has been established successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
      }
  }

  testConnection();

  const db = {
      Sequelize,
      sequelize
  }

  module.exports = db;