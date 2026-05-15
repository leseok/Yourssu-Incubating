import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var contentView: UITextView!

    var item: Memo?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.text = item?.title
        contentView.text = item?.content
        
        contentView.isEditable = false
        contentView.isSelectable = false
    }
}
