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
    @State private var hexColor: String = "#0A1D12"
    @State private var isLoading: Bool = true
    @State private var showYourPlants = false

    var body: some View {
        NavigationStack {
            ZStack {
                (Color(hex: hexColor) ?? Color.green)
                    .ignoresSafeArea()
                Group {
                    if isLoading {
                        VStack {
                            Spacer()
                            Image("LoadingImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 700, height: 800)
                        }
                        .transition(.opacity)
                        .opacity(isLoading ? 1 : 0)
                    } else {
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
                                        Text("Welcome Back")
                                            .foregroundColor(.white)
                                            .font(.dmMonoRegular(size: 15))
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 24)


                                    ZStack {
                                        Image("Background12")
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
                                    Spacer().frame(height: 24)

                                    VStack {
                                        HStack(alignment: .top, spacing: 10) {
                                            Image("Plant10")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 25)
                                                .padding(.top, 5)
                                                
                                            
                                            Text("Scan plants")
                                                .font(.dmSansExtraBold(size: 18))
                                                .foregroundColor(.white)
                                                .padding(.top, 8)
                                            
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 30)


                                        Text("Scan or upload plants from your camera roll for plant detetection, health infomation and plant care.")
                                            .font(.dmMonoRegular(size: 15))
                                            .padding(.top, -6)
                                            .foregroundColor(.white)
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
                                                .foregroundColor(.white)

                                            Text("Plant Collection")
                                                .font(.dmSansExtraBold(size: 18))
                                                .foregroundColor(.white)
                                                .padding(.top, 3)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 17)
                                        Text("Build and expand your plant collection in your plant garden. ")
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
                                                .font(.dmSansRegular(size: 25))
                                                .foregroundColor(.white)
                                                .padding(.top, 3)

                                            Text("Plant Of the Day")
                                                .font(.dmSansExtraBold(size: 18))
                                                .foregroundColor(.white)
                                                .padding(.top, 8)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 20)
                                        Text("Pinus balfouriana, the foxtail pine, is a rare high-elevation pine that is endemic to California, United States. ")
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
                                            showYourPlants = true
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.white.opacity(0.2))
                                                    .frame(width: 40, height: 40)
                                                Image(systemName: "chevron.left")
                                                    .font(.system(size: 14, weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 8)
                                        }

                                        Button(action: {
                                            // Button 2 action
                                        }) {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 16)
                                                    .fill(Color.white.opacity(0.7))
                                                    .frame(width: 90, height: 35)
                                                
                                                Text("+")
                                                    .font(.dmMonoRegular(size: 24))
                                                    .foregroundColor(.black)
                                                    
                                            }
                                        }
                                        .frame(maxWidth: .infinity)

                                        Button(action: {
                                            // Button 3 action
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.white.opacity(0.1))
                                                    .frame(width: 40, height: 40)
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 14, weight: .semibold))
                                                    .foregroundColor(.white)
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
                                .background(Color(hex: hexColor) ?? Color.green)
                                .cornerRadius(50, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                                .edgesIgnoringSafeArea(.bottom)
                                .padding(.top, -70)
                                .padding(.top, 24)
                            }
                        }
                        .transition(.opacity)
                        .opacity(isLoading ? 0 : 1)
                    }
                }
                .animation(.easeInOut(duration: 0.6), value: isLoading)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
            .navigationDestination(isPresented: $showYourPlants) {
                YourPlants()
            }
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
