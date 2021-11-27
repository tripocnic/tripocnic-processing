SceneHandler[] scenes;
boolean changedScene = true;
int currentScene = 0;

void setupScenes()
{
    scenes = new SceneHandler[] {
        new Scene00(),
        new Scene01(),
    };
}

class SceneHandler
{
    String sceneName;

    SceneHandler() {
        sceneName = "UNDEFINED";
    }
    void setup() {}
    void show() {}
}
