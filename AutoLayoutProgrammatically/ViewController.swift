//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Mukhtar on 15/03/2018.
//  Copyright © 2018 Mukhtar. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainPink = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let acceImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Accelrys"))
        // Enables auto resizing view image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTV: UITextView = {
        let textView = UITextView()
        let textAtribute = NSMutableAttributedString(string: "iOS Swift4", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        textAtribute.append(NSMutableAttributedString(string: "\n\n\nBeginning Swift Games Development for iOS", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        textView.attributedText = textAtribute
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(descriptionTV)
        setupLayout()
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls(){

        let bootomControlsStakView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bootomControlsStakView.translatesAutoresizingMaskIntoConstraints = false
        bootomControlsStakView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            bootomControlsStakView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bootomControlsStakView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bootomControlsStakView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bootomControlsStakView.heightAnchor.constraint(equalToConstant: 50)])
        
        view.addSubview(bootomControlsStakView)
        
    }
    
    private func setupLayout(){
        let topImageViewContainer = UIView()
        topImageViewContainer.backgroundColor = .blue
        view.addSubview(topImageViewContainer)
        
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        topImageViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0.5).isActive = true

        topImageViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        // Apple recommends to use leadingAnchor & trailingAnchor instead of leftAnchor & rightAnchor
        topImageViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //topImageViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //topImageViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageViewContainer.addSubview(acceImage)
        acceImage.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        acceImage.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
        acceImage.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, constant: 0.5).isActive = true
        
        // Text View
        descriptionTV.topAnchor.constraint(equalTo: topImageViewContainer.topAnchor, constant: 100).isActive = true
        descriptionTV.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTV.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    
}// ViewController


