//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Baptiste on 03/06/2021.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    
    // Binding
    @Binding var isShowing: Bool
    
    //Environment
    @Environment(\.managedObjectContext) private var viewContext
    
    // State
    @State private var task: String = ""
    
    // Constant
    private var isButtonDisable: Bool {
        task.isEmpty
    }
    
    // MARK: - FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisable)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisable ? Color.blue : Color.pink)
                .cornerRadius(10)
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
