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

    boolean defaultIsFilled = true;
    boolean currentIsFilled;

    int noiseLod; // number of octaves to be used by the noise
    float noiseFallOff; // falloff factor for each octave
    float noiseX;
    float noiseY;

    void setup() {
        println("Setup: " + sceneName);

        grid = new Grid(nbOfDefaultCellsPerRowColumn, nbOfDefaultCellsPerRowColumn, width, height);
        tilesSet = new TilesSet();

        setupDone = true;
    }

    void reset() {
        println("Reset: " + sceneName);
        slider1.setRange(0, 20)
            .setLabel("Noise Lod")
            .setValue(4)
            .setNumberOfTickMarks(20)
            .setSliderMode(Slider.FLEXIBLE);
        slider2.setLabel("Noise Falloff")
            .setRange(0, 1)
            .setValue(.35)
            .setDecimalPrecision(2);
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
        toggle2.setLabel("Fill")
            .setValue(defaultIsFilled);
        xy.setLabel("Noise Pos")
            .setValue(0, 0)
            .setMinMax(0, 0, 100, 100);
        grid.reset();
    }

    void show() {
        if (!controlFrame.controlsChanged)
        {
            return;
        }

        currentTilesStyle = round(slider3.getValue());
        grid.setTiles(tilesSet.get(currentTilesStyle));

        currentNbOfCellsPerRowColumn = round(slider4.getValue());
        grid.setSize(currentNbOfCellsPerRowColumn);

        currentIsFilled = toggle2.getBooleanValue();

        noiseLod = round(slider1.getValue());
        noiseFallOff = slider2.getValue();
        noiseDetail(noiseLod, noiseFallOff);

        noiseX = xy.getArrayValue()[1];
        noiseY = xy.getArrayValue()[0];

        GridCellData[] cellsData = new GridCellData[currentNbOfCellsPerRowColumn * currentNbOfCellsPerRowColumn];
        float iOff = noiseX;
        for (int i = 0; i < currentNbOfCellsPerRowColumn; ++i)
        {
            float jOff = noiseY;
            for (int j = 0; j < currentNbOfCellsPerRowColumn; ++j)
            {
                PerlinData perlinData = new PerlinData();
                perlinData.noise = noise(iOff, jOff);
                perlinData.isFilled = currentIsFilled;
                cellsData[j+i*currentNbOfCellsPerRowColumn] = perlinData;
                jOff += 0.1;
            }
            iOff += 0.1;
        }
        grid.setCellsData(cellsData);

        currentStrokeWeight = round(slider5.getValue());
        grid.setStrokeWeight(currentStrokeWeight);

        currentDrawCellBorders = toggle1.getBooleanValue();
        grid.setDrawCellBorders(currentDrawCellBorders);

        grid.draw();

        controlFrame.acknowledgeControls();
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
        boolean isFilled;
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
                    push();
                    rectMode(CENTER);
                    noFill();
                    if (perlinData.isFilled) {
                        fill(255);
                    }
                    rect(x + w / 2, y + h / 2, w * perlinData.noise, h * perlinData.noise);
                    pop();
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
                    push();
                    ellipseMode(CENTER);
                    noFill();
                    if (perlinData.isFilled) {
                        fill(255);
                    }
                    ellipse(x + w / 2, y + h / 2, w * perlinData.noise, h * perlinData.noise);
                    pop();
                    break;
            }
        }
    }
}
