package program;

import java.io.*;
import java.util.*;

public class Data {
    private final List<Animal> animals;
    private static final String FILE_PATH = "program/data.txt";

    public Data() {
        animals = new ArrayList<>();
        loadData();
    }

    public void addAnimal(Animal animal) {
        animals.add(animal);
        saveData();
    }

    public void showAnimalCommands(String name) {
        for (Animal animal : animals) {
            if (animal.getName().equals(name)) {
                animal.showCommands();
                return;
            }
        }
        System.out.println("Животное не найдено.");
    }


    public void learnCommand(String name, String command) {
        for (Animal animal : animals) {
            if (animal.getName().equals(name)) {
                String[] commands = command.split(",");
                for (int i = 0; i < commands.length; i++) {
                    String trimCommand = commands[i].trim();
                    commands[i] = trimCommand;
                }
                animal.learnCommand(command);
                saveData();
                System.out.println("Теперь питомец знает новую команду.");
                return;
            }
        }
        System.out.println("Животное не найдено.");
    }


    private void loadData() {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 3) {
                    String classTitle = data[0];
                    String name = data[1];
                    String ability = String.join(",", Arrays.copyOfRange(data, 2, data.length));

                    Animal animal;
                    switch (classTitle) {
                        case "Cat" -> animal = new Cat(name, ability);
                        case "Dog" -> animal = new Dog(name, ability);
                        case "Hamster" -> animal = new Hamster(name, ability);
                        case "Donkey" -> animal = new Donkey(name, ability);
                        case "Horse" -> animal = new Horse(name, ability);
                        default -> {
                            System.out.println("Нет такого животного." + classTitle);
                            continue;
                        }
                    }
                    animals.add(animal);
                } else {
                    System.out.println("Неверные данные: " + line);
                }
            }
            System.out.println("Данные внесены.");
        } catch (IOException e) {
            System.out.println("Ошибка чтения данных: " + e.getMessage());
        }
    }

    private void saveData() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Animal animal : animals) {
                String classTitle = animal.getClass().getSimpleName();
                String name = animal.getName();
                String ability = animal.getAbility().replaceAll(",\\s+", ",");
                String line = classTitle + "," + name + "," + ability;
                writer.write(line);
                writer.newLine();
            }
            System.out.println("Сохранение прошло успешно.");
        } catch (IOException e) {
            System.out.println("Ошибка сохранения: " + e.getMessage());
        }
    }

    public void showAnimals() {
        try {
            File file = new File(FILE_PATH);
            Scanner fileScanner = new Scanner(file);
            while (fileScanner.hasNextLine()) {
                String animalData = fileScanner.nextLine();
                System.out.println(animalData);
            }
            fileScanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Файл не найден.");
        }
    }
}
