//
//  CompactController.swift
//  CompactController
//
//  Created by Иван Дроботов on 15.02.2024.
//

import UIKit

final class CompactController: UIViewController {
    
    private lazy var segmentedControl = UISegmentedControl(items: ["280pt","150pt"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .systemGray4
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        navigationItem.titleView = segmentedControl
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(exitTapped))
    }
    
    private func layout() {
        setSize(0)
    }
    
    @objc func exitTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func valueChanged() {
        setSize(segmentedControl.selectedSegmentIndex)
    }
    
    private func setSize(_ segmentIndex: Int) {
        guard let popover = navigationController?.popoverPresentationController else { return }
        
        switch segmentIndex {
        case 0:
            popover.presentedViewController.preferredContentSize = CGSize(width: 300, height: 280)
        case 1:
            popover.presentedViewController.preferredContentSize = CGSize(width: 300, height: 150)
        default: break
        }
    }
}
