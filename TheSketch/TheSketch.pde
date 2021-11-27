
ControlFrame cf;

void settings() {
    // fullScreen(P3D, 2);
    // size(1080, 1080, P3D);
    size(640, 640, P3D);
    smooth(8);
}

void setup() {

    showStatistics = false;

    setupScenes();

    // Open the Controls window
    cf = new ControlFrame(this, 400, 640, "Controls");
    surface.setLocation(420, 10);
}

void draw() {

    if (selectedScene != currentScene) {
        changedScene = true;
        currentScene = selectedScene;
    }
    if (changedScene) {
        background(0);
        surface.setTitle("TheSketch || Scene: "
            + scenes[selectedScene].sceneName + "(" + selectedScene + ")");
        changedScene = false;
    }
    scenes[selectedScene].show();
    showStatistics();
}
