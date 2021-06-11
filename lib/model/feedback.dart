class UserFeedback {
  String _assunto;
  String _feedbacktext;

  UserFeedback() {
    _assunto = "";
    _feedbacktext = "";
  }

  UserFeedback.fromMap(map) {
    this._assunto = map["assunto"];
    this._feedbacktext = map["feedbacktext"];
  }

  String get assunto => _assunto;
  String get feedbacktext => _feedbacktext;

  set assunto(String newAssunto) {
    if (newAssunto.length > 0) {
      this._assunto = newAssunto;
    }
  }

  set feedbacktext(String newFeedbackText) {
    if (newFeedbackText.length > 0) {
      this._feedbacktext = newFeedbackText;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["assunto"] = _assunto;
    map["feedbacktext"] = _feedbacktext;
    return map;
  }
}
