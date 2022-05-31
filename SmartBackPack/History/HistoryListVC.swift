//
//  HistoryListVC.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 31/3/2022.



import SwiftUI

struct HistoryListVC: View {
    
    
    var days = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    
    @StateObject var vm = HistoryListVM()
    
    var body: some View {
        
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            Spacer()
                            
                            if vm.mondayHistory.count > 0{
                                List {
                                    Section(header: Text("Monday")) {
                                        ForEach(vm.mondayHistory,id:\.name){subjectItem in
                                            
                                            CustomBookList(textString: subjectItem.name)
                                        }
                                        
                                    }
                                }
                            }else{
                                Image("nodata")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(10)
                                
                                Text("No Data Found !!! ")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                            }
                            
                            //                            List {
                            //                                Section(header: Text("Tuesday")) {
                            //                                    ForEach(vm.tuesdayHistory,id:\.name){subjectItem in
                            //
                            //                                        CustomBookList(textString: subjectItem.name)
                            //                                    }
                            //
                            //                                }
                            //
                            //                            }
                            //
                            //                            List {
                            //                                Section(header: Text("Wednesday")) {
                            //                                    ForEach(vm.wednesdayHistory,id:\.name){subjectItem in
                            //
                            //                                        CustomBookList(textString: subjectItem.name)
                            //                                    }
                            //
                            //                                }
                            //
                            //                            }
                            //                            List {
                            //                                Section(header: Text("Thursday")) {
                            //                                    ForEach(vm.thursdayHistory,id:\.name){subjectItem in
                            //
                            //                                        CustomBookList(textString: subjectItem.name)
                            //                                    }
                            //
                            //                                }
                            //
                            //                            }
                            //                            List {
                            //                                Section(header: Text("Friday")) {
                            //                                    ForEach(vm.fridayHistory,id:\.name){subjectItem in
                            //
                            //                                        CustomBookList(textString: subjectItem.name)
                            //                                    }
                            //
                            //                                }
                            //
                            //                            }
                            
                            Spacer()
                            
                        }
                        .padding(.top,40)
                        .frame(minHeight: geometry.size.height)
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
        .onAppear(perform: {
            
            
            vm.fetchHistory() { status in
                print(status)
            }
        })
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
          
        
    }
    
    
    
    
}

struct HistoryListVC_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListVC()
    }
}


