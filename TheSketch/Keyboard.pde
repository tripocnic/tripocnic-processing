
void keyPressed()
{
    handleKeys(this);
}

void handleKeys(PApplet sketch) {
    printHelpKeysWith_h(sketch);
    printSceneNamesWith_l(sketch);
    saveNextFrameWith_s(sketch);
    resetCurrentSceneWith_r(sketch);
    toggleStatisticsWith_S(sketch);
}

void saveNextFrameWith_s(PApplet sketch)
{
    if (sketch.key != 's') {
        return;
    }
    saveNextFrame = true;
}

void printHelpKeysWith_h(PApplet sketch)
{
    if (sketch.key != 'h') {
        return;
    }

    println("------ Help with Keys");
    println("l - list scene names");
    println("s - save current frame");
    println("r - reset current scene");
    println("S - showStatistics: " + showStatistics);
}
