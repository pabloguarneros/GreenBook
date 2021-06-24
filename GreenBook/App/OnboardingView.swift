import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        TabView{
            GreenbookCardView(imageString:"standHug",
                              topColor:"turquoiseGreen",
                              bottomColor:"mediumSea",
                              bodyText:"Looking for a new sustainable hobby?",
                              firstSlide:true)
            GreenbookCardView(imageString:"manRain"
                              ,topColor:"mediumSea"
                              ,bottomColor:"forestGreen",
                              titleText:"Tailored Behavioral Nudges",
                              bodyText:"We use behavior change strategies to help you be a more consistent caretaker for your plants.")
            GreenbookCardView(imageString:"sitHug",
                              topColor:"mediumSea",
                              bottomColor:"mediumSea",
                              titleText:"Community Driven Geolocation",
                              bodyText:"We use geolocation to personalize your feed and make relevant suggestions for upcoming events, non-profits, and store items.")
            GreenbookCardView(imageString:"standCut",
                              topColor:"turquoiseGreen",
                              bottomColor:"mediumSea",
                              bodyText:"Take care of your plants, while we take care of you.",
                              lastSlide:true)
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
