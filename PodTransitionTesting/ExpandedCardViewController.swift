//
//  ExpandedCardViewController.swift
//  PodTransitionTesting
//
//  Created by Louis Tur on 1/10/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ExpandedCardViewController: UIViewController {

  var cellTitle: String = "Full Expansion"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    setupViewHierarchy()
    configureConstraints()
  }
  
  private func configureConstraints() {
    self.edgesForExtendedLayout = []
    let _ = [ compactContentView, compactContainerView ].map{ $0.translatesAutoresizingMaskIntoConstraints = false }
    
    let _ = [
      compactContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      compactContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      compactContainerView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor),
      compactContainerView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 64.0),
      
      compactContentView.topAnchor.constraint(equalTo: self.compactContainerView.topAnchor, constant: 16.0),
      compactContentView.leadingAnchor.constraint(equalTo: self.compactContainerView.leadingAnchor, constant: 8.0),
      compactContentView.trailingAnchor.constraint(equalTo: self.compactContainerView.trailingAnchor, constant: -8.0),
      compactContentView.heightAnchor.constraint(equalTo: self.compactContainerView.heightAnchor, multiplier: 0.6)
      ].map{ $0.isActive = true }
  }
  
  private func setupViewHierarchy() {
    self.view.addSubview(compactContainerView)
    self.compactContainerView.addSubview(compactContentView)
  }
  
  
  internal lazy var compactContainerView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = UIColor.gray
    view.heroID = "Container"
    return view
  }()
  
  internal lazy var compactContentView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = .red
    view.heroID = "Content"
    return view
  }()


}
