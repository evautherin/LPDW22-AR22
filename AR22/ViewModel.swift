//
//  ViewModel.swift
//  AR22
//
//  Created by Etienne Vautherin on 09/02/2022.
//

import Foundation
import Combine
import SwiftUI
import RealityKit


class ViewModel: ObservableObject {
    @Published var arView = ARView(frame: .zero)
    
    func addCube() {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
