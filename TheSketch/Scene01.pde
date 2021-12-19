class Scene01 extends SceneHandler
{
    public Scene01() {
        sceneName = "TheTruchetTiles";
    }

    Grid grid;
    int nbOfDefaultCellsPerRowColumn = 15;
    int currentNbOfCellsPerRowColumn;
    int defaultStrokeWeight = 4;
    int currentStrokeWeight;
    boolean defaultDrawCellBorders = false;
    boolean currentDrawCellBorders;

    void setup() {
        println("Setup: " + sceneName);

        grid = new Grid(nbOfDefaultCellsPerRowColumn, nbOfDefaultCellsPerRowColumn, width, height);

        Tiles tiles = new TileSimple();
        grid.setTiles(tiles);

        setupDone = true;
    }

    void reset() {
        println("Reset: " + sceneName);
        slider4.setLabel("Grid Size");
        slider4.setValue(nbOfDefaultCellsPerRowColumn + .001); // bug? 15 -> 14 without .001
        slider5.setRange(1, 100);
        slider5.setLabel("StrokeWeight");
        slider5.setValue(defaultStrokeWeight);
        toggle1.setLabel("Show Grid Border");
        toggle1.setValue(defaultDrawCellBorders);
        grid.reset();
    }

    void show() {
        currentNbOfCellsPerRowColumn = round(slider4.getValue());
        grid.setSize(currentNbOfCellsPerRowColumn);

        currentStrokeWeight = round(slider5.getValue());
        grid.setStrokeWeight(currentStrokeWeight);

        currentDrawCellBorders = toggle1.getBooleanValue();
        grid.setDrawCellBorders(currentDrawCellBorders);

        grid.draw();
    }
}