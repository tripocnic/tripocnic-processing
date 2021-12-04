SceneHandler[] scenes;
SceneHandler currentScene;
int currentSceneNb = 0;

boolean changedScene = true;

void setupScenes()
{
    scenes = new SceneHandler[] {
        new Scene00(),
        new Scene01(),
    };
    currentSceneNb = scenes.length;
}

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
