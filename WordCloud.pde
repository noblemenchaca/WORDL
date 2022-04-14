// Sketch 7-10: Word Cloud Visualization – First Draft
String inputTextFile = "beaches.txt";
WordFreq table;
PFont tnr;     // The font to be used
int N = 150;   // The number of words to be displayed
void setup() {
  // Input and parse text file
  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!∼";
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);

  // display stuff
  size(800, 800);
  tnr = createFont("Times New Roman", 120);
  textFont(tnr);
  textSize(24);
  //noLoop();
  // Create the word frequency table
  table = new WordFreq(tokens);
  println("Max frequency:"+table.maxFreq());
  table.spiro(N);
} // setup()
void draw() {
  background(255);
  table.display(N);
  table.tabulate(N);
} // draw()

void mousePressed() {
  background(-1);
  fill(-1);
  table.arrange(N);
  table.display(N);
  table.tabulate(N);
}
