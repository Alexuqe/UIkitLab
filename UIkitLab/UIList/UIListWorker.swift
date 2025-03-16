    //
    //  UIListWorker.swift
    //  UIkitLab
    //
    //  Created by Sasha on 16.03.25.
    //

import Foundation
import UIKit

final class UIListWorker {

    func getComponent() -> [UILists] {
        [UILists(chapterName: "UIView", isExpanded: true,
                 components: [
                    UIComponent(name: "UIView", image: "viewfinder", backgroundColor: .blue),
                    UIComponent(name: "UILabel", image: "textformat", backgroundColor: .blue),
                    UIComponent(name: "UIImageView", image: "photo", backgroundColor: .blue),
                    UIComponent(name: "UIActivityIndicator", image: "progress.indicator", backgroundColor: .blue),
                    UIComponent(name: "UIProgressView", image: "distribute.vertical.fill", backgroundColor: .blue),
                    UIComponent(name: "UIScrollView", image: "chevron.up.chevron.down.square", backgroundColor: .blue),
                    UIComponent(name: "UIVisualEffectView", image: "camera.filters", backgroundColor: .blue),
                    UIComponent(name: "UIStackView", image: "square.stack", backgroundColor: .blue),
                 ])
        ]
    }



}
