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

struct ContentView: View {
    @State private var hexColor: String = "#0A1D12"
    
    var body: some View {
        ZStack {
            (Color(hex: hexColor) ?? Color.green)
                .ignoresSafeArea()
            ZStack() {
                // Logo image above the header
                VStack(spacing: 0) {
                    // HStack for logo and header text in line
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
                    
                    // Image above the white box with overlay content
                    ZStack {
                        Image("AboutBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .clipped()
                            .cornerRadius(50, corners: [.topLeft, .topRight])
                        
                        // LearnAboutFloraNest centered
                        Image("LearnAboutFloraNest")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 11)
                            .padding(.bottom, 70)
                        
                        // LearnLogo on the left
                        HStack {
                            Image("LearnLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .padding(.bottom, 70)
                                .padding(.horizontal, 95)
                            
                            Spacer()
                        }
                    }
                    
                    Color.white
                        .cornerRadius(50, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                        .edgesIgnoringSafeArea(.bottom)
                        .padding(.top, -70)
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

