//
//  SwiftUIView.swift
//  raddish
//
//  Created by Ankita Kundu on 12/6/21.
//

import SwiftUI

struct ReceiptScanner: View {
    var body: some View {
        // 1
        let imagePickerActionSheet =
          UIAlertController(title: "Snap/Upload Image",
                            message: nil,
                            preferredStyle: .actionSheet)

        // 2
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
          let cameraButton = UIAlertAction(
            title: "Take Photo",
            style: .default) { (alert) -> Void in
              // TODO: Add more code here...
          }
          imagePickerActionSheet.addAction(cameraButton)
        }

        // 3
        let libraryButton = UIAlertAction(
          title: "Choose Existing",
          style: .default) { (alert) -> Void in
            // TODO: Add more code here...
        }
        imagePickerActionSheet.addAction(libraryButton)

        // 4
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        imagePickerActionSheet.addAction(cancelButton)

        // 5
        present(imagePickerActionSheet, animated: true)

    }
}
