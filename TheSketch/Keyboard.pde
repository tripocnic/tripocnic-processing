
void keyPressed()
{
    printHelpKeysWith_h();
    saveCurrentFrameWith_s();
    toggleStatisticsWith_S();
}

void saveCurrentFrameWith_s()
{
    if (key != 's') {
        return;
    }

    String timestamp = year() + nf(month(), 2) + nf(day(), 2)
        + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)
        + "_" + nf(millis(), 8);

    String filename = "SavedFrames/" + getClass().getName()
        + "_" + timestamp + ".png";
    saveFrame(filename);
    println("Frame saved: " + filename);
}

void printHelpKeysWith_h()
{
    if (key != 'h') {
        return;
    }

    println("------ Help with Keys");
    println("s - save current frame");
    println("S - showStatistics: " + showStatistics);
}
