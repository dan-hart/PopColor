//
//
//  ContentView
//  PopColor
//
//  Created by Dan Hart on 3/24/20.
//


import SwiftUI

struct CustomColor: Hashable {
    var name: String
    var value: UIColor
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State var barColor = UIColor.blue
    @State var titleColor = UIColor.yellow
    
    @State var barCustomColor = CustomColor(name: "", value: UIColor.blue)
    @State var titleCustomColor = CustomColor(name: "", value: UIColor.yellow)
    
    @State var isAdjustingSeccondaryColor: Bool = false
    
    static func getColors() -> [CustomColor] {
        var values = [CustomColor]()
        do {
            for item in try FlatUIColors.sharedCodes.allProperties() {
                values.append(CustomColor(name: item.key , value: FlatUIColors.colorFromHexCode(item.value as! String)))
            }
        } catch {
            fatalError(error.localizedDescription)
        }
        return values
    }
    
    var colors: [CustomColor]?
    
    var body: some View {
        NavigationView {
            List {
                ZStack {
                    Rectangle()
                        .fill(Color(self.colorScheme == .light ? self.barColor : self.titleColor))
                        .frame(width: 500, height: 300, alignment: .center)
                        .padding()
                    Text("Test")
                        .foregroundColor(Color(self.colorScheme == .light ? self.titleColor : self.barColor))
                        .font(.system(size: 200))
                }
                
                Text("Main Color: " + barCustomColor.name)
                Text("Seccondary Color: " + titleCustomColor.name)
                
                Toggle(isOn: $isAdjustingSeccondaryColor) {
                    Text("Adjust Seccondary Color")
                }.padding()
                
                ForEach(colors!, id: \.name) { color in
                    Button(action: {
                        if self.isAdjustingSeccondaryColor {
                            self.titleColor = color.value
                            self.titleCustomColor = CustomColor(name: color.name, value: color.value)
                        } else {
                            self.barColor = color.value
                            self.barCustomColor = CustomColor(name: color.name, value: color.value)
                        }
                    }) {
                        HStack {
                            Rectangle()
                                .fill(Color(color.value))
                                .frame(width: 100, height: 20, alignment: .leading)
                            Text(color.name)
                        }
                    }
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color(self.colorScheme == .light ? self.barColor : self.titleColor))
                        .frame(width: 500, height: 300, alignment: .center)
                        .padding()
                    Text("Test")
                        .foregroundColor(Color(self.colorScheme == .light ? self.titleColor : self.barColor))
                        .font(.system(size: 200))
                }
                
                Text("Bar Color: " + barCustomColor.name)
                Text("Title Color: " + titleCustomColor.name)
            }
            .navigationBarTitle("PopColor", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = self.colorScheme == .light ? self.barColor : self.titleColor
                nc.navigationBar.backgroundColor = self.colorScheme == .light ? self.barColor : self.titleColor
                nc.navigationBar.largeTitleTextAttributes = [.foregroundColor: self.colorScheme == .light ? self.titleColor : self.barColor]
                nc.navigationBar.titleTextAttributes = [.foregroundColor: self.colorScheme == .light ? self.titleColor : self.barColor]
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(colors: ContentView.getColors())
    }
}
