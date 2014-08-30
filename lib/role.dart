part of PIPE;


class Role extends Sprite {
  Role(Game game, Map map):super(game) {

    Graphics g = game.make.graphics();
    g.beginFill(0xffffff);
    g.drawCircle(0, 0, 10);
    g.endFill();
    g.anchor.setTo(0.5);

    addChild(g);

//    int cx = 0;
//    int cy = 0;

    run([Role role]) {
      if (map.pipes[x~/60][y~/60] != null) {
        Pipe pipe=map.pipes[x~/60][y~/60];
        switch (pipe.pipeType) {
          case 0:
            game.add.tween(this).to({'x':x+60},2000).start().onComplete.add(run);
            break;
          case 1:
            game.add.tween(this).to({'y':y+60},2000).start().onComplete.add(run);
            break;
          case 2:
            game.add.tween(this).to({'x':x-60},2000).start().onComplete.add(run);
            break;
          case 3:
            game.add.tween(this).to({'y':y-60},2000).start().onComplete.add(run);
            break;
        }


      }
    }

    game.time.events.add(5000, run);

//    inputEnabled=true;
//    input.enableDrag();
    anchor.setTo(0.5);
    width = height = 60;
    position.set(30);
  }
}
