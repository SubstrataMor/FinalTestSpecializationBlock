package program;

public class Cat extends Animal {
    public Cat(String name, String ability) {
        super(name, ability);
    }

    @Override
    public void showCommands() {
        System.out.println("Команды для кошки " + getName() + ": " + getAbility());
    }

    @Override
    public void learnCommand(String command) {
        String updateAbility = getAbility() + "," + command;
        setAbility(updateAbility);
        System.out.println("Кошка " + getName() + " теперь умеет команду: " + command);

    }
}
