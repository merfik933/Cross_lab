import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// Екран авторизації
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизація')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Поле для логіна
              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Логін'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Це поле обов\'язкове';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Поле для пароля
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Це поле обов\'язкове';
                  }
                  if (value.length < 7) {
                    return 'Пароль повинен бути не менше 7 символів';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Кнопка авторизації
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Якщо форма валідна, виконуємо авторизацію
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Авторизація успішна')),
                    );
                  }
                },
                child: const Text('Авторизуватись'),
              ),
              const SizedBox(height: 20),

              // Перехід на екран реєстрації
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text('Не маєте акаунту? Реєстрація'),
              ),
              // Перехід на екран відновлення паролю
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                  );
                },
                child: const Text('Забули пароль?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Екран реєстрації
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Реєстрація')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Поле для імені користувача
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Ім\'я користувача'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Це поле обов\'язкове';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Поле для логіна
              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Логін'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Це поле обов\'язкове';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Поле для пароля
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Це поле обов\'язкове';
                  }
                  if (value.length < 7) {
                    return 'Пароль повинен бути не менше 7 символів';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Кнопка реєстрації
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Якщо форма валідна, реєструємо користувача
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Реєстрація успішна')),
                    );
                  }
                },
                child: const Text('Зареєструватися'),
              ),
              const SizedBox(height: 20),

              // Перехід на екран авторизації
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Маєте акаунт? Авторизація'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Екран відновлення паролю
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Відновлення паролю')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Поле для електронної пошти
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Електронна пошта'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Це поле обов\'язкове';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Введено некоректну пошту';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Кнопка відновлення паролю
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Якщо форма валідна, виконуємо відновлення паролю
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Інструкції для відновлення паролю надіслано')),
                    );
                  }
                },
                child: const Text('Відновити пароль'),
              ),
              const SizedBox(height: 20),

              // Перехід на екран авторизації
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Повернутися до авторизації'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
