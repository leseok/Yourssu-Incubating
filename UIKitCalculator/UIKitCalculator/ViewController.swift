//
//  ViewController.swift
//  incubatingCalculator
//
//  Created by 은석 on 5/2/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstInputTextField : UITextField!
    @IBOutlet var secondInputTextField : UITextField!
    @IBOutlet var resultLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        calculating(operation: "+")
    }

    @IBAction func subtractButtonTapped(_ sender: UIButton) {
        calculating(operation: "-")
    }

    @IBAction func multiplyButtonTapped(_ sender: UIButton) {
        calculating(operation: "*")
    }

    @IBAction func divideButtonTapped(_ sender: UIButton) {
        calculating(operation: "/")
    }
    
    
    func calculating (operation:String) {
        let firstInput = firstInputTextField.text ?? ""
        let secondInput = secondInputTextField.text ?? ""

        
        if (firstInput == "" && secondInput == "") {
            resultLabel.text = "값을 먼저 입력해주세요."
            return
        }
        
        else if (firstInput == "" || secondInput == "") {
            resultLabel.text = "숫자를 모두 입력해주세요."
            return
        }
        
        //casting 과정 중 문자열이 들어오면 nil처리
        guard let firstNumber = Int(firstInput),
              let secondNumber = Int(secondInput) else {
                resultLabel.text = "정수 값만 입력해주세요."
                return
            }
        
        switch operation {
        case "+" : resultLabel.text = "\(firstNumber) + \(secondNumber) = \(firstNumber + secondNumber)"
        case "-" : resultLabel.text = "\(firstNumber) - \(secondNumber) = \(firstNumber - secondNumber)"
        case "*" : resultLabel.text = "\(firstNumber) X \(secondNumber) = \(firstNumber * secondNumber)"
        case "/" :
            if secondNumber == 0 {
                resultLabel.text = "0으로 나눌 수 없습니다."
                return
            }
            resultLabel.text = "\(firstNumber) / \(secondNumber) = \(firstNumber / secondNumber)"
        default: break
        }
    }
}

