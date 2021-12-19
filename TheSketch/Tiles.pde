
abstract class Tiles
{
    abstract void draw(int x, int y, int w, int h, int tileToDraw);
    abstract int nbTiles();
    int getRandomTileValue() { return int(random(nbTiles())); }
}

// Examples
class TileSimple extends Tiles
{
    static final int LEFT = 0;
    static final int RIGHT = 1;

    int nbTiles() { return 2; }

    void draw(int x, int y, int w, int h, int tileToDraw)
    {
        switch(tileToDraw) {
            case RIGHT:
                line(x + w / 2, y, x + w, y + h / 2);
                line(x, y + h / 2, x + w / 2, y + h);
                break;
            case LEFT:
                line(x + w / 2, y, x, y + h / 2);
                line(x + w, y + h / 2, x + w / 2, y + h);
                break;
        }
    }
}

class TileArcs extends Tiles
{
    static final int LEFT = 0;
    static final int RIGHT = 1;
    int nbTiles() { return 2; }

    void draw(int x, int y, int w, int h, int tileToDraw)
    {
        switch(tileToDraw) {
            case RIGHT:
                arc(x, y + h, w, h, PI + HALF_PI, TWO_PI);
                arc(x + w, y, w, h, HALF_PI, PI);
                break;
            case LEFT:
                arc(x, y, w, h, 0, HALF_PI);
                arc(x + w, y + h, w, h, PI, PI + HALF_PI);
                break;
        }
    }
}

class TileRoad extends Tiles
{
    static final int ARC1 = 0;
    static final int ARC2 = 1;
    static final int CROSS = 2;
    static final int ROUNDABOUT = 3;
    int nbTiles() { return 4; }

    void draw(int x, int y, int w, int h, int tileToDraw)
    {
        switch(tileToDraw) {
            case ARC1:
                arc(x, y + h, w, h, PI + HALF_PI, TWO_PI);
                arc(x + w, y, w, h, HALF_PI, PI);
                break;
            case ARC2:
                arc(x, y, w, h, 0, HALF_PI);
                arc(x + w, y + h, w, h, PI, PI + HALF_PI);
                break;
            case CROSS:
                line(x + w / 2, y, x + w /2, y + h);
                line(x, y + h / 2, x + w, y + h / 2);
                break;
            case ROUNDABOUT:
                line(x + w / 2, y, x + w /2, y + h / 4);
                line(x, y + h / 2, x + w / 4, y + h / 2);
                line(x + w /2, y + h, x + w / 2, y + h - h / 4);
                line(x + w, y + h / 2, x + w - w / 4, y + h / 2);
                ellipse(x + w /2, y + h /2, w / 2, h / 2);
                break;
        }
    }
}