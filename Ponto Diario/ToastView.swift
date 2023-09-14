//
//  ToastView.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 13/09/23.
//

import UIKit

class ToastView: UIView {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    class func loadFromNib(style: ToastStyle) -> ToastView {
        let nib = UINib(nibName: "ToastView", bundle: nil)
        if let toastView = nib.instantiate(withOwner: self).first as? ToastView {
            toastView.setStyle(for: style)
            return toastView
        }
        return ToastView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        alpha = 0.0
        layer.cornerRadius = 8
    }
    
    private func setStyle(for style: ToastStyle) {
        let iconName: String
        let backgroundColor: UIColor
        switch style {
        case .success:
            iconName = "checkmark.circle.fill"
            backgroundColor = UIColor(red: 0, green: 0.651, blue: 0.314, alpha: 1)
        case .failed:
            iconName = "xmark.circle.fill"
            backgroundColor = UIColor(red: 0.949, green: 0.239, blue: 0.31, alpha: 1)
        case .alert:
            iconName = "exclamationmark.circle.fill"
            backgroundColor = UIColor(red: 1, green: 0.467, blue: 0.2, alpha: 1)
        case .neutral:
            iconName = "info.circle.fill"
            backgroundColor = UIColor(red: 0, green: 0.620, blue: 0.890, alpha: 1)
        }

        self.backgroundColor = backgroundColor
        
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .black, .black.withAlphaComponent(0.25)])
        let image = UIImage(systemName: iconName)
        iconImageView.image = image?.applyingSymbolConfiguration(config)
    }
    
    func setMessage(_ message: String) {
        messageLabel.text = message
    }
    
    func show() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        let x = window.frame.width
        let y = window.frame.height - 100
        let width = frame.width - 8
        let height = frame.height
        frame = CGRect(x: x, y: y , width: width, height: height)
        
        window.addSubview(self)
        
        let delayToRemoveToast = 5.0
        let animationDuration = 0.3
        UIView.animate(withDuration: animationDuration) {
            print(window.frame.width, self.frame.width)
            self.frame.origin.x = 16
            self.alpha = 1.0
        } completion: { _ in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delayToRemoveToast) {
                self.hide()
            }
        }
    }
    
    func hide() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        let animationDuration = 0.3
        UIView.animate(withDuration: animationDuration) {
            self.frame.origin.x = window.frame.width
            self.alpha = 0.0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}
