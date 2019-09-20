#20190916에 진행된 아두이노와 프로세싱을 활용한 시리얼 테스트입니다.

###아두이노 코드

void setup() {
  Serial.begin(9600); // 초당 9600비트로 통신하겠다.
}
 
void loop() {
  int con = analogRead(A0); // 아날로그 핀(A0)에서 데이터를 받음
  con = map(con, 0, 1023, 0, 600); 
  // 가변저항의 데이터 범위인 0~1023을 화면에 출력할 크기인 0~600으로 변환
  Serial.print(con); //시리얼 통신으로 보내기
  delay(100); //0.1초마다 한번씩 데이터를 보내게 설정
}


###프로세싱코드

import processing.serial.*; // Use Serial Communication

Serial p; // prepare definition

void setup(){

  size(600,600); // set screen size

  p = new Serial(this,"COM6",9600);
  

}

void draw(){ 

  if(p.available()>0){ //if serial communications are available


    String m = p.readString();  // accept data from serial
    int a = int(m.trim()); // convert String to int
    println(a); // print a value
    rect(0,0,600,600); //set rectangular size
    fill(255,0,0); // fill rectangular red
    if(a != 0) // if a value is not 0
    {
     rect(0,0,a,600); // set rectangular width value a
     fill(255);   // fill rectangular white
     noStroke(); // without boader line
    }
    
  }
  
  #####프로세싱의 경우 한글입력시 글자가 깨져서 영어로 주석을 달았습니다.
  
  
  
  
  ###시나리오 및 작성소감
  
  
  예전에 아두이노를 배우고 활용 할 때, 시리얼 통신을 사용해본 적이 있습니다.
  
  아두이노에서 받아들인 값을 통신을 통해 컴퓨터에서 볼 수 있다는 점이 정말 신기했습니다.
  
  이번 수업을 통해 프로세싱으로 시리얼 통신을 이용해 받은 값을 시각화 할 수 있다는 점을 깨달았습니다.
  
  그래서 센서값의 변화를 직접 조절할 수 있는 가변저항을 이용하여 
  
  저항값이 커지고, 작아지는 것을 시각화 할 수 있게 만들었습니다.
  
  
  
  저는 이번 과제를 통해 아두이노의 더 큰 가능성을 보았습니다. 
  
  매번 단순한 숫자로 보여지던 값들을 시각화를 통해 체감할 수 있게 만들었기 때문에 더욱 그렇게 느꼈던 것 같습니다.
  
  이번 과제를 진행하며 다양한 아이디어가 떠올랐고 아두이노를 이용해 어떤 프로젝트를 진행하게 될 지 기대가 됩니다.
