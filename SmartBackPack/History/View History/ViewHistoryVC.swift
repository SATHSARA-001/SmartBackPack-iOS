//
//  ViewHistoryVC.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 31/3/2022.
//

import SwiftUI

struct ViewHistoryVC: View {
    
    @State var history:History?
    
    var body: some View {
        
        ZStack {
            //colorBackground
            VStack {
                CustomHeader()
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .leading, spacing: 30) {
                            
                            HStack{
                                
                                VStack(alignment:.leading,spacing:20){
                                    
                                    Text(history?.date ?? "date")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .foregroundColor(.black)
                                    
                                    Text("Available Books")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .foregroundColor(.black)
                                    
                                    Text("Missing Books")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                            }
                            .padding()
                            Spacer()
                            
                        }
                        .padding()
                        .frame(minHeight: geometry.size.height)
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct ViewHistoryVC_Previews: PreviewProvider {
    static var previews: some View {
        ViewHistoryVC()
    }
}
