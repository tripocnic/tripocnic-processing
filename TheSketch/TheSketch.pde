
float max_distance;

void settings() {
    // fullScreen(P3D, 2);
    // size(1080, 1080, P3D);
    // size(1280, 720, P3D);
    size(640, 640, P3D);
    smooth(8);
}

void setup() {

    // Show statistics
    showStatistics = false;

    noStroke();
    max_distance = dist(0, 0, width, height);
}

void draw() {
    drawScene();
    showStatistics();
}

void drawScene() {

    background(0);

    for (int i = 0; i <= width; i += 20) {
        for (int j = 0; j <= height; j += 20) {
            float size = dist(mouseX, mouseY, i, j);
            size = size / max_distance * 66;
            ellipse(i, j, size, size);
        }
    }
}
