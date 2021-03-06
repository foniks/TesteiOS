//
//  SuccessBackgroundView.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

protocol SuccessBackgroundViewDelegate {
    func buttonDismissClicked()
}

class SuccessBackgroundView: UIView {
    // MARK: - @IBOutlet
    
    @IBOutlet var view: UIView!
    
    // MARK: - Class variabels
    
    var delegate: SuccessBackgroundViewDelegate? = nil
    
    // MARK: - UIView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, delegate: SuccessBackgroundViewDelegate?) {
        super.init(frame: frame)
        UINib(nibName: "SuccessBackgroundView", bundle: nil).instantiate(withOwner: self, options: nil)
        self.view.frame = frame
        self.addSubview(self.view)
        
        self.delegate = delegate
    }
    
    // MARK: - @IBAction
    
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        self.delegate?.buttonDismissClicked()
    }
}
