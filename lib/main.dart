// Подключаем библиотеку Flutter
import 'package:flutter/material.dart';
import 'home_page.dart';

// Главная точка входа в приложение
void main() {
  runApp(const DogBreeds()); // Запуск приложения
}

// Основной класс приложения
class DogBreeds extends StatelessWidget {
  const DogBreeds({super.key}); // Конструктор класса

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Каталог собак', // Устанавливаем заголовок приложения
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        // Цветовая схема приложения
        useMaterial3: true, // Включаем использование Material 3
      ),
      home: const HomePage(), // Устанавливаем главный экран
    );
  }
}
