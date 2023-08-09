//
//  CharacterTableCellView.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 30/07/23.
//

import UIKit

class CharacterTableCellView: UITableViewCell {

    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    var viewModel: CharacterTableCellViewModel

    private func setupBind() {
        viewModel.updateImage = {
            self.characterImageView.image = self.viewModel.UiImage
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.viewModel = CharacterTableCellViewModel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        self.viewModel = CharacterTableCellViewModel()
        super.init(coder: aDecoder)
    }

    func configure(with viewModel: CharacterTableCellViewModel) {
        self.viewModel = viewModel
        setupCell()
    }

    func setupCell() {
        setupBind()
        viewModel.loadImage()
        nameLabel.text = viewModel.character.name
        descriptionLabel.text = viewModel.character.getDescription()
    }
}
