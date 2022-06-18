//
//  CategoryList.swift
//  AFTutorial
//
//  Created by Çağatay Yıldız on 18.06.2022.
//

import SwiftUI
import Alamofire

struct CategoryList: View {
    
    @State var categories : [CategoryModel] = []
    var body: some View {
        VStack{
            
            Text("Categories Count: \(categories.count)")
            
            ForEach(categories, id: \.id) { item in
                
                NavigationLink( destination: CategoryDetail(id: item.id)){
                    Text(item.name)
                        .padding()
                }
                
                NavigationLink( destination: CategoryUpdate(id: item.id)){
                    Text("Update")
                        .padding()
                        
                }
                
                Button("Delete"){
                    
                    let request = AF.request("https://northwind.vercel.app/api/categories/\(item.id)", method: .delete)
                    
                    request.response{ res in
                        
                        if res.response?.statusCode == 200{
                            print("Success!!")
                            
                            
                            //AF default GET işlemi yapıyor
                            let request = AF.request("https://northwind.vercel.app/api/categories")
                            
                            
                            //            request.responseJSON{ (data) in
                            //                print(data)
                            //            }
                            
                            request.responseDecodable(of: [CategoryModel].self){response in
                                
                                categories = response.value ?? []
                                
                            }
                            
                            
                        }
                       
                    }
                    
                }
                .foregroundColor(Color.red)
                
                
            }
        }
        .onAppear(){
            
            //AF default GET işlemi yapıyor
            let request = AF.request("https://northwind.vercel.app/api/categories")
            
            
            //            request.responseJSON{ (data) in
            //                print(data)
            //            }
            
            request.responseDecodable(of: [CategoryModel].self){response in
                
                categories = response.value ?? []
                
            }
            
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
