class Grid {

    int nbCellX;
    int nbCellY;

    int defaultNbCellsX;
    int defaultNbCellsY;
    int gridWidth;
    int gridHeight;

    GridCell[] cells;
    boolean drawBorders;

    boolean dirty = true;
    boolean needRedraw = true;

    int strokeWeight = 4;

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

    void setSize(int nbOfCells)
    {
        int nbOfCellsPerRowColumn = nbCellX;

        nbOfCellsPerRowColumn = nbOfCells;
        if (nbOfCellsPerRowColumn <= 0) { nbOfCellsPerRowColumn = 1; }
        else if (nbOfCellsPerRowColumn > 150) { nbOfCellsPerRowColumn = 150; }

        if (nbOfCellsPerRowColumn != nbCellX)
        {
            nbCellX = nbOfCellsPerRowColumn;
            nbCellY = nbOfCellsPerRowColumn;
            dirty = true;
        }
    }

    void setDrawCellBorders(boolean value)
    {
        if (value == drawBorders) {
            return;
        }
        drawBorders = value;
        needRedraw = true;
    }
}