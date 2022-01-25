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

    boolean controlsChanged;
    float slider1Value, slider2Value, slider3Value;
    boolean slider1Changed, slider2Changed, slider3Changed;

    float slider4Value, slider5Value;
    boolean slider4Changed, slider5Changed;

    float xyValue0, xyValue1;
    boolean xyChanged;

    boolean toggle1Value, toggle2Value, toggle3Value;
    boolean toggle1Changed, toggle2Changed, toggle3Changed;

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
           .setSize(250, 20);

        slider2 = cp5.addSlider("slider2")
           .setPosition(50, 110)
           .setSize(250, 20);

        slider3 = cp5.addSlider("slider3")
           .setPosition(50, 140)
           .setSize(250, 20);

        slider4 = cp5.addSlider("slider4")
           .setPosition(50, 180)
           .setSize(250, 25);

        slider5 = cp5.addSlider("slider5")
           .setPosition(50, 215)
           .setSize(250, 25);

        xy = cp5.addSlider2D("XY")
            .setPosition(50, 260)
            .setSize(250, 250);

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
        slider1.setRange(-10, 10)
            .showTickMarks(false)
            .snapToTickMarks(false)
            .setSliderMode(Slider.FIX)
            .setValue(0)
            .setDecimalPrecision(0)
            .setLabel("Not_Used");

        slider2.setRange(-10, 10)
            .showTickMarks(false)
            .snapToTickMarks(false)
            .setSliderMode(Slider.FIX)
            .setValue(0)
            .setDecimalPrecision(0)
            .setLabel("Not_Used");

        slider3.setRange(-10, 10)
            .showTickMarks(false)
            .snapToTickMarks(false)
            .setSliderMode(Slider.FIX)
            .setValue(0)
            .setDecimalPrecision(0)
            .setLabel("Not_Used");

        slider4.setRange(1, 100)
            .showTickMarks(false)
            .snapToTickMarks(false)
            .setSliderMode(Slider.FIX)
            .setValue(50)
            .setDecimalPrecision(0)
            .setLabel("Not_Used");

        slider5.setRange(1, 1000)
            .showTickMarks(false)
            .snapToTickMarks(false)
            .setSliderMode(Slider.FIX)
            .setValue(50)
            .setDecimalPrecision(0)
            .setLabel("Not_Used");

        xy.setValue(0, 0)
            .setLabel("Not_Used")
            .setMinMax(0, 0, parent.width, parent.height);

        toggle1.setValue(false)
            .setLabel("Not_Used");
        toggle2.setValue(false)
            .setLabel("Not_Used");
        toggle3.setValue(false)
            .setLabel("Not_Used");

        controlsChanged = true;
        ready = true;
    }

    void draw() {
        background(170);

        handleControlsValues();

        controlsChanged = slider1Changed || slider2Changed || slider3Changed || slider4Changed || slider5Changed;
        controlsChanged = controlsChanged || xyChanged;
        controlsChanged = controlsChanged || toggle1Changed || toggle2Changed || toggle3Changed;
    }

    void keyPressed() {
        handleKeys(this);
    }

    void acknowledgeControls()
    {
        slider1Changed = false;
        slider2Changed = false;
        slider3Changed = false;
        slider4Changed = false;
        slider5Changed = false;
        xyChanged = false;
        toggle1Changed = false;
        toggle2Changed = false;
        toggle3Changed = false;
        controlsChanged = false;
    }

    void handleControlsValues()
    {
        if (slider1.getValue() != slider1Value)
        {
            slider1Value = slider1.getValue();
            slider1Changed = true;
        }
        if (slider2.getValue() != slider2Value)
        {
            slider2Value = slider2.getValue();
            slider2Changed = true;
        }
        if (slider3.getValue() != slider3Value)
        {
            slider3Value = slider3.getValue();
            slider3Changed = true;
        }
        if (slider4.getValue() != slider4Value)
        {
            slider4Value = slider4.getValue();
            slider4Changed = true;
        }
        if (slider5.getValue() != slider5Value)
        {
            slider5Value = slider5.getValue();
            slider5Changed = true;
        }
        if (xy.getArrayValue()[0] != xyValue0 || xy.getArrayValue()[1] != xyValue1) {
            xyValue0 = xy.getArrayValue()[0];
            xyValue1 = xy.getArrayValue()[1];
            xyChanged = true;
        }
        if (toggle1.getBooleanValue() != toggle1Value)
        {
            toggle1Value = toggle1.getBooleanValue();
            toggle1Changed = true;
        }
        if (toggle2.getBooleanValue() != toggle2Value)
        {
            toggle2Value = toggle2.getBooleanValue();
            toggle2Changed = true;
        }
        if (toggle3.getBooleanValue() != toggle3Value)
        {
            toggle3Value = toggle3.getBooleanValue();
            toggle3Changed = true;
        }
    }
}