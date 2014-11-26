//
//  SplashView.swift
//  mmytoasty
//
//  Created by Nick Gamroth on 11/25/14.
//  Copyright (c) 2014 asdf. All rights reserved.
//

import UIKit

class SplashView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        // Get the Graphics Context
        var context = UIGraphicsGetCurrentContext();
        
        // Set the line width
        CGContextSetLineWidth(context, 25.0);
        
        var h = frame.height;
        var divisions = Int(h / 25);
        for i in 0 ... divisions {
            var color = getRandomColor();
            color.setStroke();
        
            var y = CGFloat(i * 25);
            CGContextMoveToPoint(context, 0, y);
            CGContextAddLineToPoint(context, frame.width, y);
        
            // Draw
            CGContextStrokePath(context);
        }
        drawString(context, text: "##########  YOU    ARE  ##########", yPos: 200);
        drawString(context, text: "######### MOTHER  FUCKER #########", yPos: 300);
    }
    
    func drawString(context: CGContext, text: String, yPos: Int) {
        CGContextScaleCTM(context, 1.0, -1.0)
        let aFont = UIFont(name: "Optima-Bold", size: 20)
        // create a dictionary of attributes to be applied to the string
        let attr:CFDictionaryRef = [NSFontAttributeName:aFont!,NSForegroundColorAttributeName:UIColor.whiteColor()]
        // create the attributed string
        let text = CFAttributedStringCreate(nil, text, attr)
        // create the line of text
        let line = CTLineCreateWithAttributedString(text)
        // retrieve the bounds of the text
        let bounds = CTLineGetBoundsWithOptions(line, CTLineBoundsOptions.UseOpticalBounds)
        // set the line width to stroke the text with
        CGContextSetLineWidth(context, 1.5)
        // set the drawing mode to stroke
        //CGContextSetTextDrawingMode(context, kCGTextStroke)
        // Set text position and draw the line into the graphics context, text length and height is adjusted for
        let xn = CGFloat(5.0)
        let yn = CGFloat(-1 * yPos)
        CGContextSetTextPosition(context, xn, yn)
        // the line of text is drawn - see https://developer.apple.com/library/ios/DOCUMENTATION/StringsTextFonts/Conceptual/CoreText_Programming/LayoutOperations/LayoutOperations.html
        // draw the line of text
        CTLineDraw(line, context)
    }
    
    func getRandomColor() -> UIColor {
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
