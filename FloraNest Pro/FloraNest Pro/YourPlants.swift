import SwiftUI
import Combine

struct YourPlants: View {
    @State private var hexColor: String = "#0A1D12"
    
    var body: some View {
        ZStack {
            (Color(hex: hexColor) ?? Color.green)
                .ignoresSafeArea()
            ZStack {
                VStack(spacing: 0) {
                    
                    VStack(spacing: 10) {
                        
                        HStack(alignment: .center, spacing: 15) {
                            Image("newLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .foregroundColor(.white)
                            
                            Image("Floranest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 19)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 24)
                        
                        ZStack {
                            Image("Plantsbackground")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 220)
                                .clipped()
                                .cornerRadius(50, corners: [.topLeft, .topRight])
                                .opacity(0.9)
                            
                            Image("LearnAboutFloraNest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 11)
                                .padding(.bottom, 25)
                                .opacity(0)
                        }
                    }
                    
                    // White box with sections
                    VStack(spacing: 10) {
                        Spacer()
                        
                        // Footer with 3 buttons
                        HStack(spacing: 20) {
                            Button(action: {
                                // Button 1 action
                            }) {
                                VStack {
                                    Text("")
                                        .font(.dmMonoRegular(size: 24))
                                        .foregroundColor(Color.black)
                                }
                                .foregroundColor(Color(hex: hexColor) ?? Color.green)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Button 2 action
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.clear)
                                        .frame(width: 90, height: 35)
                                    
                                    Text("Home")
                                        .font(.dmMonoRegular(size: 20))
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            Button(action: {
                                // Button 3 action
                            }) {
                                VStack {
                                    Text(">")
                                        .font(.dmMonoRegular(size: 24))
                                        .foregroundColor(Color.black)
                                }
                                .foregroundColor(Color(hex: hexColor) ?? Color.white)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(Color.clear)
                        .cornerRadius(20, corners: [.topRight, .topLeft])
                    }
                    .background(Color(hex: hexColor) ?? Color.green)
                    .cornerRadius(50, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                    .edgesIgnoringSafeArea(.bottom)
                    .padding(.top, -40)

                }
            }
        }
    }
}

#Preview {
    YourPlants()
}
