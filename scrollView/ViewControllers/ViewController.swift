//
//  ViewController.swift
//  scrollView
//
//  Created by Aung Ko Ko on 7/29/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNRC: UITextField!
    @IBOutlet weak var tfDOB: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfEmailAddress: UITextField!
    @IBOutlet weak var scGender: UISegmentedControl!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var swApproveInfo: UISwitch!
    
    
    var selectedGenderIndex : Int = -1
    var datePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(selectedDate(datePicker:)), for: .valueChanged)
        tfDOB.inputView = datePicker
    }
    
    @objc func selectedDate(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy"
        tfDOB.text = dateFormatter.string(from: datePicker.date)
        
        let dateComponents = NSCalendar.current.dateComponents([.year,.month,.day], from: self.datePicker!.date)
        var dobYear = dateComponents.year
        let currentDateComponents = NSCalendar.current.dateComponents([.year,.month,.day], from: Date())
        var currentYear = currentDateComponents.year
        tfAge.text =  String (currentYear! - dobYear!) ?? ""
        
        view.endEditing(true)
    }
    
    @IBAction func scGenderAction(_ sender: UISegmentedControl) {
        selectedGenderIndex = sender.selectedSegmentIndex
    }
    
    @IBAction func btnRegisterAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ResultViewController.identifier) as! ResultViewController
        vc.name = tfName.text ?? ""
        vc.nrc = tfNRC.text ?? ""
        vc.dob = tfDOB.text ?? ""
        vc.age = tfAge.text ?? ""
        vc.emailAddress = tfEmailAddress.text ?? ""
        vc.selectedGenderIndex = selectedGenderIndex
        vc.address = tfAddress.text ?? ""
        vc.approveInfo = swApproveInfo.isOn
        
        self.present(vc, animated: true, completion: nil)
    }
    
}

