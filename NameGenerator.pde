PFont font1, font2;
int fontSize = 36;
//String fontFace = "Arial";

int minWords = 1;
int maxWords = 2;
int minSyllables = 1;
int maxSyllables = 3;

String sayText = "";
String output = "";

boolean camelCase = false;
Settings settings;

void setup() {
  size(800, 200, P2D);
  settings = new Settings("settings.txt");
  font1 = loadFont("Arial-Black-36.vlw");//createFont(fontFace, fontSize);
  font2 = loadFont("Arial-Black-18.vlw");//createFont(fontFace, fontSize/2);
  textAlign(CENTER);
  initPhonemes();
  getOutput();
}

void draw() {
  background(0);
  
  fill(127);
  textFont(font2, fontSize / 2);
  text(sayText, width / 2, fontSize);
  text("Words: " + minWords + "-" + maxWords + "   ...   parts: " + minSyllables + "-" + maxSyllables + "   ...   " + "CamelCase: " + setOnOff(camelCase), width / 2, height - fontSize);
  text("[ press any key to try again ]", width / 2, height - (fontSize / 2.75));
  
  fill(255);
  textFont(font1,fontSize);
  text(output,width/2,(fontSize/4)+(height/2));
}

void getOutput() {
  output = "";
  sayText = "";
  int words = int(round(random(minWords,maxWords)));
  for (int i = 0; i < words; i++) {
    int syllables = int(round(random(minSyllables,maxSyllables)));
    sayText += "Word " + (i + 1) + " :: " + syllables;
    if (syllables > 1) {
       sayText += " parts";
    } else {
      sayText += " part";
    }
    
    if (i < words && words > 1 && i != words - 1) sayText += "   |   ";
    for (int j = 0; j < syllables; j++) {
      String q = phonemes[int(random(phonemes.length))];
      if(camelCase || j == 0) q = q.substring(0, 1).toUpperCase() + q.substring(1);
      output += q;
    }
    if (i < words) output += " ";    
  }
}

float rounder(float _val, float _places) {
  _val *= pow(10, _places);
  _val = round(_val);
  _val /= pow(10, _places);
  return _val;
}

String setOnOff(boolean _b) {
  String s;
  if (_b) {
    s = "ON";
  } else {
    s = "OFF";
  }
  return s;
}