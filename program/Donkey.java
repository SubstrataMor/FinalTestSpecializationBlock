package program;

public class Donkey extends Animal {
    public Donkey(String name, String ability) {
        super(name, ability);
    }

    @Override
    public void showCommands() {
        System.out.println("Команды осла " + getName() + ": " + getAbility());
    }

    @Override
    public void learnCommand(String command) {
        String updateAbility = getAbility() + "," + command;
        setAbility(updateAbility);
        System.out.println("Осел " + getName() + " теперь умеет команду: " + command);
    }
}
