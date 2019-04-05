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
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var valueFromScreen: Int = 0//Значение с Label
    var firstValue: Int = 0//Значение до нажатия операнда
    var mathSign: Bool = false//Метка был ли нажат знак
    var valueOperation: String = ""//Переменаая в себе хранит нажатый знак для проверки после нажатия = и других действий (+-/*)
    
    
    //Mark 1. Ограничение символов при нажатии кнопки с цифрой и передача ее значения.
    @IBAction func pressedNumbers(_ sender: UIButton) {
        let number = sender.currentTitle!//При нажатии на кнопку передается значение
        if mathSign == true && (resultLabel.text?.count)! < 14{//Если true то после занака передаем занчение. Убираем впереди +
            resultLabel.text = number//Передаем число сначла (без знака)
            mathSign = false //Возвращаем false (без знака)
        }
        else {
            resultLabel.text = resultLabel.text! + number//Значение в valueFromScreen + нажатая кнопка
        }
        valueFromScreen = Int(resultLabel.text!)!
    }
    
    //Mark 2. Работа с операндами
    @IBAction func pressedPlus(_ sender: UIButton) {
        if resultLabel.text != ""{//Проверка на пустоту "", C, =
            firstValue = Int(resultLabel.text!)!
            resultLabel.text = "+"
            valueOperation = resultLabel.text!
            //valueOperation = sender.currentTitle!
            mathSign = true//При нажатии + делаем mathSign true. Для ф-ии pressedNumbers
        }
    }
    
    @IBAction func pressedMinus(_ sender: UIButton) {
        if resultLabel.text != ""{
            firstValue = Int(resultLabel.text!)!
            resultLabel.text = "-"
            valueOperation = resultLabel.text!
            mathSign = true
        }
    }
    
    @IBAction func pressedMultiplication(_ sender: UIButton) {
        if resultLabel.text != ""{
            firstValue = Int(resultLabel.text!)!
            resultLabel.text = "×"
            valueOperation = resultLabel.text!
            mathSign = true
        }
    }
    
    @IBAction func pressedDivision(_ sender: UIButton) {
        if resultLabel.text != ""{
            firstValue = Int(resultLabel.text!)!
            resultLabel.text = "÷"
            valueOperation = resultLabel.text!
            mathSign = true
        }
    }
    
    
    /////
    @IBAction func pressedSum(_ sender: UIButton) {
        if valueOperation == "+"{
            resultLabel.text = String(firstValue + valueFromScreen)
            mathSign = true
        } else if valueOperation == "-"{
            resultLabel.text = String(firstValue - valueFromScreen)
            mathSign = true
        }
        else if valueOperation == "×"{
            resultLabel.text = String(firstValue * valueFromScreen)
            mathSign = true
        }
        else if valueOperation == "÷"{
            resultLabel.text = String(firstValue / valueFromScreen)
            mathSign = true
        }
    }
}

/*@IBOutlet weak var resultLabel: UILabel!
 
 var stillTyping = false
 var firstOperand: Double = 0//сохранение значения перед действием 2 операндов
 var converterValue: Double{//Конвертируем в текст для firstOperand (Double)
 get{
 if let text = resultLabel.text{
 if let value = Double(text){
 return value
 }
 }
 return 0
 }
 set {
 resultLabel.text = "\(newValue)"
 }
 }
 
 @IBAction func pressedNumbers(_ sender: UIButton) {
 let number = sender.currentTitle!//При нажатии на кнопку передается значение
 if stillTyping{
 if (resultLabel.text?.count)! < 14{
 resultLabel.text = resultLabel.text! + number//Передаем в Label
 }
 }
 else
 {
 resultLabel.text = number
 stillTyping = true
 }
 }
 
 @IBAction func pressTwoOperandSign(_ sender: UIButton) {//При нажатии на оператор сохраняем в firstOperand значение на Label. Для действия между 2-мя опернадами
 firstOperand = converterValue//Нужна конвертация в текст
 }
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 }
 }*/
