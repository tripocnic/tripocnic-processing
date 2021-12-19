SceneHandler[] scenes;
SceneHandler currentScene;
int currentSceneNb = 0;

boolean changedScene = true;
boolean resetCurrentScene = false;

class SceneHandler
{
    String sceneName;
    boolean setupDone;

    SceneHandler() {
        sceneName = "UNDEFINED";
        setupDone = false;
    }
    void setup() {}
    void reset() {}
    void show() {}
}

void setupScenes()
{
    scenes = new SceneHandler[] {
        new Scene00(),
        new Scene01(),
    };
    currentSceneNb = scenes.length;
}

void resetCurrentSceneWith_r(PApplet sketch)
{
    if (sketch.key != 'r') {
        return;
    }
    resetCurrentScene = true;
}

void printSceneNamesWith_l(PApplet sketch)
{
    if (sketch.key != 'l') {
        return;
    }

    println("------ Scenes list");
    for (int i = 0; i < scenes.length; ++i) {
        println("  " + nf(i, 2) + " : " + scenes[i].sceneName);
    }
}


void saveCurrentFrame()
{
    String timestamp = year() + nf(month(), 2) + nf(day(), 2)
        + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)
        + "_" + nf(millis(), 8);

    String filename = "SavedFrames/" + getClass().getName()
        + "_" + timestamp + ".png";
    saveFrame(filename);
    println("Frame saved: " + filename);
}