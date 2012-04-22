#import('dart:html');
#import('dart:json');
#source('Config.dart');

class dartDuinoClient2012 {

  dartDuinoClient2012() {
    loadQuestions();
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
    
    
  }

  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#question').innerHTML = message;
  }
}

void main() {
  new dartDuinoClient2012().run();
}
