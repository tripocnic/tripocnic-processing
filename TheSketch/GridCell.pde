public class GridCell
{
    int posX;
    int posY;
    int cellWidth;
    int cellHeight;

    public GridCell(int posX, int posY, int cellWidth, int cellHeight)
    {
        this.posX = posX;
        this.posY = posY;
        this.cellWidth = cellWidth;
        this.cellHeight = cellHeight;
    }

    void draw(boolean drawBorders)
    {
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