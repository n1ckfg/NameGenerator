void keyPressed() {
  switch(key) {
    case(' '):
      getOutput();
      break;
    case('c'):
      camelCase = !camelCase;
      break;
  }
}