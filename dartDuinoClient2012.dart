#import('dart:html');
#import('dart:json');
#source('Config.dart');

class dartDuinoClient2012 {
  static final String ANSWER_NEUTRAL = "neutral";
  static final String ANSWER_CORRECT = "correct";
  static final String ANSWER_INCORRECT = "incorrect";

  dartDuinoClient2012() {
    
  }
  
  void loadQuestions() {
    XMLHttpRequest request = new XMLHttpRequest();
    request.withCredentials = true;
    request.on.load.add((e) { 
      showQuestion(request); 
    });
    
    request.open('GET', "http://${Config.HTTP_HOST}:${Config.HTTP_PORT}/", true);
    request.send();
  }
  
  void showQuestion(XMLHttpRequest request) {
    JSON json = JSON.parse(request.responseText);
    
    var question = json["question"];
    
    if (question != null) {
      document.query('#main').classes.remove("fim");
      
      document.query('#question').innerHTML = question;
      document.query('#answers').innerHTML = "";
      
      var answers = "";
      
      for (var answer in json["answers"]) {
        answers += "<li class=\"${answer['state']}\">${answer['value']}</li>";
      }
      
      document.query('#answers').innerHTML = answers;      
    } else  {
      // finish questions
      document.query('#main').classes.add("fim");
    }
  }

  void run() {
    window.setInterval(loadQuestions, 500);
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#question').innerHTML = message;
  }
}

void main() {
  new dartDuinoClient2012().run();
}
