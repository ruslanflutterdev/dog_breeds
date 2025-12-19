// Подключаем библиотеку Flutter
import 'package:flutter/material.dart';
import 'dog_screen.dart'; // Импортируем экран породы собак

// Главный экран с логикой управления состоянием
class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Конструктор класса

  @override
  State<HomePage> createState() => _HomePageState(); // Создаем состояние
}

// Состояние главного экрана
class _HomePageState extends State<HomePage> {
  String _screenName = 'home'; // Переменная для хранения текущего экрана
  String? _selectedBreed; // Хранит выбранную породу (изначально null)
  String? _selectedImage; // Хранит изображение породы (изначально null)
  String? _selectedDescription; // Хранит описание породы (изначально null)

  // Геттер для получения заголовка экрана (изменяется в зависимости от состояния)
  String get screenTitle => _screenName == 'home'
      ? 'Каталог пород собак'
      : _selectedBreed ?? 'Порода'; // Подставление значения по умолчанию,
  // если _screenName == 'home' то заголовок будет Каталог собак,
  // если _selectedBreed не 0 то то оно используется как заголовок
  // если _selectedBreed 0 то заголовок будет Погода

  // Геттеры для получения изображения и описания породы
  // Переменные являются приватными, get позволяет получить значение, но не изменять
  String? get selectedImage => _selectedImage;

  String? get selectedDescription => _selectedDescription;

  // Метод смены экрана (передает данные о выбранной породе)
  void _changePage({String? breed, String? image, String? description}) {
    setState(() {
      if (_screenName == 'home') {
        // Если мы на главном экране, переключаемся на экран породы
        _screenName = 'breed';
        _selectedBreed = breed;
        _selectedImage = image;
        _selectedDescription = description;
      } else {
        // Если мы на экране породы, возвращаемся на главный экран
        _screenName = 'home';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DogScreen(
        // Используем DogScreen для отображения контента
        title: screenTitle,
        // Передаем заголовок
        description: selectedDescription,
        // Передаем описание породы (если есть)
        image: selectedImage,
        // Передаем изображение породы (если есть)
        onTap: _changePage, // Передаем метод смены экрана
      ),
    );
  }
}
