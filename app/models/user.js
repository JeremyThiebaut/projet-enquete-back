const { DataTypes, Model } = require("sequelize");
const sequelize = require("../db");

class User extends Model {}

User.init(
  {
    pseudo: DataTypes.TEXT,
    mail: DataTypes.TEXT,
    pwd: DataTypes.TEXT,
    allChapter: DataTypes.NUMBER,
    chapterCounter: DataTypes.NUMBER,
    storyCounter: DataTypes.NUMBER,
    questionCounter: DataTypes.NUMBER,
    situationCounter: DataTypes.NUMBER,
    shouldDisplayQuestion: DataTypes.BOOLEAN,
    shouldDisplayChapter: DataTypes.BOOLEAN,
  },
  {
    sequelize,
    tableName: "user",
  }
);

module.exports = User;
