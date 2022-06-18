//
//  AddCategory.swift
//  AFTutorial
//
//  Created by Çağatay Yıldız on 18.06.2022.
//

import SwiftUI
import Alamofire

struct AddCategory: View {
    
    @State var category : CategoryModel = CategoryModel()
    
    
    var body: some View {
        
        VStack{
            
            TextField("Name",
                      text: $category.name
                      
            )
            
            TextField("Description",
                      text: $category.description
            )
            
            Button("Add"){
                
                let newCategory: [String: Any] = [
                    
                    "name" : category.name,
                    "description" : category.description
                
                ]
                
                let request = AF.request("https://northwind.vercel.app/api/categories", method: .post, parameters: newCategory, encoding: JSONEncoding.default)
                
                request.response{ res in
                    
                    print(res)
                    
                }
            }
            
        }
     
        
    }
}

struct AddCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategory()
    }
}
