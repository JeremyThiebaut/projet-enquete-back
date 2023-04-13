const { DataTypes, Model } = require('sequelize');
const sequelize = require('../db');

class Storytelling extends Model { };

Storytelling.init({
    sentence: DataTypes.TEXT
}, {
    sequelize,
    tableName: "storytelling",
    timestamps: false, // désactiver les timestamps
    updatedAt: false, // désactiver le champ updatedAt
});

module.exports = Storytelling;