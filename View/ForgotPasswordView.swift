//
//  ForgotPasswordView.swift
//  DAWAuth
//

import UIKit

public class ForgotPasswordView: AuthenticationFlowView {
    
    // MARK: - Properties
    
    lazy public var mailView: EmailWithPasswordView = {
        let view = EmailWithPasswordView()
        return view
    }()
        
    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        addSubview(mailView)
        
        mailView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom).offset(8)
        }
    }
}
