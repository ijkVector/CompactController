//
//  ViewController.swift
//  CompactController
//
//  Created by Иван Дроботов on 15.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var presentButton = CustomButton(text: "Present") { self.showPopover() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
    private func style() {
        presentButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(presentButton)
        
        NSLayoutConstraint.activate([
            
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
            
        ])
    }
    
    private func showPopover() {
        let popoverContentController = UINavigationController(rootViewController: CompactController())
        popoverContentController.modalPresentationStyle = .popover
        
        guard let popoverPresentationController = popoverContentController.popoverPresentationController else { return }
        popoverPresentationController.sourceView = presentButton
        popoverPresentationController.sourceRect = presentButton.bounds
        popoverPresentationController.permittedArrowDirections = [.up, .down]
        
        popoverPresentationController.delegate = self
        
        present(popoverContentController , animated: true, completion: nil)
    }
    
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
