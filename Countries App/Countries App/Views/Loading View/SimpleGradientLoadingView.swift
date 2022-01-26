import UIKit

class SimpleGradientLoadingView: UIView, NibLoadable {

    @IBOutlet weak var imagePlaceholderView: GradientView!
    @IBOutlet weak var firstLabelPlaceholder: GradientView!
    @IBOutlet weak var secondLabelPlaceholder: GradientView!

    override func awakeFromNib() {
        applyStyling()
        layer.cornerRadius = 15
    }

    private func applyGradient() {
        imagePlaceholderView.applyLoadingGradient()
        firstLabelPlaceholder.applyLoadingGradient()
        secondLabelPlaceholder.applyLoadingGradient()
    }

    func applyStyling() {
        imagePlaceholderView.layer.cornerRadius = imagePlaceholderView.layer.frame.width / 2.0
        imagePlaceholderView.layer.cornerCurve = .continuous
        firstLabelPlaceholder.layer.cornerRadius = 8
        secondLabelPlaceholder.layer.cornerRadius = 8

        applyGradient()
    }
}
