package program;

public class Dog extends Animal {
    public Dog(String name, String ability) {
        super(name, ability);
    }

    @Override
    public void showCommands() {
        System.out.println("Команды собаки " + getName() + ": " + getAbility());
    }

    @Override
    public void learnCommand(String command) {
        String updateAbility = getAbility() + "," + command;
        setAbility(updateAbility);
        System.out.println("Собака " + getName() + " теперь умеет команду: " + command);
    }
}
