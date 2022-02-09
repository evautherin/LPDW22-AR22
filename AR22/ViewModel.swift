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
import simd


class ViewModel: ObservableObject {
    @Published var arView = ARView(frame: .zero)
    @Published var translation = SIMD3<Float>.zero
    
    var subscription: Cancellable?
    
    init() {
        subscription = $translation.sink(receiveValue: translateCube)
    }
    
    
    func addCube() {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    
    
    func translateCube(translation: SIMD3<Float>) {
        let anchors = arView.scene.anchors
        
        guard
            !anchors.isEmpty,
            let box = anchors[0] as? Experience.Box,
            let steelBox = box.steelBox
        else { return }
        
        let translationCentimeter = translation/100.0
        steelBox.transform.translation = translationCentimeter
    }
}
