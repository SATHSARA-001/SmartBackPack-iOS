//
//  ViewBooksVC.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 30/3/2022.
//

import SwiftUI

struct ViewBooksVC: View {
    @StateObject var vm = ViewBooksVM()

    var body: some View {
        
        ZStack {
            //colorBackground
            VStack {
                CustomHeader()
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 60) {
                            
                            
                        }
                        .frame(minHeight: geometry.size.height)
                        .padding(.all,20)
                    }
                    .frame(width: geometry.size.width)
                }
            }//VStack
            
            .onAppear(perform: {
                vm.fetchOrders()
            })
            
        }//Zstack
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct ViewBooksVC_Previews: PreviewProvider {
    static var previews: some View {
        ViewBooksVC()
    }
}
