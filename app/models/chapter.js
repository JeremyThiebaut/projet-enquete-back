const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db');

class Chapter extends Model { };

Chapter.init({
    name: DataTypes.TEXT
}, {
    sequelize,
    tableName: "chapter",
    timestamps: false, // désactiver les timestamps
    updatedAt: false, // désactiver le champ updatedAt
});

module.exports = Chapter;