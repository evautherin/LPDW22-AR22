//
//  ARUIView.swift
//  AR22
//
//  Created by Etienne Vautherin on 09/02/2022.
//

import SwiftUI

struct ARUIView: View {
    @ObservedObject var model: ViewModel

    var body: some View {
        let formattedX = String(format: "%.1f", model.translation.x)
        let formattedY = String(format: "%.1f", model.translation.y)
        let formattedZ = String(format: "%.1f", model.translation.z)

        VStack {
            Stepper(
                "X: \(formattedX)",
                value: $model.translation.x,
                in: -100...100)
            Stepper(
                "Y: \(formattedY)",
                value: $model.translation.y,
                in: -100...100)
            Stepper(
                "Z: \(formattedZ)",
                value: $model.translation.z,
                in: -100...100)
        }.frame(width: 180.0)
    }
}

struct ARUIView_Previews: PreviewProvider {
    static var previews: some View {
        ARUIView(model: ViewModel())
    }
}
