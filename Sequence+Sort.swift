//

import Foundation

public enum SortingOrder {
    case ascending
    case descending
}

public extension Sequence {

    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, order: SortingOrder = .ascending) -> [Element] {
        return sorted { a, b in
            switch order {
            case .ascending:
                return  a[keyPath: keyPath] < b[keyPath: keyPath]
            case .descending:
                return a[keyPath: keyPath] > b[keyPath: keyPath]
            }
        }
    }

    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T?>, order: SortingOrder = .ascending, nilFirst: Bool = true) -> [Element] {
        return self.sorted(by: [keyPath], order: order, nilFirst: nilFirst)
    }

    func sorted<T: Comparable>(by keyPaths: [KeyPath<Element, T?>], order: SortingOrder = .ascending, nilFirst: Bool = true) -> [Element] {
        return sorted { self.compare(left: $0, right: $1, keyPaths: keyPaths, order: order, nilFirst: nilFirst) }
    }

    private func compare<T: Comparable>(left: Element, right: Element, keyPaths: [KeyPath<Element, T?>], order: SortingOrder, nilFirst: Bool) -> Bool {
        guard let currentKeyPath = keyPaths.first else {
            return true
        }

        guard let unwrapedAValue = left[keyPath: currentKeyPath] else {
            return true && nilFirst
        }

        guard let unwrapedBValue = right[keyPath: currentKeyPath] else {
            return !(false ^ nilFirst)
        }

        guard unwrapedAValue != unwrapedBValue else {
            return self.compare(left: left, right: right, keyPaths: Array(keyPaths.dropFirst()), order: order, nilFirst: nilFirst)
        }

        switch order {
        case .ascending:
            return  unwrapedAValue < unwrapedBValue
        case .descending:
            return unwrapedAValue > unwrapedBValue
        }
    }
}

extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
