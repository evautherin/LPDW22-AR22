//
//  ContentView.swift
//  AR22
//
//  Created by Etienne Vautherin on 09/02/2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @StateObject var model = ViewModel()
    
    var body: some View {
        ZStack {
            ARViewContainer(model: model)
            VStack {
                Button {
                    model.addCube()
                } label: {
                    Image(systemName: "plus.circle")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var model: ViewModel
    
    func makeUIView(context: Context) -> ARView {
        let arView = model.arView // ARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
