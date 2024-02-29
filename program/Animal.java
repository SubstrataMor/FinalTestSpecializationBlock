package program;

public abstract class Animal {
    private String name;
    private String ability;

    protected Animal(String name, String ability) {
        this.name = name;
        this.ability = ability;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbility() {
        return ability;
    }

    public void setAbility(String ability) {
        this.ability = ability;
    }

    public abstract void showCommands();
    public abstract void learnCommand(String command);
}
