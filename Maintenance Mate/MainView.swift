//
//  ContentView.swift
//  Maintenance Mate
//
//  Created by Fernando Cardona on 3/10/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var username: String = "Enter Name" // Default username
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 49/255, green: 71/255, blue: 58/255), // #31473A
                Color(red: 237/255, green: 244/255, blue: 242/255) // #EDF4F2
            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)

            VStack {
                // Username + Profile Image (Top Left)
                HStack {
                    TextField("Enter your name", text: $username)
                        .textFieldStyle(PlainTextFieldStyle()) // Removes default borders
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(.leading)
                        .frame(width: 150) // Limits width so text doesn’t stretch
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1) // Optional: Adds a thin border
                        )

                    Spacer()

                    // Profile Image Button
                    Button(action: {
                        isImagePickerPresented.toggle()
                    }) {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .padding(.trailing)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                    }
                }
                .padding(.top)

                Spacer()

                // Welcome Message (Centered)
                Text("Welcome, \(username)")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(.bottom, 20) // Adds space above the car icon

                // Car Icon
                Image(systemName: "car")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

// Image Picker Helper for selecting profile image
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.editedImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    ContentView()
}







