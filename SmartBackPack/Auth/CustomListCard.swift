//
//  CustomListCard.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 30/3/2022.
//

import SwiftUI

struct CustomListCard: View {
    
    var imageString:String?
    var textString:String?
    
    
    var body: some View {
        
        HStack(alignment: .center,spacing: 10) {
            
            
            Text(textString ?? "")
                .font(.system(size: 14, weight: .bold, design: .default))
                .foregroundColor(.black)
            
            Image(imageString ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34)
                .padding(.all, 34)

            
        }
        .padding(.all,10)
        

    }
}

struct CustomListCard_Previews: PreviewProvider {
    static var previews: some View {
        CustomListCard(imageString: "VIP", textString: "Test")
            .previewLayout(.sizeThatFits)
    }
}
