//
//  LayoutAnchor.swift
//  LayoutDSL
//
//  Created by Saeed Taheri on 1/14/19.
//  Copyright © 2019 Saeed Taheri. All rights reserved.
//

import UIKit

public protocol LayoutAnchor {
    func constraint(equalTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {
}
