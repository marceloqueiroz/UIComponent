//
//  File.swift
//  
//
//  Created by Luke Zhao on 8/22/20.
//

import Foundation

public struct ViewModifierComponent<View, Value, Content: ViewComponent>: ViewComponent where Content.E.R.View == View {
  public typealias E = ViewModifierElement<View, Value, Content.E>
  let content: Content
  let keyPath: ReferenceWritableKeyPath<View, Value>
  let value: Value
  
  public func build() -> E {
    content.build().with(keyPath, value)
  }
}

public struct ViewIDModifierComponent<View, Content: ViewComponent>: ViewComponent where Content.E.R.View == View {
  
  public typealias E = ViewIDModifierElement<View, Content.E>
  let content: Content
  let id: String
  
  public func build() -> E {
    content.build().id(id)
  }
}

extension ViewComponent {
  public func with<Value>(_ keyPath: ReferenceWritableKeyPath<E.R.View, Value>, _ value: Value) -> ViewModifierComponent<E.R.View, Value, Self> {
    return ViewModifierComponent(content: self, keyPath: keyPath, value: value)
  }
  public func id(_ id: String) -> ViewIDModifierComponent<E.R.View, Self> {
    return ViewIDModifierComponent(content: self, id: id)
  }
}
