class Scene00 extends SceneHandler
{

    public Scene00() {
        sceneName = "Scene 00";
    }

    void show() {
        noFill();
        stroke(0,0,255);
        rect(50,50, 150,50);
        fill(255);
        text("Showing Scene 1", 60,70);
    }
}