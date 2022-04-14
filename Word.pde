// Sketch 7-9b: The Word class
class Word {
  // Each Word is a pair: the word, and its frequency
  String word;
  int freq;
  Word(String newWord) {  // Constructor
    word = newWord;
    freq = 1;
  } // Word()
  String getWord() {
    return word;
  } // getWord()
  int getFreq() {
    return freq;
  } // getFreq()
  void incr() {  // increments the word count
    freq++;
  } // incr()
  String toString() {  // print representation of Word objects
    return "<"+word+", "+freq+">";
  } // toString()
} // class Word
