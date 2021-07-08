//
//  PatternControl.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 20.02.21.
//

import UIKit

protocol PatternLockViewDelegate: class {
    func didPatternInput(patterLock: PatternLockView, track: [Int])
    func invalidPattern(max: Int)
}

struct PatternViewModel {
    let dotImage: UIImage?
    let dotSelectedImage: UIImage?
    let lockSize: Int
    let trackLineColor: UIColor
    let trackLineThickness: CGFloat
    let maxPossibilities: Int
}

class PatternLockView: UIControl {

    public weak var delegate: PatternLockViewDelegate?

    private var dot: UIImage? = UIImage(named: "dot")
    private var dotSelected: UIImage? = UIImage(named: "dot-selected")
    private var lockSize: Int = 3
    private var trackLineColor: UIColor = .blue
    private var trackLineThickness: CGFloat = 5
    private var lockTrack = [Int]()
    private var lockFrames = [CGRect]()
    private var maxPossibilities = 8

    init(viewModel: PatternViewModel, frame: CGRect) {
        super.init(frame: frame)

        self.dot = viewModel.dotImage
        self.dotSelected = viewModel.dotSelectedImage
        self.trackLineThickness = viewModel.trackLineThickness
        self.trackLineColor = viewModel.trackLineColor
        self.maxPossibilities = viewModel.maxPossibilities
        self.lockSize = viewModel.lockSize
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        guard let dot = dot else {return}
        guard let _ = dotSelected else {return}

        let rect = self.frame
        let spacing = (rect.width - (CGFloat(lockSize) * dot.size.width)) / CGFloat(lockSize + 1)
        let iconSize = dot.size
        lockFrames.removeAll()

        for y in 0..<lockSize {
            for x in 0..<lockSize {
                let point = CGPoint(x: spacing + CGFloat(x) * (iconSize.width + spacing), y: spacing + CGFloat(y) * (iconSize.width + spacing))
                let dotRect = CGRect(origin: point, size: iconSize)
                lockFrames.append(dotRect)
            }
        }
    }

    open override func draw(_ rect: CGRect) {
        self.backgroundColor = .white

        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        guard let dot = dot else {return}
        guard let dotSelected = dotSelected else {return}

        if !lockTrack.isEmpty {
            drawTrackPath(ctx: ctx)
        }

        for (index,dotRect) in lockFrames.enumerated() {
            if lockTrack.contains(index) {
                dotSelected.draw(in: dotRect)
            } else {
                dot.draw(in: dotRect)
            }
        }
    }

    private func drawTrackPath(ctx: CGContext) {
        let path = UIBezierPath()

        for i in 0..<lockTrack.count - 1 {
            let index = lockTrack[i]
            let indexTo = lockTrack[i+1]
            let rect = lockFrames[index]
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))

            let rectTo = lockFrames[indexTo]
            path.addLine(to: CGPoint(x: rectTo.midX, y: rectTo.midY))
        }

        trackLineColor.set()
        ctx.setLineWidth(trackLineThickness)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.addPath(path.cgPath)
        ctx.strokePath()
    }

    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        lockTrack.removeAll()
        let point = touch.location(in: self)
        if hitDotFrames(at: point) {
            setNeedsDisplay()
        }
        return super.beginTracking(touch, with: event)
    }

    open override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let point = touch.location(in: self)
        if hitDotFrames(at: point) {
            setNeedsDisplay()
        }
        return super.continueTracking(touch, with: event)
    }

    open override func endTracking(_ touch: UITouch?, with event: UIEvent?) {

        if lockTrack.count > maxPossibilities {
            delegate?.invalidPattern(max: maxPossibilities)
        }
        else if lockTrack.count >= 2 {
            delegate?.didPatternInput(patterLock: self, track: lockTrack)
        }
        lockTrack.removeAll()
        setNeedsDisplay()
        super.endTracking(touch, with: event)
    }

    private func hitDotFrames(at point: CGPoint) -> Bool {
        for (index, rect) in lockFrames.enumerated() {
            if rect.contains(point) {
                if !lockTrack.contains(index) {
                    lockTrack.append(index)
                }
                return true
            }
        }
        return false
    }
}
