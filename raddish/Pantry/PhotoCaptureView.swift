//
//  PhotoCaptureView.swift
//  raddish
//
//  Created by Ankita Kundu on 12/6/21.
//

import SwiftUI

struct PhotoCaptureView: View {
    @Binding var showImagePicker: Bool
    @Binding var image: UIImage?
    
      var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
      }
}
