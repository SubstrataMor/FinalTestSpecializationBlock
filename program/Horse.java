package program;

public class Horse extends Animal {
    public Horse(String name, String ability) {
        super(name, ability);
    }

    @Override
    public void showCommands() {
        System.out.println("Команды лошади " + getName() + ": " + getAbility());
    }

    @Override
    public void learnCommand(String command) {
        String updateAbility = getAbility() + "," + command;
        setAbility(updateAbility);
        System.out.println("Лошадь " + getName() + " теперь умеет команду: " + command);
    }
}
