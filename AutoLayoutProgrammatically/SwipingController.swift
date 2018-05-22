//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Admin on 02/04/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let pages = [
        Page(imageName: "arrows", headerText: "iOS Game Development", bodyText: "Beginning Swift Games Development for iOS"),
        Page(imageName: "Accelrys", headerText: "Setting Up Your Game Scene", bodyText: "Setting Up Your Game Scene and Adding Your First Sprites  and Sprite Kit Scenes and SKNode Positioning"),
        Page(imageName: "colors", headerText: "Adding Physics and Collision Detection to Your Game", bodyText: "Adding Actions and Animations Adding Particle Effects to Your Game with Emitter Nodes"),
        Page(imageName: "ecnomy", headerText: "Adding Actions and Animations", bodyText: "Adding Physics and Collision Detection to Your Game and Adding Scene Scrolling and Game Control"),
        Page(imageName: "road", headerText: "Adding Points and Sound", bodyText: "Adding Points and Sound, Transitioning Between Scenes and Sprite Kit Best Practices")
        
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev(){
        let nextIndex = min(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(displayP3Red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_id")
        collectionView?.isPagingEnabled =  true
    }
    

   
}






