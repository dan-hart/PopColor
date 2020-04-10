//
//  UIColorExtensions.swift
//  PopColor
//
//  Created by Dan Hart on 4/10/20.
//  Copyright © 2020 Coded By Dan. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
    /// The SwiftUI color associated with the receiver.
    var swiftUIColor: Color { Color(self) }
}
