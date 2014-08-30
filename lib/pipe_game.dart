library PIPE;

import "package:play_phaser/phaser.dart";

part "role.dart";
part "pipe.dart";
part "map.dart";
part "pipe_queue.dart";

class PipeGame extends State {
  Map map;
  PipeQueue queue;


  PipeGame() {
    game = new Game(480, 800, WEBGL, "", this);
  }

  preload() {

  }

  create() {
    map = new Map(game);
    map.setPipe(new Pipe(game, 0)
      ..x = 30
      ..y = 30);

    queue = new PipeQueue(game, map);

    Role role = new Role(game, map);
    game.world.add(role);


    //queue.y = 700;


//    Role role=new Role(game);
//    game.world.add(role);
  }

  update() {

  }

}
