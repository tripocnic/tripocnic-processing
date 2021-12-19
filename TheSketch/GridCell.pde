public class GridCell
{
    int posX;
    int posY;
    int cellWidth;
    int cellHeight;
    Tiles tiles;
    int tileToDraw;

    public GridCell(int posX, int posY, int cellWidth, int cellHeight)
    {
        this.posX = posX;
        this.posY = posY;
        this.cellWidth = cellWidth;
        this.cellHeight = cellHeight;
    }

    void setTiles(Tiles tiles)
    {
        this.tiles = tiles;
        if (tiles != null) {
            tileToDraw = tiles.getRandomTileValue();
        }
    }

    void draw(boolean drawBorders)
    {
        if (tiles != null) {
            tiles.draw(posX, posY, cellWidth, cellHeight, tileToDraw);
        }
        if (drawBorders)
        {
            drawBorders();
        }
    }

    void drawBorders()
    {
        pushStyle();
        colorMode(RGB);
        stroke(255,0,0,175);
        strokeWeight(1);
        noFill();
        rect(posX, posY, cellWidth, cellHeight);
        popStyle();
    }

}