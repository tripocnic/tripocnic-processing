class Scene00 extends SceneHandler
{

    public Scene00() {
        sceneName = "Scene 00";
    }

    void setup() {
        println("Setup: " + sceneName);
        setupDone = true;
    }

    void reset() {
        println("Reset: " + sceneName);
    }

    void show() {
        background(0);
        noFill();
        stroke(255);
        rect(50,50, 180,50);
        fill(255);
        textSize(32);
        text("TheSketch", 60,85);
    }
}