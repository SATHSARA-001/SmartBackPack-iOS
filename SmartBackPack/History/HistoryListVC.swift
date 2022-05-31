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
        
        NavigationView{
            List{
                
                ForEach(vm.mondayHistory,id:\.name){subjectItem in
                    Text(subjectItem.name ?? "")
                }
                
                
            }
        }
        .onAppear(perform: {
        
            vm.fetchHistory()
        })
        
          
        
    }
    

    
    
}

struct HistoryListVC_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListVC()
    }
}



