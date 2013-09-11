public void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/datos")) {
    if (theOscMessage.checkTypetag("f")) {
      frec_ = theOscMessage.get(0).floatValue();
    }
  }
  else if (theOscMessage.checkAddrPattern("/vel")) {
    if (theOscMessage.checkTypetag("f")) {
      amp_ = theOscMessage.get(0).floatValue();
    }
  }
}
