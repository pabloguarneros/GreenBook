import SwiftUI

struct GreenbookCardView: View {
    
    @State private var isAnimating: Bool = false
    var imageString: String
    var topColor: String
    var bottomColor: String
    
    var titleText: String = ""
    var bodyText: String = ""

    var firstSlide: Bool = false
    var lastSlide: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 80) {
                if firstSlide{
                    WelcomeText()
                }else{
                    if titleText != ""{
                    HeadingText(titleText)
                    }}
                OnboardingImage(imageString)
                if bodyText != "" {
                    BodyText(bodyText)
                }
                if(lastSlide){
                    StartButtonView()
                }
            } //: VSTACK
            .onAppear{
                withAnimation(.easeOut(duration: 0.5)){
                    isAnimating = true
                }
            }
        } //: ZSTACK
        .frame(minWidth:0, maxWidth:.infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors:[Color(topColor),Color(bottomColor)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
    
}

struct WelcomeText: View {
    var body: some View {
        HStack {
            Text("Welcome to ")
                .foregroundColor(.white)
            + Text("Green")
                .foregroundColor(Color("forestGreen"))
            + Text("book")
                .foregroundColor(.white)
        }.font(Font.custom("Solway-Regular",size:40))
        .multilineTextAlignment(.center)
        .padding(.horizontal,20)
    }
}

struct HeadingText: View {
    var titleText: String
    var body: someView{
        Text(titleText)
            .foregroundColor(.white)
            .font(Font.custom("Solway-Regular",size:27))
            .multilineTextAlignment(.center)
            .padding(.horizontal,20)
    }
}

struct OnboardingImage: View {
    var imageString: String
    var body: some View{
        Image(imageString)
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red:1, green: 0, blue: 0, opacity: 0.15), radius: 8, x:6, y: 8)
            .scaleEffect(isAnimating ? 1.0 : 0.6)
            .padding(.horizontal, 30)
    }
}

struct BodyText: View{
    var bodText: String
    var body: some View{
        Text(bodyText)
            .font(Font.custom("Solway-Regular",size:20))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding(.horizontal,20)
            .frame(maxWidth: 480)
    }
}

struct GreenbookCardView_Previews: PreviewProvider {
    static var previews: some View {
        GreenbookCardView(imageString:"standHug",topColor:"turquoiseGreen",bottomColor: "mediumSea",bodyText:"Looking for a new sustainable hobby?")
            .previewLayout(.fixed(width: 320, height:640))
    }
}
