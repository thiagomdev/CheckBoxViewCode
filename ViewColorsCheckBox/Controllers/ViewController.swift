//
//  ViewController.swift
//  ViewColorsCheckBox
//
//  Created by Thiago Monteiro on 17/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var reButtonBox     = UIButton(type: .system)
    private var orangeButtonBox = UIButton(type: .system)
    private var greenButtonBox  = UIButton(type: .system)
    private var pinkButtonBox   = UIButton(type: .system)
    
    private var unchecked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.UIGradient()
        
        self.buidViewHierarchy()
        self.setConstraintsToAllButton()
        
        self.configureRedButtonBox()
        self.configureOrangeButtonBox()
        self.configureGreenButtonBox()
        self.configurePinkButtonBox()
        
        
    }
    
    private func UIGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        self.view.layer.addSublayer(gradient)
        gradient.frame.size = self.view.frame.size
    }
    
    private func buidViewHierarchy() {
        self.view.addSubview(reButtonBox)
        self.view.addSubview(orangeButtonBox)
        self.view.addSubview(greenButtonBox)
        self.view.addSubview(pinkButtonBox)
    }
    
    private func setConstraintsToAllButton() {
        self.reButtonBox.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20).isActive        = true
        self.reButtonBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28).isActive = true
        self.reButtonBox.heightAnchor.constraint(equalToConstant: 50).isActive                             = true
        self.reButtonBox.widthAnchor.constraint(equalToConstant: 50).isActive                              = true
        
        self.orangeButtonBox.topAnchor.constraint(equalTo: self.reButtonBox.bottomAnchor, constant: 16).isActive = true
        self.orangeButtonBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28).isActive   = true
        self.orangeButtonBox.heightAnchor.constraint(equalToConstant: 50).isActive                               = true
        self.orangeButtonBox.widthAnchor.constraint(equalToConstant: 50).isActive                                = true

        self.greenButtonBox.topAnchor.constraint(equalTo: self.orangeButtonBox.bottomAnchor, constant: 16).isActive = true
        self.greenButtonBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28).isActive       = true
        self.greenButtonBox.heightAnchor.constraint(equalToConstant: 50).isActive                                   = true
        self.greenButtonBox.widthAnchor.constraint(equalToConstant: 50).isActive                                    = true

        self.pinkButtonBox.topAnchor.constraint(equalTo: self.greenButtonBox.bottomAnchor, constant: 16).isActive = true
        self.pinkButtonBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28).isActive      = true
        self.pinkButtonBox.heightAnchor.constraint(equalToConstant: 50).isActive                                  = true
        self.pinkButtonBox.widthAnchor.constraint(equalToConstant: 50).isActive                                   = true
    }
    
    private func configureRedButtonBox() {
        self.reButtonBox.translatesAutoresizingMaskIntoConstraints = false
        self.reButtonBox.clipsToBounds      = true
        self.reButtonBox.backgroundColor    = .white
        self.reButtonBox.layer.borderWidth  = 2
        self.reButtonBox.tintColor          = .red
        self.reButtonBox.layer.borderColor  = UIColor.black.cgColor
        self.reButtonBox.layer.cornerRadius = 8
        self.reButtonBox.addTarget(self, action: #selector(boxButtonRed(_:)), for: .touchUpInside)
    }
    
    private func configureOrangeButtonBox() {
        self.orangeButtonBox.translatesAutoresizingMaskIntoConstraints = false
        self.orangeButtonBox.clipsToBounds      = true
        self.orangeButtonBox.backgroundColor    = .white
        self.orangeButtonBox.layer.borderWidth  = 2
        self.orangeButtonBox.tintColor          = .orange
        self.orangeButtonBox.layer.borderColor  = UIColor.black.cgColor
        self.orangeButtonBox.layer.cornerRadius = 8
        self.orangeButtonBox.addTarget(self, action: #selector(boxButtonOrange(_:)), for: .touchUpInside)
    }
    
    private func configureGreenButtonBox() {
        self.greenButtonBox.translatesAutoresizingMaskIntoConstraints = false
        self.greenButtonBox.clipsToBounds      = true
        self.greenButtonBox.backgroundColor    = .white
        self.greenButtonBox.layer.borderWidth  = 2
        self.greenButtonBox.tintColor          = .green
        self.greenButtonBox.layer.borderColor  = UIColor.black.cgColor
        self.greenButtonBox.layer.cornerRadius = 8
        self.greenButtonBox.addTarget(self, action: #selector(boxButtonGreen(_:)), for: .touchUpInside)
    }
    
    private func configurePinkButtonBox() {
        self.pinkButtonBox.translatesAutoresizingMaskIntoConstraints = false
        self.pinkButtonBox.clipsToBounds = true
        self.pinkButtonBox.backgroundColor = .white
        self.pinkButtonBox.layer.borderWidth = 2
        self.pinkButtonBox.tintColor = .systemPink
        self.pinkButtonBox.layer.borderColor = UIColor.black.cgColor
        self.pinkButtonBox.layer.cornerRadius = 8
        self.pinkButtonBox.addTarget(self, action: #selector(boxButtonPink(_:)), for: .touchUpInside)
    }
    
    @objc func boxButtonRed(_ sender: UIButton) {
        if unchecked {
            sender.setImage(UIImage(systemName:"checkmark.rectangle.fill"), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .red
            self.title = "Red"
            self.pinkButtonBox.isEnabled = false
            self.greenButtonBox.isEnabled = false
            self.orangeButtonBox.isEnabled = false
            self.unchecked = false
        }
        else {
            sender.setImage( UIImage(systemName:""), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .white
            self.title = "White"
            self.pinkButtonBox.isEnabled = true
            self.greenButtonBox.isEnabled = true
            self.orangeButtonBox.isEnabled = true
            self.unchecked = true
        }
    }
    
    @objc func boxButtonOrange(_ sender: UIButton) {
        if unchecked {
            sender.setImage(UIImage(systemName:"checkmark.rectangle.fill"), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .orange
            sender.setTitleColor(.red, for: .normal)
            self.title = "Orange"
            self.pinkButtonBox.isEnabled = false
            self.greenButtonBox.isEnabled = false
            self.reButtonBox.isEnabled = false
            self.unchecked = false
        }
        else {
            sender.setImage( UIImage(systemName:""), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .white
            self.title = "White"
            self.pinkButtonBox.isEnabled = true
            self.greenButtonBox.isEnabled = true
            self.reButtonBox.isEnabled = true
            self.unchecked = true
        }
    }
    
    @objc func boxButtonGreen(_ sender: UIButton) {
        if unchecked {
            sender.setImage(UIImage(systemName:"checkmark.rectangle.fill"), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .green
            self.title = "Green"
            self.pinkButtonBox.isEnabled = false
            self.orangeButtonBox.isEnabled = false
            self.reButtonBox.isEnabled = false
            self.unchecked = false
        }
        else {
            sender.setImage( UIImage(systemName:""), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .white
            self.title = "White"
            self.pinkButtonBox.isEnabled = true
            self.orangeButtonBox.isEnabled = true
            self.reButtonBox.isEnabled = true
            self.unchecked = true
        }
    }
    
    @objc func boxButtonPink(_ sender: UIButton) {
        if unchecked {
            sender.setImage(UIImage(systemName:"checkmark.rectangle.fill"), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .systemPink
            self.title = "Pink"
            self.greenButtonBox.isEnabled = false
            self.orangeButtonBox.isEnabled = false
            self.reButtonBox.isEnabled = false
            self.unchecked = false
        }
        else {
            sender.setImage( UIImage(systemName:""), for: .normal)
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.view.backgroundColor = .white
            self.title = "White"
            self.greenButtonBox.isEnabled = true
            self.orangeButtonBox.isEnabled = true
            self.reButtonBox.isEnabled = true
            self.unchecked = true
        }
    }
  
}

