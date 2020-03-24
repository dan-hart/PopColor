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
    @State var barColor = UIColor.blue
    @State var titleColor = UIColor.yellow
    
    @State var barCustomColor = CustomColor(name: "Bar Color", value: UIColor.blue)
    @State var titleCustomColor = CustomColor(name: "Title Color", value: UIColor.yellow)
    
    @State var isAdjustingText: Bool = false
    
    var colors = [
        CustomColor(name: "Creamy Peach", value: UIColor(red:0.95, green:0.65, blue:0.51, alpha:1.00)),
        CustomColor(name: "Rosy Highlight", value: UIColor(red:0.97, green:0.84, blue:0.58, alpha:1.00)),
        CustomColor(name: "Soft Blue", value: UIColor(red:0.47, green:0.55, blue:0.92, alpha:1.00)),
        CustomColor(name: "Brewed Mustard", value: UIColor(red:0.91, green:0.50, blue:0.40, alpha:1.00)),
        CustomColor(name: "Old Geranium", value: UIColor(red:0.81, green:0.42, blue:0.53, alpha:1.00)),
        CustomColor(name: "Sawtooth Aak", value: UIColor(red:0.95, green:0.56, blue:0.40, alpha:1.00)),
        CustomColor(name: "Summertime", value: UIColor(red:0.96, green:0.80, blue:0.47, alpha:1.00)),
        CustomColor(name: "Cornflower", value: UIColor(red:0.33, green:0.43, blue:0.90, alpha:1.00)),
        CustomColor(name: "Tigerlily", value: UIColor(red:0.88, green:0.37, blue:0.25, alpha:1.00)),
        CustomColor(name: "Deep Rose", value: UIColor(red:0.77, green:0.27, blue:0.41, alpha:1.00)),
        CustomColor(name: "Mountain Majesty", value: UIColor(red:0.47, green:0.44, blue:0.65, alpha:1.00)),
        CustomColor(name: "Rouge Pink", value: UIColor(red:0.97, green:0.65, blue:0.76, alpha:1.00)),
        CustomColor(name: "Squeaky", value: UIColor(red:0.39, green:0.80, blue:0.85, alpha:1.00)),
        CustomColor(name: "Apple Valley", value: UIColor(red:0.92, green:0.53, blue:0.52, alpha:1.00)),
        CustomColor(name: "Pencil Lead", value: UIColor(red:0.35, green:0.38, blue:0.46, alpha:1.00)),
        CustomColor(name: "Corallite", value: UIColor(red:0.34, green:0.29, blue:0.56, alpha:1.00)),
        CustomColor(name: "Famingo", value: UIColor(red:0.97, green:0.56, blue:0.70, alpha:1.00)),
        CustomColor(name: "Curacao", value: UIColor(red:0.24, green:0.76, blue:0.83, alpha:1.00)),
        CustomColor(name: "Porcelain", value: UIColor(red:0.90, green:0.40, blue:0.40, alpha:1.00)),
        CustomColor(name: "Biscay", value: UIColor(red:0.19, green:0.22, blue:0.32, alpha:1.00))
    ]
    
    var body: some View {
        NavigationView {
            List {
                ZStack {
                    Rectangle()
                        .fill(Color(self.barColor))
                        .frame(width: 500, height: 300, alignment: .center)
                    Text("Test")
                        .foregroundColor(Color(self.titleColor))
                        .font(.system(size: 200))
                }
                
                Text("Bar Color: " + barCustomColor.name)
                Text("Title Color: " + titleCustomColor.name)
                
                Toggle(isOn: $isAdjustingText) {
                    Text("Adjust Text")
                }.padding()
                
                ForEach(colors, id: \.self) { color in
                    Button(action: {
                        if self.isAdjustingText {
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
                        .fill(Color(self.barColor))
                        .frame(width: 500, height: 300, alignment: .center)
                    Text("Test")
                        .foregroundColor(Color(self.titleColor))
                        .font(.system(size: 200))
                }
                
                Text("Bar Color: " + barCustomColor.name)
                Text("Title Color: " + titleCustomColor.name)
            }
            .navigationBarTitle("PopColor", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = self.barColor
                nc.navigationBar.backgroundColor = self.barColor
                nc.navigationBar.largeTitleTextAttributes = [.foregroundColor: self.titleColor]
                nc.navigationBar.titleTextAttributes = [.foregroundColor: self.titleColor]
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
        ContentView()
    }
}
