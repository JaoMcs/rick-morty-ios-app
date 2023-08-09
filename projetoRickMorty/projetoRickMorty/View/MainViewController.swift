//
//  ViewController.swift
//  projetoRickMorty
//
//  Created by Joao Tavares on 28/07/23.
//

import UIKit

fileprivate let cellId = "CharacterTableCellView"
fileprivate let identifierCharacterDetails = "characterDetails"

class MainViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet var caracterTableView: UITableView!

    //MARK: - Variables
    private var mainViewModel: MainViewModel

    init(viewModel: MainViewModel) {
        self.mainViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        mainViewModel = MainViewModel()
        super.init(coder: coder)
    }

    private func setupBind() {
        mainViewModel.updateTableView = {
            self.caracterTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        setupTableView()
        setupView()
    }

    private func setupView() {
        title = "Character Screen"
        mainViewModel.fetchData()
        caracterTableView.reloadData()
    }

    private func setupTableView() {
        caracterTableView.delegate = self
        caracterTableView.dataSource = self
        caracterTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        print("BackButton")
    }


    @IBAction func nextButtonAction(_ sender: Any) {
        print("NextButton")
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellId) as! CharacterTableCellView)
        let index = indexPath.row
        let character = mainViewModel.characters[index]
        let vm = CharacterTableCellViewModel(character: character)
        cell.setupCell()
        cell.configure(with: vm)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: identifierCharacterDetails, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! DetailsView
        guard let indexPath = caracterTableView.indexPathForSelectedRow else { return }

        let character = mainViewModel.characters[indexPath.row]
        let vm = DetailsViewModel(character: character)
        detailsVC.configure(with: vm)

        caracterTableView.deselectRow(at: indexPath, animated: true)
    }
}
