rtHackaton
=============
We create a Quiz application for the DartHackaton realized at Globalcode in São Paulo, Brazil.

Hack in this project:

* Júlio Saito
* Luis Leão
* Marcio Camurati
* Rafael Brito

Demo video: http://youtu.be/M5wDBLSGOlE

Slides (pt-br): https://docs.google.com/presentation/d/1ZQ_j91lW0FWugcmvHpicE6DiS0-_6pEebie-d_e2YhU/edit

We created four applications that work integrated:

* Firmware Arduino and proxy serial made in Processing [https://github.com/luisleao/DartHackaton]
* Backend in Dart (server mode) [https://github.com/saitodisse/dartDuino2012]
* Frontend in Dart (web mode) [https://github.com/saitodisse/dartDuinoClient2012]

#### How it work? ####
The Backend controls the questions and answer, setting the current question, it connect in the serial proxy and creates one HttpServer to answer in JSON to the Frontend application.
The Frontend connect to the Backend for make periodic requests with XMLHttpRequest, showing the current question or the end screen when the user answer all the questions.
At the Arduino, when the user push one of the three buttons, it send the command to the serial port, answering the current question. Then the server send to Arduino if the answer is correct or not and the Arduino show a red or green light and turn on the bell.

#### ROAD MAP ####
* ....

#### JSON response example ####
```html
{
    "question": "Question example 1?",
    "answers": [
        {
            "value": "Answer 1",
            "state": 0
        },
        {
            "value": "Answer 2",
            "state": 0
        },
        {
            "value": "Answer 3",
            "state": 0
        }
    ],
    "status": true
}
```
