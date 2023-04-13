const { User } = require("../models");

const updateController = {
  updateDataGame: async (request, response) => {
    if (!request.session.user) {
      console.log("utilisateur non reconnu");
      response.status(401).end();
    } else {
      const allChapter = request.body.counter.allChapter;
      const chapterCounter = request.body.counter.chapterCounter;
      const storyCounter = request.body.counter.storyCounter;
      const questionCounter = request.body.counter.questionCounter;
      const situationCounter = request.body.counter.situationCounter;
      const shouldDisplayQuestion = request.body.counter.shouldDisplayQuestion;
      const shouldDisplayChapter = request.body.counter.shouldDisplayChapter;
      const pseudo = request.body.pseudo;
      const mail = request.body.mail;

      try {
        const user = await User.findOne({ mail });
        if (!user) {
          console.log("L'utilisateur n'a pas été trouvé");
          response.status(404).end();
          return;
        }

        user.allChapter = allChapter;
        user.chapterCounter = chapterCounter;
        user.storyCounter = storyCounter;
        user.questionCounter = questionCounter;
        user.situationCounter = situationCounter;
        user.shouldDisplayQuestion = shouldDisplayQuestion;
        user.shouldDisplayChapter = shouldDisplayChapter;

        await user.save();

        console.log("Update réussi.", user);
        request.session.user = user;

        if (request.session.user.dataValues.pwd) {
          delete request.session.user.dataValues.pwd;
        }

        console.log(request.session.user.dataValues.pwd);
        response.json(user.dataValues);
      } catch (e) {
        console.log("Update impossible.");
        console.error(e);
        response.status(500).end();
      }
    }
  },
};

module.exports = updateController;
