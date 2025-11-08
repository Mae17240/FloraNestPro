import SwiftUI

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
    static func dmMonoRegular(size: CGFloat) -> Font {
        .custom("DM Mono", size: size)
    }
    static func dmMonoLight(size: CGFloat) -> Font {
        .custom("DM Mono Light", size: size)
    }
}

struct ContentView: View {
    @State private var hexColor: String = "#0A1D12"
    var body: some View {
        ZStack {
            (Color(hex: hexColor) ?? Color.green)
                .ignoresSafeArea()
            ZStack() {
                VStack(spacing: 0) {

                    VStack(spacing: 0) {
  
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
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 24)
                        
   
                        ZStack {
                            Image("AboutBackground")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                                .clipped()
                                .cornerRadius(50, corners: [.topLeft, .topRight])
                                .opacity(0.8)
                            

                            Image("LearnAboutFloraNest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 11)
                                .padding(.bottom, 70)
                                .opacity(0.8)
                            

                           
                        }
                    }
                    
                    // White box with sections
                    VStack(spacing: 10) {
                        Spacer().frame(height: 24)

                        VStack {
                            HStack(alignment: .center, spacing: 10) {
                                Image("leaficon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 28)
                                Text("Scan plants")
                                    .font(.dmSansRegular(size: 25))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            Text("Scan or upload plants from your camera roll for plant detetection, health infomation and plant care.")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.black)
                                .opacity(0.6)
                                .padding(.top, 8)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
 
                        
                        // Section 2
                        VStack {
                            HStack(alignment: .center, spacing: 10) {
                                Image("plant3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                Text("Plant Collection")
                                    .font(.dmSansRegular(size: 25))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            Text("Build and expand your plant collection in your plant garden. ")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.black)
                                .opacity(0.6)
                                .padding(.top, 8)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        

                        
                        // Section 3
                        VStack {
                            HStack(alignment: .center, spacing: 10) {
                                Image("Plant_Triangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 28)
                                Text("Plant Of the Day")
                                    .font(.dmSansRegular(size: 25))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            Text("Pinus balfouriana, the foxtail pine, is a rare high-elevation pine that is endemic to California, United States. ")
                                .font(.dmMonoRegular(size: 15))
                                .foregroundColor(.black)
                                .opacity(0.6)
                                .padding(.top, 8)
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
                                    Image(systemName: "house.fill")
                                        .font(.system(size: 24))
                                    Text("Home")
                                        .font(.dmSansRegular(size: 12))
                                }
                                .foregroundColor(Color(hex: hexColor) ?? Color.green)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Button 2 action
                            }) {
                                VStack {
                                    Image(systemName: "leaf.fill")
                                        .font(.system(size: 24))
                                    Text("Plants")
                                        .font(.dmSansRegular(size: 12))
                                }
                                .foregroundColor(Color(hex: hexColor) ?? Color.green)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Button 3 action
                            }) {
                                VStack {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 24))
                                    Text("Profile")
                                        .font(.dmSansRegular(size: 12))
                                }
                                .foregroundColor(Color(hex: hexColor) ?? Color.green)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(Color.white)
                    }
                    .background(Color.white)
                    .cornerRadius(50, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                    .edgesIgnoringSafeArea(.bottom)
                    .padding(.top, -70)
                    .padding(.top, 24)
                }
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
