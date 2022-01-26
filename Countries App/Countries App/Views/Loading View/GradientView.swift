import UIKit

class GradientView: UIView {
    var gradientLayer: CAGradientLayer?

    func applyLoadingGradient() {
        let gradientColorOne: CGColor = UIColor(white: 0.55, alpha: 1.0).cgColor
        let gradientColorTwo: CGColor = UIColor(white: 0.65, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = self.layer.frame
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo,   gradientColorOne]

        gradientLayer.locations = [0.0, 0.5, 1.0]
       gradientLayer.applyLeftTorightAnimation()
        self.layer.addSublayer(gradientLayer)
        self.gradientLayer = gradientLayer
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer?.frame = self.bounds
    }
}

extension CAGradientLayer {
    func applyLeftTorightAnimation() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 2
        self.add(animation, forKey: animation.keyPath)
    }
}
