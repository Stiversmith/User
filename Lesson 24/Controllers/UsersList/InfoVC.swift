
import UIKit
import MapKit


class InfoVC: UIViewController {
    
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var userNameLbl: UILabel!
    @IBOutlet private weak var emailLbl: UILabel!
    @IBOutlet private weak var phoneLbl: UILabel!
    @IBOutlet private weak var adressLbl: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetail(user: user)
    }
    
    private func setDetail(user: User?) {
        if let user = user {
            nameLbl.text = user.name
            userNameLbl.text = user.username
            emailLbl.text = user.email
            phoneLbl.text = user.phone
            if let city = user.address?.city,
               let street = user.address?.street,
               let suite = user.address?.suite,
               let zipcode = user.address?.zipcode {
                adressLbl.text = "\(city)\n\(street)\n\(suite)\n\(zipcode)"
            } else {
                adressLbl.text = "Unknown"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMapVC" {
            if let mapViewController = segue.destination as? MapViewController {
                if let latitudeString = user?.address?.geo?.lat,
                   let longitudeString = user?.address?.geo?.lng,
                   let latitude = Double(latitudeString),
                   let longitude = Double(longitudeString) {
                    mapViewController.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                } else {
                    return
                }
            }
        }
    }
    
    @IBAction func showMap(_ sender: Any) {
        performSegue(withIdentifier: "ShowMapVC", sender: self)
    }
    
    @IBAction func openPostFlow(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PostFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PostsTVC") as! PostsTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func openAlbumFlow(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AlbumsAndPhotosFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlbumsTVC") as! AlbumsTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
