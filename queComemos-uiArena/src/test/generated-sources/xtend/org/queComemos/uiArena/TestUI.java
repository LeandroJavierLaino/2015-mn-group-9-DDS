package org.queComemos.uiArena;

import org.junit.Test;
import org.queComemos.uiArena.QueComemosMainWindow;
import testeo.Grupos;

@SuppressWarnings("all")
public class TestUI extends Grupos {
  @Test
  public void PruebaDeLogeo() {
    QueComemosMainWindow _queComemosMainWindow = new QueComemosMainWindow();
    _queComemosMainWindow.startApplication();
  }
}
