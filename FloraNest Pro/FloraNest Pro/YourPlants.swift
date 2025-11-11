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
                                .opacity(0.8)
                            
                            
                        }
                    }
                    
                    // Green Main Box
                    
                    VStack(spacing: 10) {
                        Spacer().frame(height: 24)
                        
                        // Your plants headder
                        VStack {
                            HStack() {
                                Text("Ruby's")
                                    .foregroundColor(.white)
                                    .font(.dmSansExtraBold(size: 25))
                                
                                Text("Plants.")
                                    .foregroundColor(.white)
                                    .font(.dmMonoLight(size: 20))
                                    .padding(.top, 2)
                                
                                    
                                
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                            
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        
                        // Section 2
                        VStack {
                            HStack(alignment: .top, spacing: 10) {
                                Text("+")
                                    .font(.dmSansRegular(size: 18))
                                    .foregroundColor(.white)
    
                                
                                Text("Plant Reminders !")
                                    .font(.dmSansExtraBold(size: 18))
                                    .foregroundColor(.white)
                                    .padding(.top, 3)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 17)
                            
                            Text("You have 5 plants that require attention.")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .padding(.top, -6)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        
                        // Section 3
                        VStack {
                            HStack(alignment: .top, spacing: 10) {
                                Text("+")
                                    .font(.dmSansRegular(size: 18))
                                    .foregroundColor(.white)
                                    .padding(.top, 8)
                                
                                Text("Plants collected")
                                    .font(.dmSansExtraBold(size: 18))
                                    .foregroundColor(.white)
                                    .padding(.top, 8)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            
                            Text("You have collected 5 plants")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .padding(.top, -6)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        
                        // Section 4
                        VStack {
                            HStack(alignment: .top, spacing: 10) {
                               
                                
                                Image("Cloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                
                                Text("Weather in your area")
                                    .font(.dmSansExtraBold(size: 18))
                                    .foregroundColor(.white)
                                
                                    
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            
                            Text("Rain for the next 3 hours")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .padding(.top, -6)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("18°c")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .padding(.top, -6)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        
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
                                        .foregroundColor(.white)
                                    
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            Button(action: {
                                // Button 3 action
                            }) {
                                VStack {
                                    Text(">")
                                        .font(.dmMonoRegular(size: 24))
                                        .foregroundColor(Color.white)
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
        .navigationBarHidden(true)
    }
}

#Preview {
    YourPlants()
}
