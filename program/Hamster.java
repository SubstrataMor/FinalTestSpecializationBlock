package program;

public class Hamster extends Animal {
    public Hamster(String name, String ability) {
        super(name, ability);
    }

    @Override
    public void showCommands() {
        System.out.println("Команды хомяка " + getName() + ": " + getAbility());
    }

    @Override
    public void learnCommand(String command) {
        String updateAbility = getAbility() + "," + command;
        setAbility(updateAbility);
        System.out.println("Хомяк " + getName() + " теперь умеет команду: " + command);
    }
}
