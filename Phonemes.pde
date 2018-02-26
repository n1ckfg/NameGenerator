String[] phonemes;

void initPhonemes() {
  phonemes = loadStrings("phonemes.txt");
  for (int i = 0; i < phonemes.length; i++) {
    phonemes[i] = phonemes[i].toLowerCase();
    println(phonemes[i]);
  }
}