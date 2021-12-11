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
        controlFrame.cp5.getController("slider4").setLabel("Size");
        xy.setLabel("XY");
        xy.setCursorX(width/2);
        xy.setCursorY(height/2);
    }

    void show() {
        background(0);
        noStroke();
        fill(255);

        for (int i = 0; i <= width; i += 20) {
            for (int j = 0; j <= height; j += 20) {
                float size = dist(xy.getArrayValue()[0], xy.getArrayValue()[1], i, j);
                size= size / max_distance * slider4;
                ellipse(i, j, size, size);
            }
        }
    }
}