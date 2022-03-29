//
//  DaysVC.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI

struct DaysVC: View {
    var body: some View {
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            
                            
                            ProductCard(imageString: "VIP", textString: "Monday")
                                .onTapGesture {
                                    print("profile")
                                }
                            ProductCard(imageString: "VIP", textString: "Tuesday")
                                .onTapGesture {
                                    print("profile")
                                }
                            ProductCard(imageString: "VIP", textString: "Wednesday")
                                .onTapGesture {
                                    print("profile")
                                }
                            
                            ProductCard(imageString: "VIP", textString: "Thursday")
                                .onTapGesture {
                                    print("profile")
                                }
                            
                            ProductCard(imageString: "VIP", textString: "Friday")
                                .onTapGesture {
                                    print("profile")
                                }
                            
                            
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

struct DaysVC_Previews: PreviewProvider {
    static var previews: some View {
        DaysVC()
    }
}
