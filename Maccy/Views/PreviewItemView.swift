import KeyboardShortcuts
import SwiftUI

struct PreviewItemView: View {
  var item: HistoryItemDecorator

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      if let image = item.previewImage {
        Image(nsImage: image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .clipShape(.rect(cornerRadius: 5))
      } else {
        ScrollView {
          WrappingTextView {
            Text(item.text)
              .font(.body)
          }
        }
      }

      Divider()
        .padding(.vertical)

      // --- Source URL Display ---
      if let url = item.sourceURL, !url.isEmpty {
          HStack {
              Text("SourceURL:", tableName: "PreviewItemView") // Added label
              Spacer()
          }
          // Inlined SourceURLView logic:
          HStack {
              Image(systemName: "link")
                  .font(.caption)
              
              Text(url)
                  .font(.caption)
                  .lineLimit(1)
                  .truncationMode(.middle)
          }
          .foregroundColor(.secondary)
          .padding(.horizontal, 4) // Padding from original SourceURLView
          .onTapGesture {
              guard let nsUrl = URL(string: url) else { return }
              NSWorkspace.shared.open(nsUrl)
          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0)) // Corrected padding syntax using EdgeInsets
      }
      // --- End Source URL Display ---

      if let application = item.application {
        HStack(spacing: 3) {
          Text("Application", tableName: "PreviewItemView")
          Image(nsImage: item.applicationImage.nsImage)
            .resizable()
            .frame(width: 11, height: 11)
          Text(application)
        }
      }

      HStack(spacing: 3) {
        Text("FirstCopyTime", tableName: "PreviewItemView")
        Text(item.item.firstCopiedAt, style: .date)
        Text(item.item.firstCopiedAt, style: .time)
      }

      HStack(spacing: 3) {
        Text("LastCopyTime", tableName: "PreviewItemView")
        Text(item.item.lastCopiedAt, style: .date)
        Text(item.item.lastCopiedAt, style: .time)
      }

      HStack(spacing: 3) {
        Text("NumberOfCopies", tableName: "PreviewItemView")
        Text(String(item.item.numberOfCopies))
      }
      .padding(.bottom)

      if let pinKey = KeyboardShortcuts.Shortcut(name: .pin) {
        Text(
          NSLocalizedString("PinKey", tableName: "PreviewItemView", comment: "")
            .replacingOccurrences(of: "{pinKey}", with: pinKey.description)
        )
      }

      if let deleteKey = KeyboardShortcuts.Shortcut(name: .delete) {
        Text(
          NSLocalizedString("DeleteKey", tableName: "PreviewItemView", comment: "")
            .replacingOccurrences(of: "{deleteKey}", with: deleteKey.description)
        )
      }
    }
    .controlSize(.small)
    .padding()
  }
}
