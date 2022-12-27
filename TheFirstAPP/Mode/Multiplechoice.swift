//
//  Multiplechoice.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI



struct Multiplechoice: View {
    @State private var value: Double = 0.5
    @State private var dragging = false

    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
            Text("\(value)")
            Circle()
                .fill(Color.gray)
                .frame(width: 20, height: 20)
                .offset(x: (value - 0.5) * 200, y: 0)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.dragging = true
                            self.value = min(1, max(0, value.location.x / 200 + 0.5))
                        }
                        .onEnded { _ in
                            self.dragging = false
                        }
                )
            Circle()
                .trim(from: 0, to: CGFloat(value))
                .stroke(Color.red, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
        }
    }
}
struct Multiplechoice_Previews: PreviewProvider {
    static var previews: some View {
        Multiplechoice()
    }
}
