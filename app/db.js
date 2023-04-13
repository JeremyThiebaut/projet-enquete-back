const { Sequelize } = require("sequelize");

// const sequelize = new Sequelize(process.env.PG_URL, {
const sequelize = new Sequelize(
  // "eqlv1148_enquete", //database
  // "eqlv1148_enquete", //user
  // "obeachdb", //password

  // "enquet",
  // "root",
  // "",

  process.env.DB_TABLE,
  process.env.DB_TABLE,
  process.env.DB_PWD,

  {
    dialect: "postgres",
    host: process.env.DB_HOST,
    // host: process.env.PG_URL,
    // define: {
    //   underscored: true,
    //   timestamps: false,
    // },
  }
);

module.exports = sequelize;
