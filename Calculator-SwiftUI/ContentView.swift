//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Михаил Беленко on 20.04.2021.
//

import SwiftUI

enum Action {
    case plus, minus, multiply, division, sum
    
    func execute(_ left: Double, _ right: Double) -> Double {
        switch self {
        case .plus:
            return left + right
        case .minus:
            return left - right
        case .multiply:
            return left * right
        case .division:
            return left / right
        case .sum:
            return left
        }
    }
}

struct ContentView: View {
    @State private var text: String = "0"
    @State private var result: Double = 0
    @State private var currentAction: Action = .plus
    
    var body: some View {
        VStack {
            TextField("Введите число", text: $text)
                .onTapGesture {
                    text = ""
                }
                .multilineTextAlignment(.center)
                .background(Color.accentColor)
                .border(Color.black, width: 1)
                .cornerRadius(8)
                .keyboardType(.decimalPad)
            Divider()
            
            HStack {
                Button(action: {
                    if let value = Double(text) {
                        result = currentAction.execute(result, value)
                        text = ""
                        currentAction = .plus
                    }
                }, label: {
                    Text("+")
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.accentColor)
                .foregroundColor(.black)
                .font(.largeTitle)
                .cornerRadius(16)
                
                Button(action: {
                    if let value = Double(text) {
                        result = currentAction.execute(result, value)
                        text = ""
                        currentAction = .minus
                    }
                }, label: {
                    Text("-")
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.accentColor)
                .foregroundColor(.black)
                .font(.largeTitle)
                .cornerRadius(16)
                
                Button(action: {
                    if let value = Double(text) {
                        result = currentAction.execute(result, value)
                        text = ""
                        currentAction = .multiply
                    }
                }, label: {
                    Text("*")
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.accentColor)
                .foregroundColor(.black)
                .font(.largeTitle)
                .cornerRadius(16)
                
                Button(action: {
                    if let value = Double(text) {
                        result = currentAction.execute(result, value)
                        text = ""
                        currentAction = .division
                    }
                }, label: {
                    Text("/")
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.accentColor)
                .foregroundColor(.black)
                .font(.largeTitle)
                .cornerRadius(16)
            }
            
            Button(action: {
                if let value = Double(text) {
                    result = currentAction.execute(result, value)
                    text = result.description
                    currentAction = .sum
                }
            }, label: {
                Text("=")
            })
            .frame(width: 50, height: 50, alignment: .center)
            .background(Color.accentColor)
            .foregroundColor(.black)
            .font(.largeTitle)
            .cornerRadius(16)
            
        }
        .padding(.all, 16.0)
    }
    
    func numberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        
        return numberFormatter
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
