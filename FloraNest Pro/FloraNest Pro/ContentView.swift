import SwiftUI
import Combine

// Helper to convert hex string to Color
extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        let length = hexSanitized.count
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        let r, g, b, a: Double
        if length == 6 {
            r = Double((rgb & 0xFF0000) >> 16) / 255.0
            g = Double((rgb & 0x00FF00) >> 8) / 255.0
            b = Double(rgb & 0x0000FF) / 255.0
            a = 1.0
        } else if length == 8 {
            r = Double((rgb & 0xFF000000) >> 24) / 255.0
            g = Double((rgb & 0x00FF0000) >> 16) / 255.0
            b = Double((rgb & 0x0000FF00) >> 8) / 255.0
            a = Double(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}


extension Font {
    static func dmSansRegular(size: CGFloat) -> Font {
        .custom("DM Sans", size: size)
    }
    static func dmSansMedium(size: CGFloat) -> Font {
        .custom("DM Sans Medium", size: size)
    }
    static func dmSansBold(size: CGFloat) -> Font {
        .custom("DM Sans Bold", size: size)
    }
    static func dmSansExtraBold(size: CGFloat) -> Font {
        .custom("DM Sans ExtraBold", size: size)
    }
    static func dmMonoRegular(size: CGFloat) -> Font {
        .custom("DM Mono", size: size)
    }
    static func dmMonoLight(size: CGFloat) -> Font {
        .custom("DM Mono Light", size: size)
    }
}

struct ContentView: View {
    @State private var hexColor: String = "#182212"
    // @State private var isLoading: Bool = true
    @State private var showYourPlants = false
    @State private var isDarkMode: Bool? = nil // nil = auto (follow system), true = dark, false = light
    @Environment(\.colorScheme) var systemColorScheme
    
    // dynamic colors
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
        NavigationStack {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                // Group {
                //     if isLoading {
                //         VStack {
                //             Spacer()
                //             Image("LoadingImage")
                //                 .resizable()
                //                 .scaledToFit()
                //                 .frame(width: 700, height: 800)
                //         }
                //         .transition(.opacity)
                //         .opacity(isLoading ? 1 : 0)
                //     } else {
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

                                // White box with sections
                                VStack(spacing: 10) {
                                    Spacer().frame(height: 24)

                                    VStack {
                                        HStack(alignment: .top, spacing: 10) {
                                            Text("+")
                                                .font(.dmMonoRegular(size: 24))
                                                .foregroundColor(textColor)
                                                .padding(.top, 3)
                                                
                                            
                                            Text("Scan plants.")
                                                .font(.dmSansExtraBold(size: 18))
                                                .foregroundColor(textColor)
                                                .padding(.top, 6)
                                            
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 20)


                                        Text("Scan or upload plants from your camera roll for plant detetection, health infomation and plant care.")
                                            .font(.dmMonoRegular(size: 15))
                                            .padding(.top, -6)
                                            .foregroundColor(textColor)
                                            .opacity(0.9)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 20)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 10)
                                    


                                    // Section 2
                                    VStack {
                                        HStack(alignment: .top, spacing: 10) {
                                            Text("+")
                                                .font(.dmMonoRegular(size: 24))
                                                .foregroundColor(textColor)
                                                .padding(.top, 3)

                                            Text("Plant Collection.")
                                                .font(.dmSansExtraBold(size: 18))
                                                .foregroundColor(textColor)
                                                .padding(.top, 6)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 20)
                                        Text("Build and expand your plant collection in your plant garden. ")
                                            .font(.dmMonoRegular(size: 15))
                                            .foregroundColor(textColor)
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
                                                .font(.dmSansRegular(size: 24))
                                                .foregroundColor(textColor)
                                                .padding(.top, 3)

                                            Text("Plant Of the Day.")
                                                .font(.dmSansExtraBold(size: 18))
                                                .foregroundColor(textColor)
                                                .padding(.top, 8)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 20)
                                        Text("Pinus balfouriana, the foxtail pine, is a rare high-elevation pine that is endemic to California, United States. ")
                                            .font(.dmMonoRegular(size: 15))
                                            .foregroundColor(textColor)
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
                                            showYourPlants = true
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
                                            // Button 2 action
                                        }) {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 16)
                                                    .fill(effectiveDarkMode ? Color.white.opacity(0.7) : Color.black.opacity(0.1))
                                                    .frame(width: 90, height: 35)
                                                
                                                Text("+")
                                                    .font(.dmMonoRegular(size: 24))
                                                    .foregroundColor(effectiveDarkMode ? .black : textColor)
                                                    
                                            }
                                        }
                                        .frame(maxWidth: .infinity)

                                        Button(action: {
                                            // Button 3 action
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
                                    .cornerRadius(20, corners: [.topRight, .topLeft])
                                }
                                .background(boxColor)
                                .cornerRadius(50, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                                .edgesIgnoringSafeArea(.bottom)
                                .padding(.top, -70)
                                .padding(.top, 24)
                            }
                            
                            // Header overlay
                            VStack {
                                HStack(alignment: .center, spacing: 15) {
                                    Image(effectiveDarkMode ? "Darkmode" : "Lightmode")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 30)
                                        .foregroundColor(textColor)


                                    Spacer()
                                    
                                    Button(action: {
                                        print("Toggle tapped! Current isDarkMode: \(String(describing: isDarkMode)), System: \(systemColorScheme)")
                                        withAnimation {
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
                        // .transition(.opacity)
                        // .opacity(isLoading ? 0 : 1)
                    // }
                // }
                // .animation(.easeInOut(duration: 0.6), value: isLoading)
            }
            // .onAppear {
            //     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //         withAnimation {
            //             isLoading = false
            //         }
            //     }
            // }
            }
            .navigationDestination(isPresented: $showYourPlants) {
                YourPlants()
            }
        }
    }


#Preview {
    ContentView()
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
