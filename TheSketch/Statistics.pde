
// Key controlled
boolean showStatistics = true;

// y start of the top left corner for statistics drawing
int yStatCorner = 50;

void toggleStatisticsWith_S() {
    if (key == 'S') {
        showStatistics = !showStatistics;
    }
}

void showStatistics()
{
    if (!showStatistics) {
        return;
    }

    pushStyle();
    colorMode(HSB, 360, 100, 100);
    int textSize = 20;

    strokeWeight(2);
    // Draw rectangle background
    rectMode(CORNER);
    fill(0);
    rect(0, yStatCorner, 450, 2 * textSize + 10);

    // Print statistics
    textSize(textSize);
    fill(255);
    text("Size: " + width + "x" + height + " FPS: " + int(frameRate),
        10, yStatCorner + textSize);
    showMemoryUsage(yStatCorner, textSize);

    popStyle();
}

void showMemoryUsage(int yStatCorner, int textSize)
{
    long maxMemory = Runtime.getRuntime().maxMemory();
    long allocatedMemory = Runtime.getRuntime().totalMemory();
    long freeMemory = Runtime.getRuntime().freeMemory();
    String memUsage = "Mem(MB): Max: " + int(maxMemory / 1024 / 1024) +
        " Used: " + int(allocatedMemory / 1024 / 1024) +
        " Free: " + int(freeMemory / 1024 / 1024);
    text(memUsage, 10, 2 * textSize + yStatCorner);
}