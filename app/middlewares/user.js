const userMiddleware = (request, response, next) => {
  console.log(request.session.user);
  if (request.session.user) {
    console.log("Utilisateur connecté", request.session.user);
    response.locals.user = request.session.user;
  } else {
    response.locals.user = false;
    console.log("Utilisateur non connecté");
  }
  next();
};

module.exports = userMiddleware;
