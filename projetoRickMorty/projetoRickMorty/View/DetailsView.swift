//
//  DetailsView.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 02/08/23.
//

import UIKit

class DetailsView: UIViewController {

    @IBOutlet weak var characterUIImageView: UIImageView!
    @IBOutlet weak var nameCharacterLabel: UILabel!
    @IBOutlet weak var statusCaracterLabel: UILabel!
    @IBOutlet weak var specieCharacterLabel: UILabel!
    @IBOutlet weak var genderCharacterLabel: UILabel!
    @IBOutlet weak var descriptionConteinerView: UIView!
    @IBOutlet weak var originCharacterLabel: UILabel!
    @IBOutlet weak var locationCharacterLabel: UILabel!

    var viewModel: DetailsViewModel

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        viewModel = DetailsViewModel()
        super.init(coder: coder)
    }

    private func setupBind() {
        viewModel.updateImage = {
            self.setupImage()
        }
        viewModel.updateData = {
            self.setupData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        viewModel.loadImage()
        viewModel.fetchData()
    }

    func setupLayout() {
        // Ajustar o Conteiner

    }

    func configure(with viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        setupBind()
    }

    func setupData() {
        nameCharacterLabel.text = viewModel.character.name
        statusCaracterLabel.text = viewModel.character.status
        genderCharacterLabel.text = viewModel.character.gender
        originCharacterLabel.text = viewModel.character.origin
        locationCharacterLabel.text = viewModel.character.location
    }
    func setupImage() {
        characterUIImageView.image = viewModel.UiImage
    }
}
