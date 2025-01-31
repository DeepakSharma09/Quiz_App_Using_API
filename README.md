

# Quiz App

A simple and interactive quiz app built with **Flutter**. The app fetches quiz questions from an API, allows users to answer them, and provides a review screen to check their answers.

------------------------------------------------------------------------------------------------

## Features

1. **Fetch Questions from API**:
   - The app fetches quiz questions from a remote API (e.g., `https://api.jsonserve.com/Uw5CrX`).
   - Each question includes a description and multiple options, with one correct answer.

2. **Interactive Quiz Interface**:
   - Users can select an option for each question.
   - The app provides immediate feedback on whether the selected answer is correct or wrong.

3. **Score Calculation**:
   - Correct answers add 4 points to the total score.
   - Wrong answers deduct 1 point from the total score.

4. **Review Screen**:
   - After completing the quiz, users can review their answers.
   - The review screen displays each question, the user's answer, and the correct answer.

5. **Responsive UI**:
   - The app features a clean and responsive user interface built with Flutter widgets.

6. **Error Handling**:
   - Handles API errors and displays appropriate messages to the user.
   - Ensures the app doesn't crash if the API response is invalid or incomplete.

---

## Screenshots

| Quiz Screen | Main Screen | Review Screen |
|-------------|-------------|---------------|
| ![Quiz Screen](![image](https://github.com/user-attachments/assets/6e2f5f63-a7e8-4d2d-91a5-13803680ea54)
) | ![Main Screen](![image](https://github.com/user-attachments/assets/200a193f-ee9c-4701-bd7c-58027f6bddab)
) | ![Review Screen](![image](https://github.com/user-attachments/assets/0e08ee29-5662-4f34-8392-16fc3010a0ba)
) |

---

## Installation

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
- **Dart SDK**: Flutter comes with Dart, so no separate installation is needed.
- **IDE**: Use **Android Studio** or **VS Code** with the Flutter and Dart plugins installed.

### Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/DeepakSharma09/Quiz_App_Using_API.git
   cd quiz-app
   ```

2. **Install Dependencies**:
   Run the following command to install the required dependencies:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   Connect a device or start an emulator, then run:
   ```bash
   flutter run
   ```

---

## Project Structure

Here’s an overview of the project structure:

```
quiz-app/
├── lib/
│   ├── main.dart              # Entry point of the app
│   ├── Homepage.dart          # Home screen with quiz questions
│   ├── Completed.dart         # Screen to display quiz results
│   ├── ReviewScreen.dart      # Screen to review answers
│   ├── Options.dart           # Custom widget for quiz options
├── assets/
│   ├── img.png                # Image used in the app
├── pubspec.yaml               # Flutter dependencies and assets
```

---

## API Integration

The app fetches quiz questions from the following API endpoint:

```
GET https://api.jsonserve.com/Uw5CrX
```

### Sample API Response

```json
{
  "questions": [
    {
      "description": "What is 2 + 2?",
      "options": [
        {"description": "3", "is_correct": false},
        {"description": "4", "is_correct": true},
        {"description": "5", "is_correct": false}
      ]
    },
    {
      "description": "What is the capital of France?",
      "options": [
        {"description": "Berlin", "is_correct": false},
        {"description": "Paris", "is_correct": true},
        {"description": "Madrid", "is_correct": false}
      ]
    }
  ]
}
```

---

## How It Works

1. **Fetching Questions**:
   - The app makes an HTTP GET request to the API endpoint to fetch the quiz questions.
   - The questions are stored in a list and displayed on the home screen.

2. **Answering Questions**:
   - Users select an option for each question.
   - The app checks if the selected option is correct and updates the score accordingly.

3. **Reviewing Answers**:
   - After completing the quiz, users can navigate to the review screen.
   - The review screen displays each question, the user's answer, and the correct answer.

---

## Dependencies

The app uses the following dependencies:

- **http**: For making HTTP requests to fetch quiz questions.
- **flutter/material.dart**: For building the UI components.

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
```

---

## Customization

You can customize the app by:

1. **Changing the API Endpoint**:
   Update the API endpoint in the `Homepage.dart` file to fetch questions from a different source.

2. **Modifying the UI**:
   Customize the colors, fonts, and layout in the `Homepage.dart`, `Completed.dart`, and `ReviewScreen.dart` files.

3. **Adding More Features**:
   - Add a timer for each question.
   - Implement a leaderboard to track high scores.
   - Allow users to select quiz categories.

---

## Contributing

Contributions are welcome! If you find any issues or want to add new features, feel free to open a pull request.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Thanks to [Flutter](https://flutter.dev) for the amazing framework.
- Thanks to the API provider for the quiz questions.

---

## Contact

For any questions or feedback, feel free to reach out:

- **Email**: Deepakgaur.dg69@gmail.com
- **GitHub**: Deepak (https://github.com/DeepakSharma09)

---

Enjoy the quiz app! 🚀
