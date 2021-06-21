enum KeyboardEvent: Hashable {
    case none,
         key(KeySeat),
         space,
         backspace,
         newLine,
         shift,
         switchTo(KeyboardLayout),
         switchInputMethod,
         shadowKey(String),
         shadowBackspace
}

struct KeySeat: Hashable {
    
    let primary: KeyElement
    let children: [KeyElement]
    
    init(primary: KeyElement, children: [KeyElement] = []) {
        self.primary = primary
        self.children = children
    }
    
    var hasChildren: Bool { !children.isEmpty }
    
    static let cirillicÖ: KeySeat = {
        let cirillicÖ: KeyElement = KeyElement(text: "ӧ")
        let period: KeyElement = KeyElement(text: ".")
        let comma: KeyElement = KeyElement(text: ",")
        let questionMark: KeyElement = KeyElement(text: "?")
        let exclamationMark: KeyElement = KeyElement(text: "!")
        return KeySeat(primary: cirillicÖ, children: [period, comma, questionMark, exclamationMark])
    }()
    static let cirillicI: KeySeat = {
        let cirillicI: KeyElement = KeyElement(text: "і")
        let period: KeyElement = KeyElement(text: ".")
        let comma: KeyElement = KeyElement(text: ",")
        let questionMark: KeyElement = KeyElement(text: "?")
        let exclamationMark: KeyElement = KeyElement(text: "!")
        return KeySeat(primary: cirillicI, children: [period, comma, questionMark, exclamationMark])
    }()
    static let cirillicUppercasedÖ: KeySeat = {
        let cirillicUppercasedÖ: KeyElement = KeyElement(text: "Ӧ")
        let period: KeyElement = KeyElement(text: ".")
        let comma: KeyElement = KeyElement(text: ",")
        let questionMark: KeyElement = KeyElement(text: "?")
        let exclamationMark: KeyElement = KeyElement(text: "!")
        return KeySeat(primary: cirillicUppercasedÖ, children: [period, comma, questionMark, exclamationMark])
    }()
    static let cirillicUppercasedI: KeySeat = {
        let cirillicUppercaedI: KeyElement = KeyElement(text: "І")
        let period: KeyElement = KeyElement(text: ".")
        let comma: KeyElement = KeyElement(text: ",")
        let questionMark: KeyElement = KeyElement(text: "?")
        let exclamationMark: KeyElement = KeyElement(text: "!")
        return KeySeat(primary: cirillicUppercaedI, children: [period, comma, questionMark, exclamationMark])
    }()
    static let period: KeySeat = {
        let period: KeyElement = KeyElement(text: ".")
        let comma: KeyElement = KeyElement(text: ",")
        let questionMark: KeyElement = KeyElement(text: "?")
        let exclamationMark: KeyElement = KeyElement(text: "!")
        return KeySeat(primary: period, children: [period, comma, questionMark, exclamationMark])
    }()
    static let cantoneseComma: KeySeat = {
        let comma: KeyElement = KeyElement(text: ",")
        let period: KeyElement = KeyElement(text: ".")
        let questionMark: KeyElement = KeyElement(text: "?")
        let exclamationMark: KeyElement = KeyElement(text: "!")
        return KeySeat(primary: comma, children: [comma, period, questionMark, exclamationMark])
    }()
    static let separator: KeySeat = KeySeat(primary: KeyElement(text: "'", footer: "分隔"))
}

struct KeyElement: Hashable {
    
    let text: String
    let header: String?
    let footer: String?
    
    init(text: String, header: String? = nil, footer: String? = nil) {
        self.text = text
        self.header = header
        self.footer = footer
    }
    
    static func == (lhs: KeyElement, rhs: KeyElement) -> Bool {
        return lhs.text == rhs.text &&
            lhs.header == rhs.header &&
            lhs.footer == rhs.footer
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(header)
        hasher.combine(footer)
    }
}
