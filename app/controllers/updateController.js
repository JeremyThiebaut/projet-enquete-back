const User = require("../models/user");

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

      User.update(
        {
          allChapter,
          chapterCounter,
          storyCounter,
          questionCounter,
          situationCounter,
          shouldDisplayQuestion,
          shouldDisplayChapter,
        },
        {
          where: {
            mail,
          },
        }
      )
        .then((user) => {
          console.log("Update réussi.", user);
          User.findOne({
            where: { mail },
          }).then((user) => {
            request.session.user = user;
            if (request.session.user.dataValues.pwd) {
              delete request.session.user.dataValues.pwd;
            }
            console.log(request.session.user.dataValues.pwd);
            response.json(user.dataValues);
          });
        })
        .catch((e) => {
          console.log("Update impossible.");
          response.status(401).end();
        });
    }
  },
};

module.exports = updateController;
