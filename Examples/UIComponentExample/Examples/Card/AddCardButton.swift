//
//  AddCardButton.swift
//  UIComponentExample
//
//  Created by Luke Zhao on 6/15/21.
//  Copyright © 2021 Luke Zhao. All rights reserved.
//

import UIComponent

struct AddCardButton: ComponentBuilder {
  let onTap: () -> Void
  func build() -> Component {
    HStack(spacing: 10, justifyContent: .center, alignItems: .center) {
      Image(systemName: "plus").tintColor(.label)
      Text("Add")
    }.inset(20).size(width: .fill).tappableView(onTap).id("add-card-button")
  }
}
