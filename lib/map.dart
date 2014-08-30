part of PIPE;


class Map extends Group {
  List<List<Pipe>> pipes;
  Graphics g;

  Map(Game game): super(game) {
    pipes = new List<List<Pipe>>(8);


    g = game.make.graphics(0, 0);
    g.lineStyle(1, 0xffffff);
    num cell = 60;
    for (int i = 0; i < 8; i++) {
      pipes[i] = new List<Pipe>(8);
      for (int j = 0; j < 8; j++) {
        g.drawRect(cell * i, cell * j, cell, cell);
      }
    }

    addChild(g);
    //game.world.add(this);
  }

  setPipe(Pipe pipe) {
    add(pipe);
    int cx = pipe.x ~/ 60;
    int cy = pipe.y ~/ 60;

    if (pipes[cx][cy] == null) {

      pipe.inputEnabled = false;
      pipe.position.copyFrom(pipe.world);
      pipe.position.x = pipe.position.x ~/ 60 * 60 + 30;
      pipe.position.y = pipe.position.y ~/ 60 * 60 + 30;


      pipe.inMap = true;
      pipes[cx][cy] = pipe;
      return true;
    }

    return false;


  }
}
