class Grid {

    int nbCellX;
    int nbCellY;

    int defaultNbCellsX;
    int defaultNbCellsY;
    int gridWidth;
    int gridHeight;

    GridCell[] cells;
    boolean drawBorders;

    Tiles tiles;
    int strokeWeight = 4;

    boolean dirty = true;
    boolean needRedraw = true;

    Grid(int defaultNbCellsX, int defaultNbCellsY, int gridWidth, int gridHeight)
    {
        this.defaultNbCellsX = defaultNbCellsX;
        this.defaultNbCellsY = defaultNbCellsY;
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
    }

    void initGrid(int nbCellX, int nbCellY)
    {
        this.nbCellX = nbCellX;
        this.nbCellY = nbCellY;

        initCells();
    }

    void initCells()
    {
        this.cells = new GridCell[nbCellX * nbCellY];
        int cellWidth = floor(gridWidth / nbCellX + 1);
        int cellHeight = floor(gridHeight / nbCellY + 1);

        for (int i = 0; i < nbCellY; ++i)
        {
            for (int j = 0; j < nbCellX; ++j)
            {
                this.cells[j+i*nbCellX] = new GridCell(j*cellWidth, i*cellHeight, cellWidth, cellHeight);
                this.cells[j+i*nbCellX].setTiles(tiles);
            }
        }
        println("Grid set to: number of cells:", nbCellX, "x", nbCellY, "-> cell size:", cellWidth, "x", cellHeight);
    }

    void draw()
    {
        if (dirty) {
            initGrid(nbCellX, nbCellY);
            dirty = false;
            needRedraw = true;
        }

        if (!needRedraw) {
            return;
        }

        background(0);
        pushStyle();
        colorMode(RGB);
        stroke(255, 255);
        strokeWeight(strokeWeight);
        strokeCap(ROUND);
        strokeJoin(ROUND);
        ellipseMode(CENTER);
        noFill();

        for (int i = 0; i < nbCellX * nbCellY; ++i)
        {
            GridCell currentCell = cells[i];

            currentCell.draw(drawBorders);
        }
        popStyle();
        needRedraw = false;
    }

    void reset()
    {
        nbCellX = defaultNbCellsX;
        nbCellY = defaultNbCellsY;
        drawBorders = false;
        strokeWeight = 4;
        dirty = true;
    }

    void setTiles(Tiles tiles)
    {
        if (this.tiles == tiles) {
            return;
        }
        this.tiles = tiles;
        dirty = true;
    }

    void setSize(int newNbOfCells)
    {
        if (newNbOfCells <= 0) { newNbOfCells = 1; }
        else if (newNbOfCells > 150) { newNbOfCells = 150; }

        if (newNbOfCells == nbCellX) {
            return;
        }

        nbCellX = newNbOfCells;
        nbCellY = newNbOfCells;
        dirty = true;
    }

    void setStrokeWeight(int newStrokeWeight)
    {
        if (newStrokeWeight < 1) { newStrokeWeight = 1; }

        if (newStrokeWeight == strokeWeight) {
            return;
        }

        strokeWeight = newStrokeWeight;
        needRedraw = true;
    }

    void setDrawCellBorders(boolean newDrawBorders)
    {
        if (newDrawBorders == drawBorders) {
            return;
        }

        drawBorders = newDrawBorders;
        needRedraw = true;
    }
}