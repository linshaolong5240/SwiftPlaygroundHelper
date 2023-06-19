import Cocoa

extension Date {
    func format(_ format: String, localized: Bool = true) -> String {
        let formatter = DateFormatter()
        if localized {
            formatter.locale = .current
            formatter.setLocalizedDateFormatFromTemplate(format)
        }else {
            formatter.dateFormat = format
        }
        return formatter.string(from: self)
    }
}
print(Locale.current)
print(Locale.preferredLanguages)
print(Locale.isoLanguageCodes)
print(Locale.isoRegionCodes)

let date = Date()

date.format("dd MMMM", localized: false)
