// Подключаем библиотеку Flutter
import 'package:flutter/material.dart';

// Общий виджет для всех экранов
class DogScreen extends StatelessWidget {
  final String title; // Заголовок экрана
  final String? description; // Описание породы (может быть null)
  final String? image; // Картинка породы (может быть null)
  final Function({String? breed, String? image, String? description})
      onTap; // Функция смены экрана

  // Конструктор класса
  const DogScreen({
    super.key,
    required this.title, // Обязательный параметр - заголовок
    this.description, // Необязательный параметр - описание
    this.image, // Необязательный параметр - изображение
    required this.onTap, // Обязательный параметр - функция смены экрана
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Верхняя панель с заголовком
        title: Text(
          title, // Текст заголовка
          style: const TextStyle(
            fontSize: 24, // Размер шрифта заголовка
            fontWeight: FontWeight.bold, // Жирное начертание
            color: Colors.blueAccent, // Цвет заголовка
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Растягиваем содержимое по ширине
        children: [
          if (image != null) // Если передано изображение, отображаем его
            Expanded(
              flex: 2, // Занимает 2 части пространства
              child: Container(
                margin: const EdgeInsets.all(8), // Внешние отступы
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Закругляем углы
                  image: DecorationImage(
                    image: AssetImage(image!), // Загружаем картинку
                    fit: BoxFit.cover, // Растягиваем по ширине
                  ),
                ),
              ),
            ),
          if (description != null) // Если есть описание, показываем его
            Expanded(
              flex: 1, // Занимает 1 часть пространства
              child: Padding(
                padding: const EdgeInsets.all(16), // Внутренние отступы
                child: Text(
                  description!, // Текст описания
                  style: const TextStyle(fontSize: 18),
                  // Размер шрифта описания
                  textAlign: TextAlign.center, // Выравнивание по центру
                ),
              ),
            ),
          if (description ==
              null) // Если главная страница, показываем кнопки выбора породы
            Expanded(
              flex: 3, // Занимает 3 части пространства
              child: Column(
                children: [
                  _buildBreedButton('Лабрадор', 'assets/labrador.png',
                      'Добродушная, уравновешенная и активная порода.'),
                  _buildBreedButton('Хаски', 'assets/husky.png',
                      'Умные, но упрямые. Нуждаются в тренировке.'),
                  _buildBreedButton(
                      'Немецкая овчарка',
                      'assets/german_shepherd.png',
                      'Внимательные, умные, выносливые.'),
                  _buildBreedButton('Чихуахуа', 'assets/сhihuahua.png',
                      'Самая маленькая собака в мире, собака-компаньон.'),
                  _buildBreedButton('Мопс', 'assets/pug.png',
                      'Любят играть, хорошо уживаются с детьми и животными.'),
                ],
              ),
            ),
          if (description !=
              null) // Кнопка "Назад" (показывается только на экране породы)
            Padding(
              padding: const EdgeInsets.all(8.0), // Внутренние отступы
              child: ElevatedButton(
                onPressed: () => onTap(),
                // При нажатии вызываем onTap (возвращаемся назад)
                child: const Text('Назад',
                    style: TextStyle(fontSize: 18)), // Текст кнопки
              ),
            ),
        ],
      ),
    );
  }

  // Метод для создания кнопок выбора породы
  Widget _buildBreedButton(String breed, String image, String description) {
    return Expanded(
      child: Container(
        width: double.infinity, // Кнопка занимает всю ширину
        margin: const EdgeInsets.all(8), // Внешние отступы
        child: ElevatedButton(
          onPressed: () =>
              onTap(breed: breed, image: image, description: description),
          // Передаем данные о породе
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, // Цвет кнопки
            padding:
                const EdgeInsets.symmetric(vertical: 15), // Внутренние отступы
          ),
          child: Text(
            breed, // Текст на кнопке
            style: const TextStyle(
                fontSize: 22, color: Colors.white), // Стиль текста
          ),
        ),
      ),
    );
  }
}
