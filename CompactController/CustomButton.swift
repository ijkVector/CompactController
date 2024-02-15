//
//  CustomButton.swift
//  CompactController
//
//  Created by Иван Дроботов on 15.02.2024.
//

import UIKit

final class CustomButton: UIButton {
    
    private let tapHandler: (()->())?
    
    init(text: String, tapHandler: (()->())? = nil) {
        self.tapHandler = tapHandler
        super.init(frame: .zero)
        
        style(text)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style(_ text: String) {
        setTitle(text, for: [])
        setTitleColor(.systemBlue, for: [])
        layer.cornerRadius = 8
    }
    
    private func layout() {
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: [.allowUserInteraction, .beginFromCurrentState],
                           animations: {
                let scale = self.isHighlighted ? 0.9 : 1
                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            }, completion: nil)
            
            if self.isHighlighted {
                tapHandler?()
            }
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        if tintAdjustmentMode == .dimmed {
            backgroundColor = .systemGray2
            setTitleColor(.systemGray3, for: [])
        } else {
            backgroundColor = .systemBackground
            setTitleColor(.systemBlue, for: [])
        }
    }
}
