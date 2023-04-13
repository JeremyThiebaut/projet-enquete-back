const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db');

class Motive extends Model { };

Motive.init({
    description: DataTypes.TEXT
}, {
    sequelize,
    tableName: "motive",
    timestamps: false, // désactiver les timestamps
    updatedAt: false, // désactiver le champ updatedAt
});

module.exports = Motive;