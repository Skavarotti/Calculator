//
//  ViewController.swift
//  Calculator
//
//  Created by Денис Скаваротти on 4/4/19.
//  Copyright © 2019 Денис Скаваротти. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var labelSign: UILabel!
    
    var valueFromScreen: Double = 0//Значение с Label
    var firstValue: Double = 0//Значение до нажатия операнда
    var valueForPecent: Double = 0//Для %
    var mathSign: Bool = false//Метка был ли нажат операнд
    var pointSignOne: Bool = false //Есть ли уже точка
    var valueOperation: String = ""//Переменаая в себе хранит нажатый знак для проверки после нажатия = и других действий (+-/*)
    
    
    //Mark 1. Ограничение символов при нажатии кнопки с цифрой и передача ее значения.
    @IBAction func pressedNumbers(_ sender: UIButton) {
        let number = sender.currentTitle!//При нажатии на кнопку передается значение. Sender передает нажатую кнопку, currentTitle что написано на кноке
        if mathSign == true{//Если true то после занака передаем занчение. Убираем впереди +
            resultLabel.text = number//Передаем число сначла (без знака)
            mathSign = false //Возвращаем false (без знака)
        } else if resultLabel.text!.count < 12{
            //resultLabel.text = number
            resultLabel.text = resultLabel.text! + number//Значение в valueFromScreen + нажатая кнопка
        }
        valueFromScreen = Double(resultLabel.text!)!
    }
    
    
    //Mark 2. Работа с операндами
    @IBAction func pressedOperand(_ sender: UIButton) {
        if resultLabel.text != "" && sender.currentTitle == "C" && sender.currentTitle == "=" && sender.currentTitle == "%" && sender.currentTitle == "+/-" && sender.currentTitle == "∙"{//Проверка на пустоту "", C, =
        } else if sender.currentTitle == "+" && resultLabel.text != ""{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "+";
            valueOperation = labelSign.text!;//valueOperation = sender.currentTitle!
            valueForPecent = firstValue;//Для %
            mathSign = true;//При нажатии + mathSign true. Для ф-ии pressedNumbers
            pointSignOne = false;//Для точки
        } else if sender.currentTitle == "-" && resultLabel.text != ""{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "-";
            valueOperation = labelSign.text!;
            valueForPecent = firstValue;
            mathSign = true;
            pointSignOne = false;
        } else if sender.currentTitle == "×" && resultLabel.text != ""{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "×";
            valueOperation = labelSign.text!;
            valueForPecent = firstValue;
            mathSign = true;
            pointSignOne = false;
        } else if sender.currentTitle == "÷" && resultLabel.text != ""{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "÷";
            valueOperation = labelSign.text!;
            valueForPecent = firstValue;
            mathSign = true;
            pointSignOne = false;
        }
    }
    
    
    //Mark 3. Работа с дополнительными операндами
    @IBAction func pressedSignChange(_ sender: UIButton) {
        var valueFreeNull = ""//Значение для удаления 0 после точки
        if mathSign != false && resultLabel.text != ""{
            let value: Double = Double(resultLabel.text!)!//Конвертер в Double
            valueFreeNull = String(-value)//Конвертер из String в Double
            var valueArray = valueFreeNull.components(separatedBy: ".")//Массив с разделитем ".". Число будет [0], а 0 будет [1]
            if valueArray[1] == "0"{//Если равно 0 то вставится [0] число до точки [1]
                resultLabel.text = "\(valueArray[0])"
            } else {//Если нет 0 то встаится число без нуля
                resultLabel.text = valueFreeNull
            }
                mathSign = true
        }
    }
    
    @IBAction func pressedPoint(_ sender: UIButton) {
        if pointSignOne != true && resultLabel.text != ""{
            let valueForPoint = String(resultLabel.text!)
            let point = "."
            resultLabel.text = String("\(valueForPoint)\(point)")
            pointSignOne = true
        }
    }
    
    @IBAction func pressedPercent(_ sender: UIButton) {
        var valueFreeNull = ""//Значение для удаления 0 после точки
        if resultLabel.text != "" {
            if valueOperation == "+"{
                valueFreeNull = String(valueForPecent + (valueForPecent / 100 * valueFromScreen))
                var valueArray = valueFreeNull.components(separatedBy: ".")//Массив с разделитем ".". Число будет [0], а 0 будет [1]
                if valueArray[1] == "0"{//Если равно 0 то вставится [0] число до точки [1]
                    resultLabel.text = "\(valueArray[0])"
                } else {//Если нет 0 то встаится число без нуля
                    resultLabel.text = valueFreeNull
                }
                pointSignOne = false
            } else if valueOperation == "-"{
                valueFreeNull = String(valueForPecent - (valueForPecent / 100 * valueFromScreen))
                var valueArray = valueFreeNull.components(separatedBy: ".")
                if valueArray[1] == "0"{
                    resultLabel.text = "\(valueArray[0])"
                } else {
                    resultLabel.text = valueFreeNull
                }
                pointSignOne = false
            } else if valueOperation == "×"{
                valueFreeNull = String(valueForPecent * (valueForPecent / 100 * valueFromScreen))
                var valueArray = valueFreeNull.components(separatedBy: ".")
                if valueArray[1] == "0"{
                    resultLabel.text = "\(valueArray[0])"
                } else {
                    resultLabel.text = valueFreeNull
                }
                pointSignOne = false
            } else if valueOperation == "÷"{
                valueFreeNull = String(valueForPecent / (valueForPecent / 100 * valueFromScreen))
                var valueArray = valueFreeNull.components(separatedBy: ".")
                if valueArray[1] == "0"{
                    resultLabel.text = "\(valueArray[0])"
                } else {
                    resultLabel.text = valueFreeNull
                }
                pointSignOne = false
            }
        }
        valueOperation = ""
    }
    
    @IBAction func pressedSum(_ sender: UIButton) {
        var valueFreeNull = ""
        if valueOperation == "+"{
            valueFreeNull = String(firstValue + valueFromScreen)
            var valueArray = valueFreeNull.components(separatedBy: ".")
            if valueArray[1] == "0"{
                resultLabel.text = "\(valueArray[0])"
            } else {
                resultLabel.text = valueFreeNull
            }
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSignOne = false
        } else if valueOperation == "-"{
            valueFreeNull = String(firstValue - valueFromScreen)
            var valueArray = valueFreeNull.components(separatedBy: ".")
            if valueArray[1] == "0"{
                resultLabel.text = "\(valueArray[0])"
            } else {
                resultLabel.text = valueFreeNull
            }
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSignOne = false
        } else if valueOperation == "×"{
            valueFreeNull = String(firstValue * valueFromScreen)
            var valueArray = valueFreeNull.components(separatedBy: ".")
            if valueArray[1] == "0"{
                resultLabel.text = "\(valueArray[0])"
            } else {
                resultLabel.text = valueFreeNull
            }
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSignOne = false
        } else if valueOperation == "÷"{
            valueFreeNull = String(firstValue / valueFromScreen)
            var valueArray = valueFreeNull.components(separatedBy: ".")
            if valueArray[1] == "0"{
                resultLabel.text = "\(valueArray[0])"
            } else {
                resultLabel.text = valueFreeNull
            }
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSignOne = false
        }
        labelSign.text = ""
    }
    
    @IBAction func pressedButtonClear(_ sender: UIButton) {
        valueFromScreen = 0
        firstValue = 0
        mathSign = false
        pointSignOne = false
        valueOperation = ""
        resultLabel.text = ""
        labelSign.text = ""
    }
}

