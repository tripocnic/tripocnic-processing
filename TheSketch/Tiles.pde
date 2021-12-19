
abstract class Tiles
{
    abstract void draw(int x, int y, int w, int h, int tileToDraw);
    abstract int nbTiles();
    int getRandomTileValue() { return int(random(nbTiles())); }
}

// Example
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
