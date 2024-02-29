package program;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Menu {
    private final Data data;
    private final Scanner scanner;

    public Menu(Data data) {
        this.data = data;
        this.scanner = new Scanner(System.in);
    }

    public void menu() {
        while (true) {
            try {
                System.out.println("Меню:");
                System.out.println("1. Добавить животное");
                System.out.println("2. Список животных");
                System.out.println("3. Список команд питомца");
                System.out.println("4. Обучить питомца новой команде");
                System.out.println("0. Выход из меню");
                System.out.println("Выбрать пункт из меню: ");
                int choice = scanner.nextInt();
                scanner.nextInt();

                switch (choice) {
                    case 1 -> addAnimal();
                    case 2 -> data.showAnimals();
                    case 3 -> showAnimalCommands();
                    case 4 -> learnCommand();
                    case 0 -> {
                        System.out.println("Вы вышли из программы.");
                        return;
                    }
                    default -> System.out.println("Такого пункта не существует, попробуйте еще раз.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Неверный ввод");
                scanner.nextLine();
            }
        }
    }

    private void addAnimal() {
        System.out.println("Имя животного:");
        String name = scanner.nextLine();
        System.out.println("Команды животного (через запятую):");
        String ability = scanner.nextLine();

        System.out.println("Выберите группу животного:");
        System.out.println("1. Кошка");
        System.out.println("2. Собака");
        System.out.println("3. Хомяк");
        System.out.println("4. Осёл");
        System.out.println("5. Лошадь");
        int animalGroup = scanner.nextInt();

        Animal animal;
        switch (animalGroup) {
            case 1 -> animal = new Cat(name, ability);
            case 2 -> animal = new Dog(name, ability);
            case 3 -> animal = new Hamster(name, ability);
            case 4 -> animal = new Donkey(name, ability);
            case 5 -> animal = new Horse(name, ability);
            default -> {
                System.out.println("Нет такой группы.");
                return;
            }
        }
        data.addAnimal(animal);
        System.out.println("Животное занесено в список.");
    }

    private void showAnimalCommands() {
        System.out.println("Введите имя животного:");
        String name = scanner.nextLine();
        data.showAnimalCommands(name);
    }

    private void learnCommand() {
        System.out.println("Имя животного:");
        String name = scanner.nextLine();
        System.out.println("Команды животного (через запятую):");
        String command = scanner.nextLine();

        data.learnCommand(name, command);
        System.out.println("Животное умеет новую команду.");
    }
}
