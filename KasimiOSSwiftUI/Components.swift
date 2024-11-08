//
//  Components.swift
//  KasimiOSSwiftUI
//
//  Created by Sefa Aycicek on 8.11.2024.
//

import SwiftUI

struct Components: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.caption)
            .foregroundColor(Color.blue)
            .padding()
            .frame(width: 100, height: 100, alignment: .center)
            .background {
                Circle().fill(Color.red)
            }
            .frame(width: 120, height: 120)
            .background {
                Circle().fill(Color.yellow)
            }
            .frame(width: 140, height: 140)
            .background {
                Circle().fill(Color.green)
                    .shadow(color: .black, radius: 40, x: 10, y : 10)
            }
    }
}

struct SpacerRectangle : View {
    var body: some View {
        HStack {
            Rectangle()
                //.fill(Color.red)
                .fill(RadialGradient(gradient: Gradient(colors: [.red, .blue]),
                                     center: .center,
                                     startRadius: 0,
                                     endRadius: 100))
                .frame(width: 200, height: 200)
            
            
        }.background(.yellow)
    }
}

struct ImageView : View {
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .frame(width: 140, height: 140)
            .background {
                Circle().fill(Color.red)
            }
    }
}

struct ImageView2 : View {
    var body: some View {
        Image("getir")
            .resizable(resizingMode: .stretch)
            .scaledToFit()
            .frame(width: 200, height: 200)
            //.clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 2)
            }.shadow(color: .black, radius: 6)
    }
}

struct ButtonAndTextField : View {
    
    @State var text : String = ""
    @State var isAlertShown : Bool = false
    @State var isActionShown : Bool = false
    @State var sliderValue : Double = 3
    
    var body: some View {
        VStack {
            if text.isEmpty {
               SpacerRectangle()
            }
                                            
            Slider(value: $sliderValue,
                   in: 0...100,
                   step: 2.0,
                   onEditingChanged: { item in
                
                    },
                   minimumValueLabel: Text("0dan başla"),
                   maximumValueLabel: Text("0dan başla")) {
                        
                }
            
            Text("Deneme \(sliderValue)")
                .alert("Tıkla", isPresented: $isAlertShown) {
                    
                }
            
            TextEditor(text:$text)
                .frame(height: 200)
                //.foregroundColor(Color.red)
                .frame(maxHeight: .infinity)
                .colorMultiply(.gray)
                .cornerRadius(20)
            
            TextField("Enter  your name", text : $text)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                //.background(Color.red)
                .border(.quinary)
            
            
            Button {
                text = "Selam"
            } label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    /*.background {
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    }*/
                //SpacerRectangle()
            }
            
            Button("Click me") {
                isAlertShown.toggle()
            }.alert("Tıkla", isPresented: $isAlertShown) {
                
            }

            Button("Action") {
                isActionShown.toggle()
            }.actionSheet(isPresented: $isActionShown, content: {
                getActionSheet {
                    
                }
            })
           
        }.padding()
    }
}

func getActionSheet(callback : @escaping ()->()) -> ActionSheet {
    
    let button1 : ActionSheet.Button = .default(Text("Seçenek 1")) {
        callback()
    }
    
    let button2 : ActionSheet.Button = .default(Text("Seçenek 2"))
    
    return ActionSheet(title: Text("Action Sheet"),
                       message: nil,
                       buttons: [button1, button2])
}

struct PickerView : View {
    @State var selection : String = "All"
    @State var toggleIsOn : Bool = false
    
    let filterOptions : [String] = ["All", "Active", "Completed"]
    var body: some View {
        VStack {
            Picker(selection: $selection,
                   content:{
                    ForEach(filterOptions, id: \.self) { option in
                        Text(option)
                }
            }, label: {
                Text("Filter")
            }).pickerStyle(.menu)
            
            Text(toggleIsOn ? "Online" : "Offline")
            
            Toggle(isOn: $toggleIsOn) {
                Text("Change Status")
            }.padding()
        }
    
    }
}

struct PickerView2 : View {
   
    var body: some View {
        Text("")
    }
}


struct PickerView4 : View {
   
    var body: some View {
        Text("")
    }
}

#Preview {
    ButtonAndTextField()
}
