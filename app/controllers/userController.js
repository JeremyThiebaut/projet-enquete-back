const bcrypt = require("bcrypt");
const User = require("../models/user");
const emailValidator = require("email-validator");
const { use } = require("../router");

const userController = {
  updateDataGame: async (request, response) => {
    console.log(request.body.mail);

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
  },

  checkIflogged: async (req, res) => {
    console.log(req.session);
    if (req.session.user) {
      res.json({ logged: true, info: req.session.user });
    } else {
      res.json({ logged: false, info: { favorites: [] } });
    }
  },

  loginPlayer: async (request, response) => {
    request.session.viewCount = 1;
    const user = await User.findOne({
      where: {
        mail: request.body.mail,
        // pwd: request.body.pwd
      },
    });

    if (!user) {
      console.log("l'utilisateur n'a pas pu se connecter");
      response.status(401).end();
      return;
    }

    //on va s'ocupper de décrypter le mdp ici

    const validPassword = await bcrypt.compare(request.body.pwd, user.pwd);
    if (!validPassword) {
      console.log("mdp invalide");
      response.status(401).end();
      return;
    }

    // On stocke notre utilisateur en session
    request.session.user = user;

    // faire expirer la session au bout d'une heure
    if (request.body.remember) {
      request.session.cookie.expires = new Date(Date.now() + 60 * 60 * 1000);
    }

    delete user.dataValues.pwd;
    console.log(user.dataValues);
    console.log("Utilisateur connecté");
    response.json(user.dataValues);
  },

  logonPlayer: async (request, response) => {
    // console.log("request:", request);

    const pseudo = request.body.pseudo;
    const mail = request.body.mail;
    const checkMail = request.body.checkMail;
    const pwd = request.body.pwd;
    const checkPwd = request.body.checkPwd;

    const allChapter = request.body.counter.allChapter;
    const chapterCounter = request.body.counter.chapterCounter;
    const storyCounter = request.body.counter.storyCounter;
    const questionCounter = request.body.counter.questionCounter;
    const situationCounter = request.body.counter.situationCounter;
    const shouldDisplayQuestion = request.body.counter.shouldDisplayQuestion;
    const shouldDisplayChapter = request.body.counter.shouldDisplayChapter;

    //on va s'ocupper de crypter le mdp ici

    const saltRounds = 10;
    const encryptedPassword = await bcrypt.hash(request.body.pwd, saltRounds);

    // je teste que les valeurs obligatoire soient bien définis
    if (!(pseudo && mail && checkMail && pwd && checkPwd)) {
      console.log("Un champs est manquant");
      console.log("pseudo", pseudo);
      console.log("mail", mail);
      console.log("checkMail", checkMail);
      console.log("pwd", pwd);
      console.log("checkPwd", checkPwd);

      res.status(401).end();
      return;
    }

    User.findOne({
      where: {
        mail,
      },
    })
      .then((user) => {
        if (user) {
          console.log("Ce mail est déjà relié à un compte");
          response.status(401).end();
          return;
        }

        if (mail !== checkMail) {
          console.log("les 2 mails ne correspondent pas");
          response.status(401).end();

          return;
        }

        if (pwd !== checkPwd) {
          console.log("les 2 mots de passe ne sont pas identiques");
          response.status(401).end();

          return;
        }

        if (!emailValidator.validate(mail)) {
          console.log("L'email saisie n'est pas valide");
          response.status(401).end();

          return;
        }

        let newUser = new User({
          pseudo,
          mail,
          pwd: encryptedPassword,
          allChapter,
          chapterCounter,
          storyCounter,
          questionCounter,
          situationCounter,
          shouldDisplayQuestion,
          shouldDisplayChapter,
        });

        newUser.save().then(() => {
          console.log("nouveau joueur enregistré");
        });

        // On stocke notre utilisateur en session
        request.session.user = user;

        // faire expirer la session au bout d'une heure
        if (request.body.remember) {
          request.session.cookie.expires = new Date(
            Date.now() + 60 * 60 * 1000
          );
        }

        console.log(user);

        response.json(user);
      })
      .catch((e) => {
        console.log("coucou", e);
      });
  },

  logoutPlayer: (request, response) => {
    try {
      if (!request.session) {
        console.log("impossible de déconnecter quelqu'un non loggué");
      } else {
        request.session.destroy();
        response.clearCookie("connect.sid"); // effacer le cookie du client
        console.log("Utilisateur déconnecté");
        return response.status(200).json("Successful logout");
      }
    } catch (err) {
      response.status(500).json(error.toString());
    }
  },
};

module.exports = userController;
