import Foundation

/// Represents an adapter that holds data to be rendered.
public protocol Adapter: AnyObject {
    /// The data to be rendered.
    var data: [Section] { get set }
}

public extension Adapter {

    /// Returns a Boolean value indicating whether the adapter contains a node in the given index path.
    ///
    /// - Parameter:
    ///   - indexPath: The index path to check for containment
    ///
    /// - Returns: A Boolean value indicating whether the adapter contains a node in the given index path.
    func contains(nodeAt indexPath: IndexPath) -> Bool {
        let section: Int = indexPath.section
        let row: Int = indexPath.row
        guard data.indices.contains(section) else { return false }
        guard data[section].cells.indices.contains(row) else { return false }
        return true
    }

    /// Returns a collection of cell nodes in the specified section.
    ///
    /// - Parameter:
    ///   - section: The index of section containing the collection of
    ///              cell nodes to retrieve.
    ///
    /// - Returns: A collection of cell nodes in the specified section.
    func cellNodes(in section: Int) -> [CellNode] {
        return data[section].cells
    }

    /// Returns a node of cell at the specified index path.
    ///
    /// - Parameter:
    ///   - indexPath: The index path at the cell node to retrieve.
    ///
    /// - Returns: A node of cell at the specified index path.
    func cellNode(at indexPath: IndexPath) -> CellNode {
        return cellNodes(in: indexPath.section)[indexPath.row]
    }

    /// Returns a node of header in the specified section.
    ///
    /// - Parameter:
    ///   - section: The index of section containing the header node
    ///              to retrive.
    ///
    /// - Returns: A node of header in the specified section.
    func headerNode(in section: Int) -> ViewNode? {
        return data[section].header
    }

    /// Returns a node of footer in the specified section.
    ///
    /// - Parameter:
    ///   - section: The index of section containing the footer node
    ///              to retrive.
    ///
    /// - Returns: A node of footer in the specified section.
    func footerNode(in section: Int) -> ViewNode? {
        return data[section].footer
    }
}
