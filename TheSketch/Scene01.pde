class Scene01 extends SceneHandler
{
    public Scene01() {
        sceneName = "TheTruchetTiles";
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
        slider3.setRange(0, tilesSet.nbTiles()-1)
            .setLabel("Tiles style")
            .setValue(0)
            .setNumberOfTickMarks(tilesSet.nbTiles())
            .setSliderMode(Slider.FLEXIBLE);
        slider4.setLabel("Grid Size")
            .setValue(nbOfDefaultCellsPerRowColumn + .001); // bug? 15 -> 14 without .001
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

        currentStrokeWeight = round(slider5.getValue());
        grid.setStrokeWeight(currentStrokeWeight);

        currentDrawCellBorders = toggle1.getBooleanValue();
        grid.setDrawCellBorders(currentDrawCellBorders);

        grid.draw();
    }
}

class TilesSet
{
    ArrayList<Tiles> tiles;

    final int SIMPLE = 0;
    final int ARCS = 1;
    final int ROAD = 2;

    TilesSet()
    {
        tiles = new ArrayList<Tiles>();

        // SIMPLE
        TileSimple tileSimple = new TileSimple();
        tiles.add(tileSimple);

        // ARCS
        TileArcs tileArcs = new TileArcs();
        tiles.add(tileArcs);

        // ROAD
        TileRoad tileRoad = new TileRoad();
        tiles.add(tileRoad);
    }

    int nbTiles(){
        return tiles.size();
    }

    Tiles get(int index)
    {
      return tiles.get(index);
    }
}