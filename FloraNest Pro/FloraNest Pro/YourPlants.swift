import SwiftUI
import Combine

struct YourPlants: View {
    @State private var hexColor: String = "#182212"
    @Environment(\.dismiss) var dismiss
    @State private var isDarkMode: Bool? = nil // nil = auto (follow system), true = dark, false = light
    @Environment(\.colorScheme) var systemColorScheme
    
    // Computed properties for dynamic colors
    var effectiveDarkMode: Bool {
        // If isDarkMode is nil, follow system setting; otherwise use the manual override
        isDarkMode ?? (systemColorScheme == .dark)
    }
    
    var backgroundColor: Color {
        effectiveDarkMode ? (Color(hex: hexColor) ?? Color.green) : Color.white
    }
    
    var textColor: Color {
        effectiveDarkMode ? .white : .black
    }
    
    var boxColor: Color {
        effectiveDarkMode ? (Color(hex: hexColor) ?? Color.green) : .white
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            ZStack {
                VStack(spacing: 0) {
                    
                    VStack(spacing: 10) {
                        
                        ZStack {
                            Image("Background12")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 220)
                                .clipped()
                                .cornerRadius(50, corners: [.topLeft, .topRight])
                                .opacity(0.9)
                                .padding(.top, 59)
                            
                            Image("LearnAboutFloraNest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 11)
                                .padding(.bottom, 25)
                                .opacity(0)
                        }
                    }
                    
                    // Green Main Box
                    
                    VStack(spacing: 10) {
                        Spacer().frame(height: 24)
                        
                        // Your plants headder
                        VStack {
                            HStack() {
                                Text("Ruby's")
                                    .foregroundColor(textColor)
                                    .font(.dmSansBold(size: 25))
                                
                                Text("Plants.")
                                    .foregroundColor(textColor)
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
                       
                        
                        Spacer()
                        
                        // Footer with 3 buttons
                        HStack(spacing: 20) {
                            Button(action: {
                                dismiss()
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(effectiveDarkMode ? Color.white.opacity(0.2) : Color.black.opacity(0.1))
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(textColor)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            }
                            
                            Button(action: {
                                dismiss()
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(effectiveDarkMode ? Color.white.opacity(0.7) : Color.black.opacity(0.1))
                                        .frame(width: 90, height: 35)
                                    
                                    Text("Home")
                                        .font(.dmSansMedium(size: 16))
                                        .foregroundColor(effectiveDarkMode ? Color(hex: hexColor) ?? Color.green : textColor)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            Button(action: {
                                
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(effectiveDarkMode ? Color.white.opacity(0.1) : Color.black.opacity(0.1))
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(textColor)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 8)
                            }
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(Color.clear)
                    }
                    .background(boxColor)
                    .cornerRadius(50, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                    .edgesIgnoringSafeArea(.bottom)
                    .padding(.top, -40)

                }
                
                // Header overlay - always on top
                VStack {
                    HStack(alignment: .center, spacing: 15) {
                        Image(effectiveDarkMode ? "Darkmode" : "Lightmode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(textColor)
                            .animation(.easeInOut(duration: 0.3), value: effectiveDarkMode)
                        
                        Image("Floranest")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 19)
                            .foregroundColor(textColor)
                            .animation(.easeInOut(duration: 0.3), value: effectiveDarkMode)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Toggle tapped! Current isDarkMode: \(String(describing: isDarkMode)), System: \(systemColorScheme)")
                            withAnimation(.easeInOut(duration: 0.3)) {
                                if isDarkMode == nil {
                                    // Currently auto, switch to opposite of current system mode
                                    isDarkMode = !effectiveDarkMode
                                } else {
                                    // Currently manual override, toggle it
                                    isDarkMode?.toggle()
                                }
                            }
                        }) {
                            Image(systemName: effectiveDarkMode ? "moon.fill" : "sun.max.fill")
                                .foregroundColor(textColor)
                                .font(.system(size: 24))
                                .frame(width: 44, height: 44)
                                .contentShape(Rectangle())
                                .animation(.easeInOut(duration: 0.3), value: effectiveDarkMode)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 24)
                    .background(Color.clear)
                    
                    Spacer()
                }
                .zIndex(1000)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    YourPlants()
}
