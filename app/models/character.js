const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db');

class Character extends Model { };

Character.init({
    name: DataTypes.TEXT,
    picture: DataTypes.TEXT,
    is_guilty: DataTypes.BOOLEAN,
    is_suspect: DataTypes.BOOLEAN,
    alibi: DataTypes.TEXT

}, {
    sequelize,
    tableName: "character",
    timestamps: false, // désactiver les timestamps
    updatedAt: false, // désactiver le champ updatedAt
});

module.exports = Character;