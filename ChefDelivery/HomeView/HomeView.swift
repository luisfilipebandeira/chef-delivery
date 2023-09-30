//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Luis Bandeira on 30/09/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var imageOffSet: CGSize = .zero
    
    var body: some View {
        GeometryReader {geometry in
            ZStack {
                Circle()
                    .foregroundColor(.colorRed)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(CGPoint(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100))
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(.colorRedDark)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(CGPoint(
                        x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                        y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50))
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.colorRed)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffSet.width, y: imageOffSet.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffSet = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffSet = .zero
                                    }
                                })
                        )
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
            }
            }
        }
    }
}

struct HomeView_previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
