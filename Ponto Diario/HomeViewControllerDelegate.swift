//
//  HomeViewControllerDelegate.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 31/08/23.
//

import Foundation

protocol HomeViewControllerDelegate: AnyObject {
    func updateDataSource(with configurations: ConfigurationModel)
}
