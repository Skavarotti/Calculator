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
    var pointSign: Bool = false //Есть ли уже точка
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
        } else if sender.currentTitle == "+"{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "+";
            valueOperation = labelSign.text!;//valueOperation = sender.currentTitle!
            valueForPecent = firstValue;//Для %
            mathSign = true;//При нажатии + mathSign true. Для ф-ии pressedNumbers
            pointSign = false;//Для точки
        } else if sender.currentTitle == "-"{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "-";
            valueOperation = labelSign.text!;
            valueForPecent = firstValue;
            mathSign = true;
            pointSign = false;
        } else if sender.currentTitle == "×"{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "×";
            valueOperation = labelSign.text!;
            valueForPecent = firstValue;
            mathSign = true;
            pointSign = false;
        } else if sender.currentTitle == "÷"{
            firstValue = Double(resultLabel.text!)!;
            labelSign.text = "÷";
            valueOperation = labelSign.text!;
            valueForPecent = firstValue;
            mathSign = true;
            pointSign = false;
        }
    }
    
    
    //Mark 3. Работа с дополнительными операндами
    @IBAction func pressedSignChange(_ sender: UIButton) {
        if mathSign != false{
            let negativeValue = Double(resultLabel.text!)!
            if resultLabel.text != "" {
                resultLabel.text = String(negativeValue * negativeValue)
                mathSign = true
            }
        }
    }
    
    @IBAction func pressedPoint(_ sender: UIButton) {
        if pointSign != true{
            let valueForPoint = Int(resultLabel.text!)!
            let point = "."
            if resultLabel.text != "" {
                resultLabel.text = String("\(valueForPoint)\(point)")
                pointSign = true
            }
        }
    }
    
    @IBAction func pressedPercent(_ sender: UIButton) {
        if resultLabel.text != "" {
            if valueOperation == "+"{
                resultLabel.text = String(valueForPecent + (valueForPecent / 100 * valueFromScreen))
                pointSign = false
            } else if valueOperation == "-"{
                resultLabel.text = String(valueForPecent - (valueForPecent / 100 * valueFromScreen))
                pointSign = false
            } else if valueOperation == "×"{
                resultLabel.text = String(valueForPecent * (valueForPecent / 100 * valueFromScreen))
                pointSign = false
            } else if valueOperation == "÷"{
                resultLabel.text = String(valueForPecent / (valueForPecent / 100 * valueFromScreen))
                pointSign = false
            }
        }
        valueOperation = ""
    }
    
    @IBAction func pressedSum(_ sender: UIButton) {
        if valueOperation == "+"{
            resultLabel.text = String(firstValue + valueFromScreen)
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSign = false
        } else if valueOperation == "-"{
            resultLabel.text = String(firstValue - valueFromScreen)
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSign = false
        } else if valueOperation == "×"{
            resultLabel.text = String(firstValue * valueFromScreen)
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSign = false
        } else if valueOperation == "÷"{
            
            resultLabel.text = String(firstValue / valueFromScreen)
            valueForPecent = Double(resultLabel.text!)!
            mathSign = true
            pointSign = false
        }
    }
    
    @IBAction func pressedButtonClear(_ sender: UIButton) {
        valueFromScreen = 0
        firstValue = 0
        mathSign = false
        pointSign = false
        valueOperation = ""
        resultLabel.text = ""
    }
}

