class Scene02 extends SceneHandler
{
    public Scene02() {
        sceneName = "ThePerlinGrid";
    }

    Grid grid;
    TilesSet tilesSet;
    int defaultTilesStyle = 0;
    int currentTilesStyle;
    int nbOfDefaultCellsPerRowColumn = 15;
    int currentNbOfCellsPerRowColumn;
    int defaultStrokeWeight = 4;
    int currentStrokeWeight;
    boolean defaultDrawCellBorders = false;
    boolean currentDrawCellBorders;

    void setup() {
        println("Setup: " + sceneName);

        grid = new Grid(nbOfDefaultCellsPerRowColumn, nbOfDefaultCellsPerRowColumn, width, height);
        tilesSet = new TilesSet();

        setupDone = true;
    }

    void reset() {
        println("Reset: " + sceneName);
        slider3.setRange(0, tilesSet.nbTiles() - 1)
           .setLabel("Tiles style")
           .setValue(0)
           .setNumberOfTickMarks(tilesSet.nbTiles())
           .setSliderMode(Slider.FLEXIBLE);
        slider4.setLabel("Grid Size")
           .setValue(nbOfDefaultCellsPerRowColumn +.001); // bug? 15 -> 14 without .001
        slider5.setRange(1, 100)
           .setLabel("StrokeWeight")
           .setValue(defaultStrokeWeight);
        toggle1.setLabel("Show Grid Border")
           .setValue(defaultDrawCellBorders);
        grid.reset();
    }

    void show() {
        currentTilesStyle = round(slider3.getValue());
        grid.setTiles(tilesSet.get(currentTilesStyle));

        currentNbOfCellsPerRowColumn = round(slider4.getValue());
        grid.setSize(currentNbOfCellsPerRowColumn);

        if (grid.dirty) {
            GridCellData[] cellsData = new GridCellData[currentNbOfCellsPerRowColumn * currentNbOfCellsPerRowColumn];
            float iOff = 0.0;
            for (int i = 0; i < currentNbOfCellsPerRowColumn; ++i)
            {
                float jOff = 0.0;
                for (int j = 0; j < currentNbOfCellsPerRowColumn; ++j)
                {
                    PerlinData perlinData = new PerlinData();
                    perlinData.noise = noise(iOff, jOff);
                    cellsData[j+i*currentNbOfCellsPerRowColumn] = perlinData;
                    jOff += 0.1;
                }
                iOff += 0.1;
            }
            grid.setCellsData(cellsData);
        }

        currentStrokeWeight = round(slider5.getValue());
        grid.setStrokeWeight(currentStrokeWeight);

        currentDrawCellBorders = toggle1.getBooleanValue();
        grid.setDrawCellBorders(currentDrawCellBorders);

        grid.draw();
    }

    class TilesSet
    {
        ArrayList<Tiles> tiles;

        final int SQUARE = 0;

        TilesSet()
        {
            tiles = new ArrayList<Tiles>();

            TilePerlinSquare tilePerlinSquare = new TilePerlinSquare();
            tiles.add(tilePerlinSquare);

            TilePerlinCircle tilePerlinCircle = new TilePerlinCircle();
            tiles.add(tilePerlinCircle);
        }

        int nbTiles() {
            return tiles.size();
        }

        Tiles get(int index)
        {
            return tiles.get(index);
        }
    }

    class PerlinData extends GridCellData
    {
        float noise;
    }

    class TilePerlinSquare extends Tiles
    {
        static final int PERLIN1 = 0;
        int nbTiles() { return 1; }

        void draw(int x, int y, int w, int h, int tileToDraw, GridCellData data)
        {
            PerlinData perlinData = (PerlinData)data;

            switch(tileToDraw) {
                case PERLIN1:
                    pushStyle();
                    rectMode(CENTER);
                    fill(255);
                    rect(x + w / 2, y + h / 2, w * perlinData.noise, h * perlinData.noise);
                    popStyle();
                    break;
            }
        }
    }

    class TilePerlinCircle extends Tiles
    {
        static final int PERLIN1 = 0;
        int nbTiles() { return 1; }

        void draw(int x, int y, int w, int h, int tileToDraw, GridCellData data)
        {
            PerlinData perlinData = (PerlinData)data;

            switch(tileToDraw) {
                case PERLIN1:
                    pushStyle();
                    ellipseMode(CENTER);
                    fill(255);
                    ellipse(x + w / 2, y + h / 2, w * perlinData.noise, h * perlinData.noise);
                    popStyle();
                    break;
            }
        }
    }
}
