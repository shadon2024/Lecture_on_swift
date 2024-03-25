//
//  VideoPreviewCell.swift
//  codeSwitUI
//
//  Created by Admin on 24.03.2024.
//

import SwiftUI
import UIKit


class VideoPreviewCell: UITableViewCell {
    var videoImageView: UIImageView = UIImageView()
    var avatarImageView: UIImageView = UIImageView()
    var descriptionLabel: UILabel = UILabel()
    var authorLabel: UILabel = UILabel()
    var containerView: UIView =  UIView()
    
    // Инициализатор ячейки. Вызывается, когда ячейка создаётся в памяти
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            // Настраиваем контент элементов
            setupView()

            // Настраиваем отступы
            setupConstraints()
        }

        // Этот инициализатор вызовется, если мы используем объект класса в storyboard
        // Сейчас он не нужен, но нельзя отказаться от его реализации, так как он обязателен (required)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setupView() {
            // Задаём картинку и цвет текста для videoImageView
            videoImageView.image = UIImage(systemName: "person")
            videoImageView.contentMode = .scaleAspectFit
            videoImageView.tintColor = .black
            videoImageView.backgroundColor = .blue

            // Задаём картинку и цвет текста для avatarImageView
            avatarImageView.image = UIImage(systemName: "person.circle")
            avatarImageView.tintColor = .label
            //avatarImageView.startAnimating()

            // Задаём текст и параметры его отображения для descriptionLabel
            descriptionLabel.text = "Video Description Video Description Video Description Video Description Video Description"
            descriptionLabel.numberOfLines = 2
            
            // Задаём текст для authorLabel
            authorLabel.text = "Video Author. 500k views"
            // Добавляем в контейнер элементы, которые должны в нём располагаться
            containerView.addSubview(avatarImageView)
            containerView.addSubview(descriptionLabel)
            containerView.addSubview(authorLabel)

            // Добавляем в ячейку основную картинку и контейнер
            contentView.addSubview(videoImageView)
            contentView.addSubview(containerView)
        }
    func setupConstraints() {
            // По умолчанию true означает, что система автоматически задаст вью constraints
            // Чтобы задать constraints, выставляем значение false
            videoImageView.translatesAutoresizingMaskIntoConstraints = false
            containerView.translatesAutoresizingMaskIntoConstraints = false
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            authorLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                // Выставляем нулевые отступы для videoImageView (верхний, левый, правый)
                videoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                videoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                videoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                videoImageView.heightAnchor.constraint(equalToConstant: 200),
                
                // Задаём для containerView фиксированную высоту 200
                containerView.heightAnchor.constraint(equalToConstant: 200),

                // Выставляем отступы для containerView, верхний привязываем к низу videoImageView
                containerView.topAnchor.constraint(equalTo: videoImageView.bottomAnchor),

                // Остальные отступы выставляем по краям contentView
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                // Размещаем avatarImageView в центре containerView по вертикали
                avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                avatarImageView.heightAnchor.constraint(equalToConstant: 100),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

                // Констрейнты могут быть отрицательными. Это зависит от направления, в котором нужно задать отступ
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                descriptionLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
                authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                authorLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),

                // Выставляем ширину authorLabel всегда равным 2/3 от ширины descriptionLabel
                authorLabel.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor, multiplier: 2.0/3.0)
            ])
        }
    
}

