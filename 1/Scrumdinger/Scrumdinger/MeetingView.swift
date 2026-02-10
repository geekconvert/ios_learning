//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 01/02/26.
//

import SwiftUI

//When you select a SwiftUI file in the Project navigator, the canvas opens alongside the editor. The canvas shows you a preview of what the view looks like when it runs.
// https://developer.apple.com/sf-symbols/ SF Symbols 7 is a library of over 6,900 symbols designed to integrate seamlessly with San Francisco, the system font for Apple platforms.
// SF Symbols 7 introduces Draw animations and variable rendering, enhanced Magic Replace, gradients, and hundreds of new symbols.
struct MeetingView: View {
    var body: some View {
        //        VStack {
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundStyle(.tint)
        //            Text("Hello, world!")
        //        }
        //        .padding()
        VStack {
            ProgressView(value: 5, total: 15)
            HStack{
                //These alignments override the default behavior, which is center alignment.
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                //                These alignments override the default behavior, which is center alignment.
                //                To customize a SwiftUI view, you call methods known as modifiers. Each modifier returns a new view. You can use multiple modifiers on a single view.
                VStack(alignment:.trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore) //Ignore the inferred accessibility labels and values for the child views of the HStack in the header.
            .accessibilityLabel("Time Remaining") /*In this case, rather than force VoiceOver users to listen to the output of both labels, you can supplement the data with one label that surfaces the most important information.*/
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}){
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speker") /*By default, VoiceOver reads the system name for the image: forward.fill. When you add the accesibility label, VoiceOver reads the label text, followed by the inherent accessibility trait: “Next speaker. Button.”*/
            }
        }.padding()/*When you omit parameters to padding(_:), SwiftUI chooses default values that are appropriate for the platform and the presentation context.*/
    }
}

//SwiftUI has built-in accessibility, so you get accessibility support with little additional work. For example, string content in text views is automatically accessible to device features such as VoiceOver.

#Preview {
    MeetingView()
}
