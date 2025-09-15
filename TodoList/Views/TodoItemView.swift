//
//  TodoItemView.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import SwiftUI

struct TodoItemView: View {
    @StateObject var viewModel = TodoItemViewViewModel()
    let item : TodoItem
    
    init(item: TodoItem) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
            .foregroundColor(.blue)
            
        }
    }
}

#Preview {
    TodoItemView(item: TodoItem(id: "dkkd", title: "djkflad", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
