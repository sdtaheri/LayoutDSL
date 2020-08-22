//
//  OperatorOverload.swift
//  LayoutDSL
//
//  Created by Saeed Taheri on 1/14/19.
//  Copyright © 2019 Saeed Taheri. All rights reserved.
//

import UIKit

infix operator =*
infix operator <*
infix operator >*

public func =*<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func <*<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func >*<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                                rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

public func == (lhs: LayoutProperty<NSLayoutDimension>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

public func =* (lhs: LayoutProperty<NSLayoutDimension>, rhs: (NSLayoutDimension, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1)
}

public func =* (lhs: LayoutProperty<NSLayoutDimension>, rhs: (NSLayoutDimension, CGFloat, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                                rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >= (lhs: LayoutProperty<NSLayoutDimension>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >* (lhs: LayoutProperty<NSLayoutDimension>, rhs: (NSLayoutDimension, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, multiplier: rhs.1)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                                rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

public func <= (lhs: LayoutProperty<NSLayoutDimension>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}

public func <* (lhs: LayoutProperty<NSLayoutDimension>, rhs: (NSLayoutDimension, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, multiplier: rhs.1)
}
