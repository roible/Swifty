//
//  CellRegisterable.swift
//  Swifty
//
//  Created by roy on 2019/3/26.
//

#if os(iOS)
import UIKit
#endif

public protocol CellRegisterable: class, Identifierible {
    
}

public protocol NibCellRegisterable: CellRegisterable {
    
}

#if os(iOS)
extension NibCellRegisterable {
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension SwiftyWrapper where Base: UITableView {
    @discardableResult
    public func register<Cell: CellRegisterable>(cellClass: Cell.Type) -> Base {
        base.register(Cell.self, forCellReuseIdentifier: cellClass.identifier)
        return base
    }
    
    @discardableResult
    public func register<Cell: NibCellRegisterable>(nibCellClass: Cell.Type) -> Base {
        base.register(nibCellClass.nib, forCellReuseIdentifier: nibCellClass.identifier)
        return base
    }
}

extension SwiftyWrapper where Base: UICollectionView {
    @discardableResult
    public func register<Cell: CellRegisterable>(cellClass: Cell.Type) -> Base {
        base.register(Cell.self, forCellWithReuseIdentifier: cellClass.identifier)
        return base
    }
    
    @discardableResult
    public func register<Cell: NibCellRegisterable>(nibCellClass: Cell.Type) -> Base {
        base.register(nibCellClass.nib, forCellWithReuseIdentifier: nibCellClass.identifier)
        return base
    }
}
#endif
