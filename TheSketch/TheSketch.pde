
ControlFrame controlFrame;

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
    controlFrame = new ControlFrame(this, 400, 640, "Controls");
    surface.setLocation(420, 10);
}

void draw() {

    push();

    if (selectedSceneNb != currentSceneNb) {
        changedScene = true;
        currentSceneNb = selectedSceneNb;
        currentScene = scenes[currentSceneNb];
    }
    if (changedScene) {
        background(0);
        surface.setTitle("TheSketch || Scene: "
            + currentScene.sceneName + "(" + currentSceneNb + ")");

        if (!currentScene.setupDone) {
            currentScene.setup();
        }
        currentScene.reset();
        controlFrame.reset();
        changedScene = false;
    }

    currentScene.show();
    showStatistics();

    pop();
}
