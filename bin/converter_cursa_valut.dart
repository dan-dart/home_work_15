import 'dart:io';

//Необходимо в самом начале выводить в терминал курс покупки и продажи к сому для 6 валют.
//Далее человек выбирает обмен на сомы или обмен сомов на другую валюту.
//Затем выбирает нужную валюту с которой он хочет провести операцию.
//Указывает сумму покупки или продажи.
//И получает ответ, сколько сом он получит за другую валюту или сколько необходимо заплотить для покупки.//

// Класс для хранения курсов обмена
class ExchangeRates {
  Map<String, double> rates;

  // Конструктор класса
  ExchangeRates(this.rates);

  // Метод для вывода курсов обмена
  void displayRates() {
    print('Курсы обмена:');
    rates.forEach((currency, rate) {
      print('$currency: Покупка - $rate, Продажа - ${rate + 0.5}');
    });
  }
}

void main() {
  // Курсы обмена
  var exchangeRates = ExchangeRates({
    'USD': 84.50,
    'EUR': 102.25,
    'RUB': 1.10,
    'CNY': 13.00,
    'GBP': 116.80,
    'JPY': 0.78,
  });

  // Вывод курсов обмена
  exchangeRates.displayRates();

  // Пользовательский ввод
  stdout.write('Выберите валюту (USD, EUR, RUB, CNY, GBP, JPY): ');
  var currency = stdin.readLineSync();

  stdout.write('Введите сумму: ');
  var amount = double.parse(stdin.readLineSync()!);

  stdout.write('Выберите операцию (покупка - buy, продажа - sell): ');
  var operation = stdin.readLineSync();

  // Расчет операции обмена
  var result = (operation == 'buy')
      ? amount / exchangeRates.rates[currency!]!
      : amount * (exchangeRates.rates[currency!]! + 0.5);

  // Вывод результата
  print('Результат операции: $result сом');
}
