
void keyPressed()
{
    printHelpKeysWith_h();
    toggleStatisticsWith_S();
}

void printHelpKeysWith_h()
{
    if (key != 'h') {
        return;
    }

    println("------ Help with Keys");
    println("S - showStatistics: " + showStatistics);
}
