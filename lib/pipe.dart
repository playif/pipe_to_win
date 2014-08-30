part of PIPE;


class Pipe extends Sprite {
  bool inMap = false;
  int pipeType = 0;


  Pipe(Game game, int pipeType):super(game) {
    this.pipeType = pipeType;

    Graphics g = game.make.graphics();
    g.beginFill(0xffffff);
    g.drawCircle(0, 0, 15);
    g.endFill();
    drawPipe(g);

    g.anchor.setTo(0.5);

    addChild(g);

    inputEnabled = true;
    input.enableDrag();
    input.enableSnap(60, 60);
    input.snapOffsetX = input.snapOffsetY = 30;

    anchor.setTo(0.5);
    width = height = 60;
  }


  drawPipe(Graphics g) {

    g.beginFill(0xff0000);
    g.drawRect(-10, -5, 20, 10);
    g.drawTriangle([new Point(5, -10), new Point(15, 0), new Point(5, 10)]);

    switch (pipeType) {
      case 0:
        break;
      case 1:
        g.angle=90;

        break;
      case 2:
        g.angle=180;

        break;
      case 3:
        g.angle=270;

        break;
    }

    g.endFill();
  }


}
