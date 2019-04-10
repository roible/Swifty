//
//  CellRegisterable.swift
//  Swifty
//
//  Created by roy on 2019/3/26.
//

#if os(iOS)
import UIKit
#endif

public protocol CellRegisterable: class, Identifierible {}

public protocol NibCellRegisterable: CellRegisterable {}

#if os(iOS)
extension NibCellRegisterable {
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension UITableView: SwiftyCompatible {}
extension UICollectionView: SwiftyCompatible {}

extension SwiftyWrapper where Base: UITableView {
    @discardableResult
    public func register<Cell>(cellClass: Cell.Type) -> Base where Cell: CellRegisterable {
        base.register(Cell.self, forCellReuseIdentifier: cellClass.identifier)
        return base
    }
    
    @discardableResult
    public func register<Cell>(nibCellClass: Cell.Type) -> Base where Cell: NibCellRegisterable {
        base.register(nibCellClass.nib, forCellReuseIdentifier: nibCellClass.identifier)
        return base
    }
    
    public func dequeueReusableCell<Cell>(of cellType: Cell.Type,
                                          for indexPath: IndexPath) -> Cell where Cell: CellRegisterable {
        return base.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! Cell
    }
    
    public func dequeueReusableCell<Cell>(of cellType: Cell.Type) -> Cell? where Cell: CellRegisterable {
        return base.dequeueReusableCell(withIdentifier: Cell.identifier) as? Cell
    }
}

extension SwiftyWrapper where Base: UICollectionView {
    @discardableResult
    public func register<Cell>(cellClass: Cell.Type) -> Base where Cell: CellRegisterable {
        base.register(Cell.self, forCellWithReuseIdentifier: cellClass.identifier)
        return base
    }
    
    @discardableResult
    public func register<Cell>(nibCellClass: Cell.Type) -> Base where Cell: NibCellRegisterable {
        base.register(nibCellClass.nib, forCellWithReuseIdentifier: nibCellClass.identifier)
        return base
    }
    
    public func dequeueReusableCell<Cell>(of cellType: Cell.Type,
                                          for indexPath: IndexPath) -> Cell where Cell: CellRegisterable {
        return base.dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as! Cell
    }
}
#endif
