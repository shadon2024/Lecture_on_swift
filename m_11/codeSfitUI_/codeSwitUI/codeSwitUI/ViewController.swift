//
//  ViewController.swift
//  codeSwitUI
//
//  Created by Admin on 24.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var tableView: UITableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // MARK: test
        view.backgroundColor = .white
        
        // Указываем, что настройки содержимого таблицы будем задавать из этого ViewController
        tableView.dataSource = self

        // Регистрируем ячейку: указываем таблице, какой класс ячейки в ней будет, и создаём идентификатор
        tableView.register(VideoPreviewCell.self, forCellReuseIdentifier: "videoPreviewCell")

        // Добавляем таблицу на вью вьюКонтроллера
        view.addSubview(tableView)
                
        // Настраиваем отступы
        setupConstraints()
    }
    
    func setupConstraints() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.leftAnchor.constraint(equalTo:view.leftAnchor),
                tableView.topAnchor.constraint(equalTo:view.topAnchor),
                tableView.rightAnchor.constraint(equalTo:view.rightAnchor),
                tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor)
            ])
        }
    
    // Создаём ячейку, зарегистрированную с идентификатором videoPreviewCell, чтобы таблица использовала её
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoPreviewCell", for: indexPath)
        return cell
    }
        
        // Задаём количество ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        // test
        // test
        // test
        // test
    }

}

