//
//  CustomTextField.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-15.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeHolder:String
    var labelTxt:String?
    @Binding var valueText:String
    
    var body: some View {
        
        VStack{
            HStack{
                Text(labelTxt ?? "" )
                Spacer()
            }
            TextField(placeHolder, text: $valueText)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(colorBackground, style: StrokeStyle(lineWidth: 1.0)))

        }
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolder: "Test", labelTxt: "test", valueText: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
