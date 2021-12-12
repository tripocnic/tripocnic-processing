// http://www.sojamo.de/libraries/controlP5/reference/index.html
import controlP5.*;

// selectedScene
int selectedSceneNb;

// -10 to 10
Slider slider1, slider2, slider3;

// 1 to 100
Slider slider4;

// 1 to 1000
Slider slider5;

// slider2D
Slider2D xy;

// toggles
Toggle toggle1, toggle2, toggle3;

class ControlFrame extends PApplet {

    int w, h;
    PApplet parent;
    ControlP5 cp5;

    boolean ready = false;

    public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
        super();
        parent = _parent;
        w = _w;
        h = _h;
        PApplet.runSketch(new String[]{this.getClass().getName()}, this);
    }

    public void settings() {
        size(w, h);
        smooth(8);
    }

    public void setup() {
        surface.setLocation(10, 10);
        cp5 = new ControlP5(this);

        cp5.addSlider("selectedSceneNb")
           .plugTo(parent, "selectedSceneNb")
           .setLabel("Scene Selector")
           .setPosition(50, 20)
           .setSize(250, 30)
           .setRange(0, scenes.length - 1)
           .setValue(currentSceneNb)
           .setNumberOfTickMarks(scenes.length)
           .setSliderMode(Slider.FLEXIBLE);

        slider1 = cp5.addSlider("slider1")
           .setPosition(50, 80)
           .setSize(250, 20)
           .setDecimalPrecision(0);

        slider2 = cp5.addSlider("slider2")
           .setPosition(50, 110)
           .setSize(250, 20)
           .setDecimalPrecision(0);

        slider3 = cp5.addSlider("slider3")
           .setPosition(50, 140)
           .setSize(250, 20)
           .setDecimalPrecision(0);

        slider4 = cp5.addSlider("slider4")
           .setPosition(50, 180)
           .setSize(250, 25)
           .setDecimalPrecision(0);

        slider5 = cp5.addSlider("slider5")
           .setPosition(50, 215)
           .setSize(250, 25)
           .setDecimalPrecision(0);

        xy = cp5.addSlider2D("XY")
            .setPosition(50, 260)
            .setSize(250, 250)
            .setMinMax(0, 0, parent.width, parent.height);

        toggle1 = cp5.addToggle("toggle1")
            .setPosition(50,530)
            .setSize(50,20);

        toggle2 = cp5.addToggle("toggle2")
            .setPosition(150,530)
            .setSize(50,20);

        toggle3 = cp5.addToggle("toggle3")
            .setPosition(250,530)
            .setSize(50,20);

        reset();
    }

    void reset() {
        slider1.setRange(-10, 10);
        slider1.setValue(0);
        slider1.setLabel("Not_Used");

        slider2.setRange(-10, 10);
        slider2.setValue(0);
        slider2.setLabel("Not_Used");

        slider3.setRange(-10, 10);
        slider3.setValue(0);
        slider3.setLabel("Not_Used");

        slider4.setRange(1, 100);
        slider4.setValue(50);
        slider4.setLabel("Not_Used");

        slider5.setRange(1, 1000);
        slider5.setValue(50);
        slider5.setLabel("Not_Used");

        xy.setValue(0, 0);
        xy.setLabel("Not_Used");

        toggle1.setValue(false);
        toggle1.setLabel("Not_Used");
        toggle2.setValue(false);
        toggle2.setLabel("Not_Used");
        toggle3.setValue(false);
        toggle3.setLabel("Not_Used");

        ready = true;
    }

    void draw() {
        background(170);
    }

    void keyPressed() {
        handleKeys(this);
    }
}