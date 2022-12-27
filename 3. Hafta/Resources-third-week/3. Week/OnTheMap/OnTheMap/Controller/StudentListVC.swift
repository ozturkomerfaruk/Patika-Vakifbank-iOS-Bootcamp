//
//  StudentListVC.swift
//  OnTheMap

import UIKit

final class StudentListVC: BaseVC, RefreshableProtocol {

    // MARK: Properties
    @IBOutlet private weak var studentLocationTableView: UITableView!
    private var locations: [StudentInformation]?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getStudentLocations()
    }

    // MARK: Methods
    private func getStudentLocations() {
        NetworkClient.getStudentLocations { (locations, error) in
            if let error = error {
                self.showErrorAlert(title: "Error", description: error.localizedDescription)
                return
            }
            self.locations = locations
            if self.studentLocationTableView != nil {
                self.studentLocationTableView.reloadData()
            }
        }
    }

    func refresh() {
        locations?.removeAll()
        getStudentLocations()
    }

}

extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentLocationCell") else { return .init() }
        cell.imageView?.image = #imageLiteral(resourceName: "icon_pin")
        cell.textLabel?.text = (locations?[indexPath.row].firstName ?? "") + " " + (locations?[indexPath.row].lastName ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mediaURL = locations?[indexPath.row].mediaURL, let url = URL(string: mediaURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
