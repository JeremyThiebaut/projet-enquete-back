const {
  Chapter,
  Place,
  Character,
  Question,
  Storytelling,
  Motive,
  Answer,
  Situation,
  Situation_character,
} = require("../models");

const playController = {
  // route : /play/allChapter
  getAllChapter: async (req, res) => {
    try {
      let allChapter = await Chapter.count();
      if (!allChapter) {
        res.status(404).json("Cant find all chapter");
      }
      res.status(200).json(allChapter);
    } catch (error) {
      res.status(500).json(error);
    }
  },

  // route : /play/question/:situationId
  getCharacterQuestionInChapter: async (req, res) => {
    try {
      const situationId = Number(req.params.situationId);
      let situation = await Situation.findByPk(situationId);
      if (!situation) {
        res.status(404).json("Cant find situation with id " + situationId);
      }
      let characters = await Character.findAll({
        attributes: ["id"],
        raw: true,
      });

      characters = characters.map((character) => character.id);
      console.log(characters);
      let questionList = await Question.getForSituationAndCharacter(
        situationId,
        characters
      );
      console.log(questionList);
      res.status(200).json(questionList);
    } catch (error) {
      res.status(500).json(error);
    }
  },

  // route : /play/situation/:chapterId

  getSituation: async (req, res) => {
    try {
      const chapterId = Number(req.params.chapterId);
      let chapter = await Chapter.findByPk(chapterId);
      if (!chapter) {
        res.status(404).json("Cant find chapter with id " + chapterId);
      } else {
        let situation = await Situation.findAll({
          where: {
            chapter_id: chapterId,
          },
          include: ["place"],
          raw: true,
        });
        res.status(200).json(situation);
      }
    } catch (error) {
      res.status(500).json(error);
    }
  },

  // route : /play/storytelling/:chapterId
  getStory: async (req, res) => {
    try {
      const chapterId = req.params.chapterId;
      let chapter = await Chapter.findByPk(chapterId);
      if (!chapter) {
        res.status(404).json("Cant find chapter with id " + chapterId);
      } else {
        let storytelling = await Storytelling.findAll({
          where: {
            chapter_id: chapterId,
          },
          raw: true,
        });
        res.status(200).json(storytelling);
      }
    } catch (error) {
      res.status(500).json(error);
    }
  },

  // route : /play/character/:situationId
  getCharacter: async (req, res) => {
    try {
      const situationId = Number(req.params.situationId);
      let situation_character = await Situation_character.findAll({
        where: {
          situation_id: situationId,
        },
        raw: true,
        include: ["character"],
      });

      if (!situation_character) {
        res
          .status(404)
          .json("Cant find situation with id " + situation_character);
      } else {
        res.status(200).json(situation_character);
      }
    } catch (error) {
      res.status(500).json(error);
    }
  },
};

module.exports = playController;
