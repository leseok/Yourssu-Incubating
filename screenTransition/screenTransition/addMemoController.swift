import UIKit

//메모를 넘기기위한 프로토콜
protocol addMemoDelegate: AnyObject {
    func addMemo(_ memo: Memo)
}

class addMemoController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    weak var delegate: addMemoDelegate?
    
    //메모 데이터를 입력받고 홈화면으로 돌아감
    @IBAction func addMemo(_ sender: UIBarButtonItem) {
        let memo = Memo(title: titleTextField.text ?? "", content: contentTextView.text ?? "")
        
        delegate?.addMemo(memo)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
