# 비접촉 자율주행: IR 송 수신기로 로봇을 자율 주행 하기

### 소감

지난번 더듬이로 물체를 감지하는 로봇에 이어 이번에는 무선으로 물체를 감지하는 로봇을 만들었습니다.

갈 수록 발전하는 것 같아서 매우 즐거운 과제였던 것 같습니다.

이제까지의 작품에서 초음파센서를 이용한 감지는 여러번 실습 해 보았으나 IR을 이용한 감지는 이번이 처음이라

설레는 마음으로 과제를 진행 했던 것 같습니다.

저희 이번 과제는 안전에 의의를 두어, 물체가 감지되고 후진 할 때 경고음(비프음)과 LED불빛으로 경광등을 표현 해 보았습니다.

앞으로 ABOT이 어떻게 변화 하게 될 지 정말 기대가 됩니다. 감사합니다! 

<hr>

### 소스코드는 하단과 별도 파일로 첨부하였습니다!

#include <Servo.h>

Servo servoLeft;

Servo servoRight;


void setup()

{

pinMode(10, INPUT); pinMode(9, OUTPUT); // 입력 10번 출력 9번

pinMode(3, INPUT); pinMode(2, OUTPUT); // 입력 3번 출력 2번


servoLeft.attach(13); //왼쪽바퀴 13번핀

servoRight.attach(12); // 오른쪽바퀴 12번핀

}

void loop()

{

int irLeft = irDetect(9, 10, 38000); //왼쪽 ir센서 9번핀, 10번핀

int irRight = irDetect(2, 3, 38000); //오른쪽 ir 센서 2번핀,3번핀


if((irLeft == 0) && (irRight == 0)) //ir센서 양쪽 0일경우

{

digitalWrite(6, HIGH); // 전방에 물체가 감지되면 1초간 LED 점등

delay(100);

digitalWrite(6,LOW);

tone(4,440,100); // LED 점등과 함께 비프음(경고음)

backward(1000); //뒤로 1000만큼 빠지고

turnLeft(800); // 왼쪽으로 800만큼 회전

}

else if(irLeft == 0) //왼쪽 ir센서가 0일경우

{

digitalWrite(6, HIGH); // 전방에 물체가 감지되면 1초간 LED 점등

delay(100);

digitalWrite(6,LOW);

tone(4,440,100); // LED 점등과 함께 비프음(경고음)

backward(1000); //뒤로 1000만큼 빠지고

turnRight(400); // 오른쪽으로 400만큼 회전

}

else if(irRight == 0) //오른쪽 ir센서가 0일경우

{

digitalWrite(6, HIGH); // 전방에 물체가 감지되면 1초간 LED 점등

delay(100);

digitalWrite(6,LOW);

tone(4,440,100); // LED 점등과 함께 비프음(경고음)

backward(1000); //뒤로 1000만큼 빠진다.

turnLeft(400); // 왼쪽으로 400만큼 회전한다.

}

else

{

forward(20); //앞으로 20만큼 이동

}

}


int irDetect(int irLedPin, int irReceiverPin, long frequency)

{

tone(irLedPin, frequency, 8);

delay(1);

int ir = digitalRead(irReceiverPin); //ir수신

delay(1);

return ir;

}


void forward(int time) //앞으로 움직일때

{

servoLeft.write(1700); //왼쪽바퀴 1700방향으로 회전

servoRight.write(1300); //오른쪽바퀴 1300방향으로 회전

delay(time);

}


void turnLeft(int time) //왼쪽으로 회전

{

servoLeft.write(1300); //왼쪽바퀴 1300방향으로 회전

servoRight.write(1300); //오른쪽바퀴 1300방향으로 회전

delay(time);

}


void turnRight(int time) //오른쪽으로 회전

{

servoLeft.write(1700); //왼쪽바퀴 1700방향으로 회전

servoRight.write(1700); //오른쪽바퀴 1700방향으로 회전

delay(time);

}


void backward(int time) //뒤로갈때

{

servoLeft.write(1300); //왼쪽바퀴 1300방향으로 회전

servoRight.write(1700); //오른쪽바퀴 1700방향으로 회전

delay(time);

}
