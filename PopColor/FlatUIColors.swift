//
//  FlatUIColors.swift
//  FlatUIColors
//
//  Created by bryn austin bellomy on 6.16.14.
//  Copyright (c) 2014 bryn austin bellomy. All rights reserved.
//

import Foundation
import UIKit

/**
    Contains helpers for generating color values from the Flat UI color palette (see http://flatuicolors.com/).
 */
public struct FlatUIColors
{
#if os(iOS)
    public typealias OSColor = UIColor
#elseif os(OSX)
    public typealias OSColor = NSColor
#endif

    /**
        Generates an NS- or UIColor from a hex color string.

        - parameter hex: The hex color string from which to create the color object.  '#' sign is optional.
     */
    public static func colorFromHexCode(_ hex:String) -> OSColor!
    {
        var colorString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if colorString.hasPrefix("#") {
            colorString = colorString.fui_substringFromIndex(1)
        }

        let stringLength = colorString.count
        if stringLength != 6 && stringLength != 8 {
            return nil
        }

        let rString = colorString.fui_substringToIndex(2)
        let gString = colorString.fui_substringFromIndex(2).fui_substringToIndex(2)
        let bString = colorString.fui_substringFromIndex(4).fui_substringToIndex(2)
        var aString : String?
        if stringLength == 8 { aString = colorString.fui_substringFromIndex(6).fui_substringToIndex(2) }

        var r: CUnsignedInt = 0
        var g: CUnsignedInt = 0
        var b: CUnsignedInt = 0
        var a: CUnsignedInt = 1

        Scanner(string:rString).scanHexInt32(&r)
        Scanner(string:gString).scanHexInt32(&g)
        Scanner(string:bString).scanHexInt32(&b)
        if let aString = aString {
            Scanner(string:aString).scanHexInt32(&a)
        }

        let red     = CGFloat(r) / 255.0
        let green   = CGFloat(g) / 255.0
        let blue    = CGFloat(b) / 255.0
        let alpha   = CGFloat(a) / 255.0
        return OSColor(red:red, green:green, blue:blue, alpha:alpha)
    }

    fileprivate static func alphaHEX(_ alpha: CGFloat) -> String {
        
        if alpha <= 1 {
            return String(Int(alpha * 255), radix: 16, uppercase: true)
        } else { return "FF" }
    }
    /*
    public static func turquoise(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.turquoise + alphaHEX(alpha)) }
    public static func greenSea(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.greenSea + alphaHEX(alpha)) }
    public static func mediumTurquoise(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.mediumTurquoise + alphaHEX(alpha)) }
    public static func lightSeaGreen(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.lightSeaGreen + alphaHEX(alpha)) }
    public static func emerald(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.emerald + alphaHEX(alpha)) }
    public static func nephritis(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.nephritis + alphaHEX(alpha)) }
    public static func gossip(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.gossip + alphaHEX(alpha)) }
    public static func salem(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.salem + alphaHEX(alpha)) }
    public static func peterRiver(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.peterRiver + alphaHEX(alpha)) }
    public static func belizeHole(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.belizeHole + alphaHEX(alpha)) }
    public static func riptide(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.riptide + alphaHEX(alpha)) }
    public static func dodgerBlue(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.dodgerBlue + alphaHEX(alpha)) }
    public static func amethyst(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.amethyst + alphaHEX(alpha)) }
    public static func wisteria(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.wisteria + alphaHEX(alpha)) }
    public static func lightWisteria(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.lightWisteria + alphaHEX(alpha)) }
    public static func plum(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.plum + alphaHEX(alpha)) }
    public static func wetAsphalt(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.wetAsphalt + alphaHEX(alpha)) }
    public static func midnightBlue(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.midnightBlue + alphaHEX(alpha)) }
    public static func hoki(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.hoki + alphaHEX(alpha)) }
    public static func ebonyClay(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.ebonyClay + alphaHEX(alpha)) }
    public static func sunflower(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.sunflower + alphaHEX(alpha)) }
    public static func tangerine(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.tangerine + alphaHEX(alpha)) }
    public static func confetti(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.confetti + alphaHEX(alpha)) }
    public static func capeHoney(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.capeHoney + alphaHEX(alpha)) }
    public static func carrot(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.carrot + alphaHEX(alpha)) }
    public static func pumpkin(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.pumpkin + alphaHEX(alpha)) }
    public static func ecstasy(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.ecstasy + alphaHEX(alpha)) }
    public static func jaffa(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.jaffa + alphaHEX(alpha)) }
    public static func alizarin(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.alizarin + alphaHEX(alpha)) }
    public static func pomegranate(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.pomegranate + alphaHEX(alpha)) }
    public static func monza(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.monza + alphaHEX(alpha)) }
    public static func thunderBird(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.thunderbird + alphaHEX(alpha)) }
    public static func clouds(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.clouds + alphaHEX(alpha)) }
    public static func silver(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.silver + alphaHEX(alpha)) }
    public static func gallery(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.gallery + alphaHEX(alpha)) }
    public static func iron(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.iron + alphaHEX(alpha)) }
    public static func concrete(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.concrete + alphaHEX(alpha)) }
    public static func asbestos(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.asbestos + alphaHEX(alpha)) }
    public static func pumice(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.pumice + alphaHEX(alpha)) }
    public static func lynch(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.lynch + alphaHEX(alpha)) }
     */
    static var sharedCodes = ColorCodes()
    
    /**
        Contains hex color code strings for the Flat UI color palette.
     */
    public struct ColorCodes: Loopable
    {
        public let turquoise = "1abc9c"
        public let greenSea  = "16a085"
        public let mediumTurquoise = "4ECDC4"
        public let lightSeaGreen = "1BA39C"
        public let emerald  = "2ecc71"
        public let nephritis = "27ae60"
        public let gossip = "87D37C"
        public let salem = "1E824C"
        public let peterRiver = "3498D8"
        public let belizeHole = "2980b9"
        public let riptide = "86E2D5"
        public let dodgerBlue = "19B5FE"
        public let amethyst = "9b59b6"
        public let wisteria = "8e44ad"
        public let lightWisteria = "BE90D4"
        public let plum = "913D88"
        public let wetAsphalt = "34495e"
        public let midnightBlue = "2C3E50"
        public let hoki = "67809F"
        public let ebonyClay = "22313F"
        public let sunflower = "F1C40F"
        public let tangerine = "F39C12"
        public let confetti = "E9D460"
        public let capeHoney = "FDE3A7"
        public let carrot = "E67E22"
        public let pumpkin = "D35400"
        public let ecstasy = "F9690E"
        public let jaffa = "F27935"
        public let alizarin = "E74C3C"
        public let pomegranate = "C0392B"
        public let monza = "CF000F"
        public let thunderbird = "D91E18"
        public let clouds = "ECF0F1"
        public let silver = "BDC3C7"
        public let gallery = "EEEEEE"
        public let iron = "DADFE1"
        public let concrete = "95A5A6"
        public let asbestos = "7F8C8D"
        public let pumice = "D2D7D3"
        public let lynch = "6C7A89"
    }
}


private extension String
{
    func fui_substringFromIndex(_ index: Int) -> String
    {
        let newStart = self.index(startIndex, offsetBy: index)
        return String(self[newStart ..< endIndex])
    }



    func fui_substringToIndex(_ index: Int) -> String
    {
        let newEnd = self.index(startIndex, offsetBy: index)
        return String(self[startIndex ..< newEnd])
    }
}

protocol Loopable {
    func allProperties() throws -> [String: Any]
}

extension Loopable {
    func allProperties() throws -> [String: Any] {
        var result = [String: Any]()
        Mirror(reflecting: self).children.forEach { child in
            if let property = child.label {
                result[property] = child.value
            }
        }
        return result
    }
}
