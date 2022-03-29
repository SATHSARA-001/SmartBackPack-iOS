//
//  DaysVC.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI

struct DaysVC: View {
    
    @State var isBookindViewIsActive = false
    @StateObject var vm = DaysVM()
    
    
    var body: some View {
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            
                            
                            
                            NavigationLink(destination:
                                            AddTimeTableView(slotNo: vm.day)
                                           , isActive: $isBookindViewIsActive){
                                
                                VStack{
                                    
                                    ProductCard(imageString: "VIP", textString: "Monday")
                                        .onTapGesture {
                                            vm.day = "Monday"
                                            isBookindViewIsActive.toggle()
                                            print("profile")
                                        }
                                    ProductCard(imageString: "VIP", textString: "Tuesday")
                                        .onTapGesture {
                                            vm.day = "Tuesday"
                                            isBookindViewIsActive.toggle()
                                            print("profile")
                                        }
                                    ProductCard(imageString: "VIP", textString: "Wednesday")
                                        .onTapGesture {
                                            vm.day = "Wednesday"
                                            isBookindViewIsActive.toggle()
                                            print("profile")
                                        }
                                    
                                    ProductCard(imageString: "VIP", textString: "Thursday")
                                        .onTapGesture {
                                            vm.day = "Thursday"
                                            isBookindViewIsActive.toggle()
                                            print("profile")
                                        }
                                    
                                    ProductCard(imageString: "VIP", textString: "Friday")
                                        .onTapGesture {
                                            vm.day = "Friday"
                                            isBookindViewIsActive.toggle()
                                            print("profile")
                                        }
                                }
                                
                                Spacer()
                            }
                            
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
