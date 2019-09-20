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
