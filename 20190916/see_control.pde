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

}
