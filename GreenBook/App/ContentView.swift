import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUsername = "pabwarno"
let storedPassword = "guarneros"

struct ContentView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                LoginImage()
                LoginText()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                Spacer()
                if authenticationDidFail{
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail=false
                    } else{
                        self.authenticationDidFail = true
                    }
                    }) {
                       LoginButtonContent()
                }
                }
            if authenticationDidSucceed{
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            }
        }.padding()
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //ContentView()
            //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct LoginImage: View {
    var body: some View {
        Image("growth")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(10)
            .padding(.top, 50)

    }
}

struct LoginText: View {
    var body: some View {
        HStack {
            Text("Welcome to ")
                .foregroundColor(.black)
            + Text("Green")
                .foregroundColor(Color("forestGreen"))
            + Text("book")
                .foregroundColor(.black)
        }.font(Font.custom("Solway-Regular",size:50))
        .multilineTextAlignment(.center)
        .padding(.horizontal,20)
        .padding(.bottom, 75)

    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Sign up")
            .font(Font.custom("Solway-Regular",size:26))
            .foregroundColor(.white)
            .padding()
            .frame(width: 350, height: 80)
            .background(Color("mediumSea"))
            .cornerRadius(25)
    }
}

struct SignupButtonContent: View {
    var body: some View {
        Text("SIGN UP")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username",text:$username)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .frame(width: 300, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(12.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .frame(width: 300, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(12.0)
            .padding(.bottom, 20)
    }
}
