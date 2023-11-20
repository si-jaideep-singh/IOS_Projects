//
//  UserTableViewCell.swift
//  Messenger
//

//

import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    

  override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
       // Configure the view for the selected state
  }
    
    func configure(user: User)
    {
        usernameLabel.text = user.username
        statusLabel.text = user.status
        setAvatar(avatarLink: user.avatarLink)
    }
    private func setAvatar(avatarLink:String)
    {
        if avatarLink != "" {
            FileStorage.downloadImage(imageUrl: avatarLink){(avatarImage) in
                self.avatarImageView.image = avatarImage
            }
            
        } else {
            self.avatarImageView.image = UIImage(named: "avatar")?.circleMasked
          
        }
    }

}
