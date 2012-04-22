#import('dart:html');
#import('dart:json');
#source('Config.dart');

class dartDuinoClient2012 {

  dartDuinoClient2012() {
    initializeFromUrl();
  }
  
  static void initializeFromUrl() {
    XMLHttpRequest request = new XMLHttpRequest();
    request.withCredentials = true;
    request.on.load.add((e) { 
      window.alert("${JSON.parse(request.responseText)}"); 
    });
    request.open('GET', "http://${Config.HTTP_HOST}:${Config.HTTP_PORT}/", true);
//    request.setRequestHeader("Access-Control-Allow-Credentials", "false");
    request.send();
    //request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
  }

  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new dartDuinoClient2012().run();
}
