const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db');

class Weapon extends Model { };

Weapon.init({
    name: DataTypes.TEXT
}, {
    sequelize,
    tableName: "weapon",
    timestamps: false, // désactiver les timestamps
    updatedAt: false, // désactiver le champ updatedAt
});

module.exports = Weapon;