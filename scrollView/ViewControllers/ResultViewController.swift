//
//  ResultViewController.swift
//  scrollView
//
//  Created by Aung Ko Ko on 7/29/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
   static let identifier = "ResultViewControllerIdentifier"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNRC: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblEmailAddress: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblApproveInfo: UILabel!
    
    
    var name: String = ""
    var nrc: String = ""
    var dob: String = ""
    var age: String = ""
    var emailAddress: String = ""
    var selectedGenderIndex: Int = -1
    var address: String = ""
    var approveInfo: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name ?? ""
        
    }
}
