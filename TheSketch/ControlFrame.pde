import controlP5.*;

// selectedScene
int selectedSceneNb;

// -10 to 10
int slider1, slider2, slider3;

// 1 to 100
int slider4;

// 1 to 1000
int slider5;

class ControlFrame extends PApplet {

    int w, h;
    PApplet parent;
    ControlP5 cp5;

    public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
        super();
        parent = _parent;
        w = _w;
        h = _h;
        PApplet.runSketch(new String[]{this.getClass().getName()}, this);
    }

    public void settings() {
        size(w, h);
    }

    public void setup() {
        surface.setLocation(10, 10);
        cp5 = new ControlP5(this);

        cp5.addSlider("selectedSceneNb")
           .plugTo(parent, "selectedSceneNb")
           .setPosition(50, 20)
           .setSize(250, 30)
           .setRange(0, scenes.length - 1)
           .setValue(currentSceneNb)
           .setNumberOfTickMarks(scenes.length)
           .setSliderMode(Slider.FLEXIBLE);

        cp5.addSlider("slider1")
           .plugTo(parent, "slider1")
           .setRange(-10, 10)
           .setPosition(50, 100)
           .setSize(250, 20);

        cp5.addSlider("slider2")
           .plugTo(parent, "slider2")
           .setRange(-10, 10)
           .setPosition(50, 140)
           .setSize(250, 20);

        cp5.addSlider("slider3")
           .plugTo(parent, "slider3")
           .setRange(-10, 10)
           .setPosition(50, 180)
           .setSize(250, 20);

        cp5.addSlider("slider4")
           .plugTo(parent, "slider4")
           .setRange(1, 100)
           .setPosition(50, 230)
           .setSize(250, 25);

        cp5.addSlider("slider5")
           .plugTo(parent, "slider5")
           .setRange(1, 1000)
           .setPosition(50, 280)
           .setSize(250, 25);

        reset();
    }

    void reset() {
        cp5.getController("slider1").setValue(0);
        cp5.getController("slider2").setValue(0);
        cp5.getController("slider3").setValue(0);
        cp5.getController("slider4").setValue(50);
        cp5.getController("slider5").setValue(50);
    }

    void draw() {
        background(170);
    }

    void keyPressed() {
        if (key == 'R') {
            println("Reset controllers values");
            reset();
        }
    }
}