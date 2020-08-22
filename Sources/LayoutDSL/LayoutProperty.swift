//
//  LayoutProperty.swift
//  LayoutDSL
//
//  Created by Saeed Taheri on 1/14/19.
//  Copyright © 2019 Saeed Taheri. All rights reserved.
//

import UIKit

public struct LayoutProperty<Anchor: LayoutAnchor> {
    fileprivate let anchor: Anchor
}

public class LayoutProxy {
    public lazy var leading = property(with: view.leadingAnchor)
    public lazy var trailing = property(with: view.trailingAnchor)
    public lazy var left = property(with: view.leftAnchor)
    public lazy var right = property(with: view.rightAnchor)
    public lazy var top = property(with: view.topAnchor)
    public lazy var bottom = property(with: view.bottomAnchor)
    public lazy var width = property(with: view.widthAnchor)
    public lazy var height = property(with: view.heightAnchor)
    public lazy var centerX = property(with: view.centerXAnchor)
    public lazy var centerY = property(with: view.centerYAnchor)
    public lazy var firstBaseline = property(with: view.firstBaselineAnchor)
    public lazy var lastBaseline = property(with: view.lastBaselineAnchor)

    private let view: UIView

    fileprivate init(view: UIView) {
        self.view = view
    }

    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
}

extension LayoutProperty {

    @discardableResult
    public func equal(to otherAnchor: Anchor,
                      offsetBy constant: CGFloat = 0.0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func greaterThanOrEqual(to otherAnchor: Anchor,
                                   offsetBy constant: CGFloat = 0.0,
                                   priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func lessThanOrEqual(to otherAnchor: Anchor,
                                offsetBy constant: CGFloat = 0.0,
                                priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}

extension LayoutProperty where Anchor == NSLayoutDimension {
    @discardableResult
    public func equal(to constant: CGFloat,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func greaterThanOrEqual(to constant: CGFloat,
                                   priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func lessThanOrEqual(to constant: CGFloat,
                                priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func equal(to otherAnchor: NSLayoutDimension,
                      multiplier: CGFloat = 1.0,
                      constant: CGFloat = 0.0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherAnchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func greaterThanOrEqual(to otherAnchor: NSLayoutDimension,
                                   multiplier: CGFloat = 1.0,
                                   constant: CGFloat = 0.0,
                                   priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                                           multiplier: multiplier,
                                           constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func lessThanOrEqual(to otherAnchor: NSLayoutDimension,
                                multiplier: CGFloat = 1.0,
                                constant: CGFloat = 0.0,
                                priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}

extension UIView {
    public func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}
