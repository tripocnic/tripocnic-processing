
ControlFrame controlFrame;
boolean saveNextFrame = false;

void settings() {
    // fullScreen(P3D, 2);
    // size(1000, 1000, P3D);
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
        resetCurrentScene = true;
        changedScene = false;
    }
    if (resetCurrentScene) {
        controlFrame.reset();
        currentScene.reset();
        resetCurrentScene = false;
    }

    currentScene.show();
    if (saveNextFrame) {
        saveCurrentFrame();
        saveNextFrame = false;
    }
    showStatistics();

    pop();
}
