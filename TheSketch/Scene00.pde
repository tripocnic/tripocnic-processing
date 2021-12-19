class Scene00 extends SceneHandler
{

    float x, y;
    float circleSize;

    public Scene00() {
        sceneName = "TheTemplate";
    }

    void setup() {
        println("Setup: " + sceneName);
        setupDone = true;
    }

    void reset() {
        println("Reset: " + sceneName);
        slider4.setLabel("Circle Size");
        xy.setLabel("XY")
            .setCursorX(50)
            .setCursorY(50);
    }

    void show() {
        background(0);
        x = round(xy.getArrayValue()[0]);
        y = round(xy.getArrayValue()[1]);
        circleSize = round(slider4.getValue());

        noFill();
        stroke(255);
        rect(x, y, 180,50);
        fill(255);
        textSize(32);
        text("TheSketch", x + 10, y + 35);
        circle(width, height, 5 * circleSize);
    }
}