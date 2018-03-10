class DeclarationsParser: Parser<[Element]> {

    override func parse() -> [Element] {
        var elements = [Element]()
        while let element = parseDeclaration() {
            elements.append(element)
        }
        return elements
    }

    private func parseDeclaration() -> Element? {
        if isEndOfParsing() {
            return nil
        } else if isNextDeclaration(.protocol) {
            return parseProtocol()
        } else if isNextDeclaration(.func) {
            return parseFunctionDeclaration()
        } else {
            advance()
            return parseDeclaration()
        }
    }

    private func isEndOfParsing() -> Bool {
        return isEndOfParentDeclaration() || isEndOfFile()
    }

    private func isEndOfParentDeclaration() -> Bool {
        return isNext(.rightBrace)
    }

    private func isEndOfFile() -> Bool {
        return isNext(.eof)
    }
}
