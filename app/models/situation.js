const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db');

class Situation extends Model { };

Situation.init({
    
}, {
    sequelize,
    tableName: "situation",
    timestamps: false, // désactiver les timestamps
    updatedAt: false, // désactiver le champ updatedAt
});

module.exports = Situation;