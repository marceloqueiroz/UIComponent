//
//  SingleChildProvider.swift
//  CollectionKit2
//
//  Created by Honghao Zhang on 5/21/19.
//  Copyright © 2019 Luke Zhao. All rights reserved.
//

import Foundation
import CoreGraphics.CGGeometry

open class SingleChildProvider: Provider {
  open var child: Provider
  public init(child: Provider) {
    self.child = child
  }
  open func layout(size: CGSize) -> CGSize {
    return child.layout(size: size)
  }
  open func views(in frame: CGRect) -> [(ViewProvider, CGRect)] {
    return child.views(in: frame)
  }
}