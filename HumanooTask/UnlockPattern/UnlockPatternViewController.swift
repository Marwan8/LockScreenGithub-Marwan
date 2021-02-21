//  
//  UnlockPatternViewController.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 20.02.21.
//

import UIKit

final class UnlockPatternViewController: UIViewController, UnlockPatternView {

    private let presenter: UnlockPatternPresenter
    private let patternViewModel: PatternViewModel

    private lazy var patternLockView: PatternLockView = {
        var frame = self.view.frame
        frame.origin.y = frame.origin.y + 50
        frame.size.height = frame.size.height - 50
        return PatternLockView(viewModel: patternViewModel, frame: frame)
    }()

    private let statusLabel = UILabel()
    
    init(presenter: UnlockPatternPresenter, viewModel: PatternViewModel) {
        self.presenter = presenter
        self.patternViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        setupSubviews()
        addSubviews()

        presenter.viewDidLoad(view: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupSubviews() {
        patternLockView.backgroundColor = .white
        patternLockView.delegate = self
        statusLabel.textColor = .black
        statusLabel.frame.origin = .zero
        statusLabel.frame.size = CGSize.init(width: self.view.frame.width, height: 30)
        statusLabel.textAlignment = .center
        statusLabel.center.x = self.view.center.x
    }
    
    private func addSubviews() {
        self.view.addSubview(patternLockView)
        self.view.addSubview(statusLabel)
    }

    private func displayStatus(text: String, textColor: UIColor) {
        self.statusLabel.textColor = textColor
        self.statusLabel.text = text
    }

    func showPatternStatus(valid: Bool) {
        if valid {
            displayStatus(text: "Valid path", textColor: .green)
        } else {
            displayStatus(text: "Invalid path", textColor: .red)
        }
    }
}

extension UnlockPatternViewController: PatternLockViewDelegate {
    func didPatternInput(patterLock: PatternLockView, track: [Int]) {
        presenter.validate(track: track)
    }

    func invalidPattern(max: Int) {
        let maxMoves = "Invalid Pattern max \(max) possibilities"
        displayStatus(text: maxMoves, textColor: .red)
    }
}


