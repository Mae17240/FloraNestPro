import SwiftUI
import Combine

struct YourPlants: View {
    @State private var hexColor: String = "#182212"
    @Environment(\.dismiss) var dismiss
    @State private var isDarkMode: Bool? = nil // nil = auto (follow system), true = dark, false = light
    @Environment(\.colorScheme) var systemColorScheme
    
    // Care history model and state
    struct CareItem: Identifiable {
        let id = UUID()
        let title: String
        let date: Date
        var checked: Bool
    }
    @State private var careHistory: [CareItem] = []
    
    //
    private func addTestItem() {
        let new = CareItem(title: "Watered a plant", date: Date(), checked: true)
        withAnimation(.easeIn) {
            careHistory.insert(new, at: 0)
        }
    }
    
    //
    var effectiveDarkMode: Bool {
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
            Color.clear.onAppear { print("YourPlants appeared") }
            backgroundColor
                .ignoresSafeArea()
            ZStack {
                VStack(spacing: 0) {
                    
                    VStack(spacing: 10) {
                        
                        ZStack {
                            Image("YourPlantsBkg")
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
                    
                    VStack(spacing: 6) {
                        Spacer().frame(height: 12)
                        
                        // Your plants headder
                        VStack {
                            HStack() {
                                Text("Ruby's")
                                    .foregroundColor(textColor)
                                    .font(.dmSansBold(size: 25))
                                
                                Text("Plants.")
                                    .foregroundColor(textColor)
                                    .font(.dmSansExtraBold(size: 20))
                                    .padding(.top, 2)
                                
                                
                                
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                            
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)

                        
                        // summary + reminders on the left, checklist on the right
                        HStack(alignment: .top, spacing: 8) {
                           
                            VStack(spacing: 8) {
                                VStack {
                                    HStack(spacing: 12) {
                                        Image(effectiveDarkMode ? "SunPlantLight" : "SunPlantDark")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 35)
                                            .foregroundColor(effectiveDarkMode ? (Color(hex: hexColor) ?? Color.green) : textColor)
                                            .animation(.easeInOut(duration: 0.3), value: effectiveDarkMode)
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Collection")
                                                .font(.dmSansExtraBold(size: 16))
                                                .foregroundColor(textColor)
                                            Text("You have 5 plants")
                                                .font(.dmSansMedium(size: 13))
                                                .foregroundColor(textColor.opacity(0.9))
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 5)
                                }
                                .frame(height: 64)
                                .background(
                                    ZStack {
                                        if effectiveDarkMode {
                                            RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0))
                                        } else {
                                            RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0))
                                        }
                                    }
                                )
                                
                                // Reminders card
                                VStack {
                                    HStack(spacing: 12) {
                                        Image(effectiveDarkMode ? "PlantCircleWhite" : "plantCircle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 35)
                                            .foregroundColor(effectiveDarkMode ? Color.white : textColor)
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Reminders")
                                                .font(.dmSansExtraBold(size: 16))
                                                .foregroundColor(textColor)
                                            Text("Watering in 2 days")
                                                .font(.dmSansRegular(size: 13))
                                                .foregroundColor(textColor.opacity(0.9))
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 5)
                                }
                                .frame(height: 70)
                                .background(
                                    ZStack {
                                        if effectiveDarkMode {
                                            RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0))
                                        } else {
                                            RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0))
                                        }
                                    }
                                )
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.leading, 12)
                            .padding(.trailing, 3)
                            
                            
                            VStack(spacing: 8) {
                                HStack {
                                   
                                    Spacer()
                                    
                                }
                                .padding(.horizontal, 12)
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    VStack(spacing: 8) {
                                        ForEach(careHistory) { item in
                                            HStack(alignment: .top, spacing: 12) {

                                                let isDark = effectiveDarkMode
                                                let checkedBg = isDark ? Color.white.opacity(0.18) : (Color(hex: hexColor) ?? Color.green).opacity(0.12)
                                                let checkedFg = isDark ? Color.white : (Color(hex: hexColor) ?? Color.green)
                                                let uncheckedStroke = isDark ? Color.white.opacity(0.18) : Color.black.opacity(0.06)
                                                let uncheckedFg = isDark ? Color.white.opacity(0.9) : textColor.opacity(0.6)
                                                
                                                ZStack {
                                                    if item.checked {
                                                        Circle()
                                                            .fill(checkedBg)
                                                            .frame(width: 25, height: 25)
                                                        Image(systemName: "checkmark")
                                                            .font(.system(size: 14, weight: .semibold))
                                                            .foregroundColor(checkedFg)
                                                    } else {
                                                        Circle()
                                                            .stroke(uncheckedStroke, lineWidth: 1)
                                                            .frame(width: 10, height: 10)
                                                        Image(systemName: "circle")
                                                            .font(.system(size: 18, weight: .semibold))
                                                            .foregroundColor(uncheckedFg)
                                                    }
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(item.title)
                                                        .font(.dmSansRegular(size: 14))
                                                        .foregroundColor(textColor)
                                                    Text(item.date, style: .time)
                                                        .font(.dmMonoLight(size: 12))
                                                        .foregroundColor(textColor.opacity(0.6))
                                                }
                                                Spacer()
                                            }
                                            .padding(.vertical, 6)
                                            .padding(.horizontal, 8)
                                        }
                                    }
                                    .padding(.vertical, 4)
                                }
                                .frame(height: 140) // height
                            }
                            .frame(width: 175) //shift left
                            .padding(.trailing, 6)
                        }
                        .padding(.top, 2)
                        

                        

                        Rectangle() // divider
                            .fill(effectiveDarkMode ? Color.white.opacity(0.06) : Color.black.opacity(0.5))
                            .frame(height: 0.8)
                            .padding(.leading, 16)
                            .padding(.trailing, 30)
                            .padding(.top, 30)
                        

                        Button(action: addTestItem) {
                            Text("Add Test")
                                .font(.dmSansRegular(size: 14))
                                .foregroundColor(effectiveDarkMode ? (Color(hex: hexColor) ?? Color.green) : textColor)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 18)
                                .background(effectiveDarkMode ? Color.white.opacity(0.12) : Color.black.opacity(0.06))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 6)
                        
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
