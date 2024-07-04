//
//  DiamondShape.swift
//  SetGame
//
//  Created by seemakus on 6/27/24.
//

import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: CGPoint(x: rect.minX, y: center.y)) // Left point
               path.addLine(to: CGPoint(x: center.x, y: rect.minY)) // Top point
               path.addLine(to: CGPoint(x: rect.maxX, y: center.y)) // Right point
               path.addLine(to: CGPoint(x: center.x, y: rect.maxY)) // Bottom point
               path.closeSubpath() // Close the path to complete the shape
               
               return path
    }
    
    
}
