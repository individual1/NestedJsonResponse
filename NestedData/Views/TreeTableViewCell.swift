//
//  TreeTableViewCell.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit

class TreeTableViewCell : UITableViewCell {

    @IBOutlet private weak var additionalButton: UIButton!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var customTitleLabel: UILabel!

    private var additionalButtonHidden : Bool {
        get {
            return additionalButton.isHidden;
        }
        set {
            additionalButton.isHidden = newValue;
        }
    }

    override func awakeFromNib() {
        selectedBackgroundView? = UIView()
        selectedBackgroundView?.backgroundColor = .clear
    }

    var additionButtonActionBlock : ((TreeTableViewCell) -> Void)?;

    func setup(withTitle title: String, detailsText: String, level : Int, additionalButtonHidden: Bool) {
        customTitleLabel.text = title
        self.backgroundColor = UIColor.white
        self.contentView.backgroundColor = backgroundColor
        let left = 11.0 + 20.0 * CGFloat(level)
        self.customTitleLabel.frame.origin.x = left
    }

    func additionButtonTapped(_ sender : AnyObject) -> Void {
        if let action = additionButtonActionBlock {
            action(self)
        }
    }

}
