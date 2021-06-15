//
//  CardViewController2.swift
//  UIComponentExample
//
//  Created by Luke Zhao on 2018-12-13.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIComponent
import UIKit

class CardViewController2: ComponentViewController {
  var newCardIndex = CardData.testCards.count + 1
  private var cards: [CardData] = CardData.testCards {
    didSet {
      reloadComponent()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    componentView.animator = AnimatedReloadAnimator()
  }
  
  override var component: Component {
    VStack(spacing: 8) {
      for (index, card) in cards.enumerated() {
        VStack(spacing: 8) {
          Text(card.title, font: UIFont.boldSystemFont(ofSize: 22))
          Text(card.subtitle)
        }.inset(h: 20, v: 16).size(width: .fill).tappableView { [unowned self] in
          print("Tapped \(card.title)")
          self.cards.remove(at: index)
        }.id(card.id)
        .backgroundColor(.systemBackground)
        .with(\.layer.shadowColor, UIColor.black.cgColor)
        .with(\.layer.shadowRadius, 8)
        .with(\.layer.shadowOpacity, 0.2)
        .with(\.layer.cornerRadius, 8)
      }
      AddCardButton { [unowned self] in
        self.cards.append(CardData(title: "Item \(self.newCardIndex)",
                                   subtitle: "Description \(self.newCardIndex)"))
        self.newCardIndex += 1
      }
    }.inset(20)
  }
}

