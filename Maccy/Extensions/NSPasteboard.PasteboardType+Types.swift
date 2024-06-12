import AppKit
import Defaults

extension NSPasteboard.PasteboardType: Defaults.Serializable {
  static let jpeg = NSPasteboard.PasteboardType(rawValue: "public.jpeg")
  static let universalClipboard = NSPasteboard.PasteboardType(rawValue: "com.apple.is-remote-clipboard")

  // See http://nspasteboard.org for more details.
  static let autoGenerated = NSPasteboard.PasteboardType(rawValue: "org.nspasteboard.AutoGeneratedType")
  static let concealed = NSPasteboard.PasteboardType(rawValue: "org.nspasteboard.ConcealedType")
  static let transient = NSPasteboard.PasteboardType(rawValue: "org.nspasteboard.TransientType")

  // https://github.com/p0deje/Maccy/issues/429#issuecomment-1182575226
  static let modified = NSPasteboard.PasteboardType(rawValue: "x.nspasteboard.ModifiedType")

  // Marks that copy was made from Maccy.
  static let fromMaccy = NSPasteboard.PasteboardType(rawValue: "org.p0deje.Maccy")

  // Types that indicate Microsoft Word bookmarks (links).
  static let microsoftObjectLink = NSPasteboard.PasteboardType(rawValue: "com.microsoft.ObjectLink")
  static let microsoftLinkSource = NSPasteboard.PasteboardType(rawValue: "com.microsoft.Link-Source")
}
