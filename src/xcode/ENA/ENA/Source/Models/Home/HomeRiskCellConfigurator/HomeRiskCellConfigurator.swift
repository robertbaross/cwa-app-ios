//
//  HomeRiskCellConfigurator.swift
//  ENA
//
//  Created by Tikhonov, Aleksandr on 04.05.20.
//  Copyright © 2020 SAP SE. All rights reserved.
//

import UIKit
import ExposureNotification

final class HomeRiskCellConfigurator: CollectionViewCellConfigurator {
    
    // MARK: Properties
    var contactAction: (() -> Void)?
    
    private var date: Date?
    private var riskLevel: RiskLevel
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    // MARK: Creating a Home Risk Cell Configurator
    init(riskLevel: RiskLevel, date: Date?) {
        self.riskLevel = riskLevel
        self.date = date
    }
    
    // MARK: Configuration
    func configure(cell: RiskCollectionViewCell) {
        
        var dateString: String?
        if let date = date {
            dateString = HomeRiskCellConfigurator.dateFormatter.string(from: date)
        }
        let holder = HomeRiskCellPropertyHolder.propertyHolder(for: riskLevel, dateString: dateString)
        // The delegate will be called back when the cell's primary action is triggered
        cell.configure(with: holder, delegate: self)
    }
}


extension HomeRiskCellConfigurator: RiskCollectionViewCellDelegate {
    func contactButtonTapped(cell: RiskCollectionViewCell) {
        contactAction?()
    }
}