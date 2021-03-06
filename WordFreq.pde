// Sketch 7-10a: The Word frequency table class
class WordFreq {
  // A Frequency table class for Words
  ArrayList<WordTile> wordFrequency;
  String [] stopWords = loadStrings("stopwords.txt");
  WordFreq(String[] tokens) {  // Constructor
    wordFrequency = new ArrayList();
    // Compute the wordFrequency table using tokens
    for (String t : tokens) {
      if (!_isStopWord(t)) {
        // See if token t is already a known word
        int index = _search(t, wordFrequency);
        if (index >= 0) {
          ( wordFrequency.get(index)).incr();
        }
        else {
          wordFrequency.add(new WordTile(t));
        }
      }
    } // for
  } // WordFreq()
  void tabulate(int n) {  // console printout
    //int n = wordFrequency.size();
    println("There are "+N()+" entries.");
    for (int i=0; i < n; i++) {
      println(wordFrequency.get(i));
    }
  } // tabulate
  void arrange(int N) {               // arrange or map the first N tiles in sketch
  WordTile tile;
  for (int i=0; i < N; i++) {
    tile = wordFrequency.get(i);    // the tile to be placed
    tile.setFontSize();
    do {  // find a random x, y for tile, i
      float x = random(width-tile.tileW);
      float y = random(tile.tileH, height);
      tile.setXY(x, y);
    } // until the tile is clear of all other tiles
    while (!clear(i));
  }
} // arrange()
  void spiro(int N) {  // arrange or map the first N tiles in sketch
    WordTile tile;
    for (int i=0; i < N; i++) {
      tile = wordFrequency.get(i);
      tile.setFontSize();
      // Exploring the spiral layout
      float cx = width/2, cy = height/2, px, py;
      float R = 0.0, dR = 0.2, theta = 0.0, dTheta = 0.5;
      do {  // find the next x, y for tile, i in spiral
       float x = cx + R*cos(theta);
        float y = cy + R*sin(theta);
        tile.setXY(x, y);
        px = x;
        py = y;
        theta+=dTheta;
        R += dR;
      } // until the tile is clear of all other tiles
      while (!clear (i));
    }
  } // spiro()
  boolean clear(int n) { // Is tile, i clear of tiles 0..i-1?
    WordTile tile1 = wordFrequency.get(n);
    for (int i=0; i < n; i++) {
      WordTile tile2 = wordFrequency.get(i);
      if (tile1.intersect(tile2)) {
        return false;
      }
    } // for
    return true;
  } // clear()
  void display(int N) {
    for (int i=0; i < N; i++) {
      WordTile tile = wordFrequency.get(i);
      tile.display();
    }
  }  // display()
  int N() { // Number of table entries
      return wordFrequency.size();
  } // N()
    String[] samples() {  // Returns all the words
      String [] k = new String[N()];
      int i=0;
      for (WordTile w : wordFrequency) {
        k[i++] = w.getWord();
      }
      return k;
    } // samples()
    int[] counts() {  // Returns all the frequencies
      int [] v = new int[N()];
      int i=0;
      for (WordTile w : wordFrequency) {
        v[i++] = w.getFreq();
      }
      return v;
    } // counts()
    int maxFreq() {  // The max frequency
      return max(counts());
    } // maxFreq()
    int _search(String w, ArrayList<WordTile> L) {
      // search for word w  in L.
      // Returns index of w in L if found, -1 o/w
      for (int i=0; i < L.size(); i++) {
        if (L.get(i).getWord().equals(w))
          return i;
      }
      return -1;
    } // _search()
    boolean _isStopWord(String word) {  // Is word a stop word?
     for (String stopWord : stopWords) {
        if (word.equals(stopWord)) {
          return true;
        }
      }
      return false;
    } // _isStopWord()
    String toString() {  // Print representation
      return "Word Frequency Table with"+N()+" entries.";
    } // toString()
  } // class WordFreq
