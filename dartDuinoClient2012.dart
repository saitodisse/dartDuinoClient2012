#import('dart:html');
#source('Config.dart');

class dartDuinoClient2012 {

  dartDuinoClient2012() {
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
