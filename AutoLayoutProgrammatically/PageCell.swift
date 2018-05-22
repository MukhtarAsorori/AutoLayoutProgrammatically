//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Admin on 05/04/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
            guard let unwrappedPage = page else {
                return
            }
            acceImage.image = UIImage(named: unwrappedPage.imageName)
            let textAtribute = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            textAtribute.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            descriptionTV.attributedText = textAtribute
            descriptionTV.textAlignment = .center
        }
    }
    
    private let acceImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Accelrys"))
        // Enables auto resizing image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTV: UITextView = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
            
        }
        
        private func setupLayout(){
            let topImageViewContainer = UIView()
            topImageViewContainer.backgroundColor = .blue
            addSubview(topImageViewContainer)
            
            topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
            topImageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, constant: 0.5).isActive = true
            
            topImageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
            // Apple recommends to use leadingAnchor & trailingAnchor instead of leftAnchor & rightAnchor
            topImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            topImageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            //topImageViewContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            //topImageViewContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            topImageViewContainer.addSubview(acceImage)
            acceImage.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
            acceImage.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
            acceImage.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, constant: 0.5).isActive = true
            
             // Text View
            addSubview(descriptionTV)
            descriptionTV.topAnchor.constraint(equalTo: topImageViewContainer.topAnchor, constant: 100).isActive = true
            descriptionTV.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
            descriptionTV.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
            descriptionTV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
       
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
