class Scene01 extends SceneHandler
{
    public Scene01() {
        sceneName = "Scene 01";
    }

    float max_distance = dist(0, 0, width, height);

    void setup() {
        println("Setup: " + sceneName);
        setupDone = true;
    }

    void reset() {
        println("Reset: " + sceneName);
    }

    void show() {
        background(0);
        noStroke();
        fill(255);

        for (int i = 0; i <= width; i += 20) {
            for (int j = 0; j <= height; j += 20) {
                float size = dist(mouseX, mouseY, i, j);
                size= size / max_distance * slider4;
                ellipse(i, j, size, size);
            }
        }
    }
}