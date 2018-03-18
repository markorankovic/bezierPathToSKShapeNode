


import PlaygroundSupport
import SpriteKit

let view = SKView(frame: .init(x: 0, y: 0, width: 500, height: 500))
let scene = SKScene(size: .init(width: view.bounds.width, height: view.bounds.height))
scene.anchorPoint = .init(x: 0.5, y: 0.5)
scene.backgroundColor = .orange
view.presentScene(scene)
PlaygroundPage.current.liveView = view

extension SKShapeNode {
    
    convenience init(path: UIBezierPath) {
        self.init(path: path.cgPath)
    }
    
}

let points = stride(from: 0, to: 2 * Double.pi, by: 0.1).map{ CGPoint(x: $0 * 50, y: sin($0) * 50) }

let path = UIBezierPath()

for (i, p) in points.enumerated() {
    guard i != 0 else {
        path.move(to: p)
        continue
    }
    path.addLine(to: p)
}

let sineWave = SKShapeNode(path: path)
sineWave.position.x -= 100
scene.addChild(sineWave)
