const express = require("express");
// import of the controllers
const playController = require("./controllers/playController.js");
const userController = require("./controllers/userController.js");
const updateController = require("./controllers/updateController.js");
const router = express.Router();

router.get("/", (req, res) => {
  console.log(req);
  res.json({ message: "hello" });
});

//play
router.get("/play/situation/:chapterId", playController.getSituation);
router.get("/play/storytelling/:chapterId", playController.getStory);
router.get(
  "/play/question/:situationId",
  playController.getCharacterQuestionInChapter
);
router.get("/play/character/:situationId", playController.getCharacter);
router.get("/play/allChapter", playController.getAllChapter);

// Update
router.post("/update", updateController.updateDataGame);

//inscription
router.post("/logon", userController.logonPlayer);

//connexion
router.post("/login", userController.loginPlayer);

// Verifier la connexion
router.post("/isLogged", userController.checkIflogged);

//deconnexion
router.post("/logout", userController.logoutPlayer);

router.use((_, res) => {
  res.status(404).send("Service does not exists");
});

module.exports = router;
