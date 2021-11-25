
float max_distance;

ControlFrame cf;

void settings() {
    // fullScreen(P3D, 2);
    // size(1080, 1080, P3D);
    size(640, 640, P3D);
    smooth(8);
}

void setup() {

    // Show statistics
    showStatistics = false;

    // Open the Controls window
    cf = new ControlFrame(this, 400, 640, "Controls");
    surface.setLocation(420, 10);

    noStroke();
    max_distance = dist(0, 0, width, height);
}

void draw() {
    drawScene();
    showStatistics();
}

void drawScene() {

    background(0);
    fill(255);

    for (int i = 0; i <= width; i += 20) {
        for (int j = 0; j <= height; j += 20) {
            float size = dist(mouseX, mouseY, i, j);
            size = size / max_distance * slider4;
            ellipse(i, j, size, size);
        }
    }
}
