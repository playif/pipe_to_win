part of PIPE;


class PipeQueue extends Group {
  int maxPipe = 6;
  Map map;

  PipeQueue(Game game, Map map):super(game) {
    fillPipe();
    this.map = map;
    //createPipe();
  }

  fillPipe() {
    int count = maxPipe - children.where((Pipe p) => !p.inMap).length;
    for (int i = 0;i < count;i++) {
      createPipe();
    }

    arrangePipe();
  }

  arrangePipe() {
    int sx = 30;
    for (int i = 0;i < length;i++) {
      Pipe pipe = this.children[i];
      if (pipe.inMap)continue;
      pipe.x = sx;
      pipe.y = 510;
      sx += pipe.width;
    }
  }

  createPipe() {
    Pipe pipe = new Pipe(game,game.rnd.integerInRange(0,3));

    pipe.events.onDragStop.add((Pipe pipe, Pointer point) {
      if (pipe.world.y < 480 && pipe.world.x < 480 && map.setPipe(pipe)) {
        fillPipe();

      }
      else {

        arrangePipe();

      }
    });

    add(pipe);
  }


}
