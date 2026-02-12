//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 01/02/26.
//

import SwiftUI

//// The default SwiftUI view file declares a structure that conforms to the View protocol, which has a single requirement: a body property that returns a View. In the body property, you describe the content, layout, and behavior of the view. The file also defines a preview for that view to display on the canvas.

//// When you select a SwiftUI file in the Project navigator, the canvas opens alongside the editor. The canvas shows you a preview of what the view looks like when it runs.
////  https://developer.apple.com/sf-symbols/ SF Symbols 7 is a library of over 6,900 symbols designed to integrate seamlessly with San Francisco, the system font for Apple platforms.
//// SF Symbols 7 introduces Draw animations and variable rendering, enhanced Magic Replace, gradients, and hundreds of new symbols.
struct MeetingView: View {
    var body: some View {
        //        VStack {
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundStyle(.tint)
        //            Text("Hello, world!")
        //        }
        //        .padding()
        //// Stacks group views horizontally, vertically, or back to front. You use stacks to combine and layer view components.
        VStack {
            ProgressView(value: 5, total: 15)
            HStack{
                //// These alignments override the default behavior, which is center alignment.
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption) //// Add a .font(.caption) modifier to the text views to reduce the size of the text. To customize a SwiftUI view, you call methods known as modifiers. Each modifier returns a new view. You can use multiple modifiers on a single view.
                    Label("300", systemImage: "hourglass.tophalf.fill") //// The image uses one of the included SF Symbols. The system treats these symbols like fonts, so they scale dynamically with a user’s device settings.
                }
                //// Add a spacer between each VStack to use available space from the containing parent view
                Spacer()
                //// These alignments override the default behavior, which is center alignment.
                VStack(alignment:.trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore) //// Ignore the inferred accessibility labels and values for the child views of the HStack in the header.
            .accessibilityLabel("Time Remaining") //// In this case, rather than force VoiceOver users to listen to the output of both labels, you can supplement the data with one label that surfaces the most important information.
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}){
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speker") //// By default, VoiceOver reads the system name for the image: forward.fill. When you add the accesibility label, VoiceOver reads the label text, followed by the inherent accessibility trait: “Next speaker. Button.
            }
        }.padding()//// Add padding to the top-level VStack to bring the views in from the edges. When you omit parameters to padding(_:), SwiftUI chooses default values that are appropriate for the platform and the presentation context.
    }
}

//// SwiftUI has built-in accessibility, so you get accessibility support with little additional work. For example, string content in text views is automatically accessible to device features such as VoiceOver.

#Preview {
    MeetingView()
}
