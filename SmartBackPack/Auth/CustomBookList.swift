//
//  CustomBookList.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 31/5/2022.
//

import SwiftUI

struct CustomBookList: View {
    
    var textString:String?
    
    var body: some View {
        HStack() {
            
            
            Text(textString ?? "")
                .font(.system(size: 14, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding(.all,16)
            
            Spacer()
            
            
            
            
        }
        .cornerRadius(6)
    }
}

struct CustomBookList_Previews: PreviewProvider {
    static var previews: some View {
        CustomBookList(textString: "Test")
            .previewLayout(.sizeThatFits)
        
    }
}
