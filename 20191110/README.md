#	팀과제: IoT 실습(스마트폰으로 LED 제어하기)

### 아두이노 코드

void setup(){

  Serial.begin(9600); 
  
  pinMode(12, OUTPUT);
  
}

int i;

void loop(){

  if(Serial.available()>0){
  
    String m = Serial.readString();
    
    if(m.indexOf("1")==0) digitalWrite(12, HIGH);
    
    if(m.indexOf("0")==0) digitalWrite(12, LOW);
    
    if(m.indexOf("2")==0)
    
    {
    
      for(i = 0; i < 5; i++)
      
      {
      
      digitalWrite(12, HIGH);
      
      delay(150);
      
      digitalWrite(12, LOW);
      
      delay(150);
      
      }
      
    }
    
  }
  
}

### 프로세싱 코드

import processing.net.*;

import processing.serial.*;

Serial p;

Server s;

Client c;

void setup(){

  s = new Server(this, 12343);
  
  p = new Serial(this, "COM6", 9600); 
  
  size(1000,1000);
  
}

void draw(){

  c = s.available();
  
  if(c!=null){
  
    String m = c.readString();
    
    int n = m.length()-1;  
    
    m = m.substring(n); 
    
    println(m);  
    
    p.write(m); 
    
    if(m.indexOf("1")==0) background(255,0,0);
    
    if(m.indexOf("0")==0) background(0,255,0);
    
    if(m.indexOf("2")==0) background(0,0,255);
    
  }
  
}


### 앱인벤터 블록은 캡쳐하여 첨부파일로 첨부하였습니다!

### 소감문

지난번 과제에서 만들었던 와이파이 통신으로 이번엔 LED를 제어해보았습니다.

최근 공장이나 물류센터 자동화에 관심이 많아져서 여러 방면으로 공부를 하는 중인데

이번에 만들게 된 과제를 응용하면 모터나 펌프를 제어하고, 

센서 값을 받아 오는 일을 할 수 있지 않을까 하는 상상을 하며 즐겁게 과제를 진행 하였습니다.

최근 면접을 보러 다니며 '왜 이 길을 선택했나, 왜 프로그래머가 되려 하냐'는 질문을 받았습니다.

이러한 질문에 대한 제 대답은 '내가 필요해서 만들고 싶은 것을 만들 수 있으니까' 였습니다.

아두이노와 함께라면 저의 대답은 분명 현실이 될 것이라 믿어 의심치 않습니다.

즐거운 과제였습니다. 감사합니다!
