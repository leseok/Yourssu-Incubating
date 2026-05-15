
import UIKit

struct Memo {
    let title: String
    let content: String
}

class mainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addMemoDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //메모를 저장하는 구조체 배열 생성
    var items: [Memo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

       tableView.dataSource = self
       tableView.delegate = self

    }
    
    
    //메모가 추가될 때 테이블뷰 갱신
    func addMemo(_ memo : Memo) {
        items.append(memo)
        tableView.reloadData()
    }
     
    
    //섹션은 하나만 필요
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //행의 개수 = 생성된 메모의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //테이블뷰 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    //화면전환을 위한 segue 구현
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "plusBarButton" {
            
            guard let addMemoVC = segue.destination as? addMemoController
                else {return}
            
            addMemoVC.delegate = self
        }
        
        if segue.identifier == "viewDetailMemo" {
            guard let cell = sender as? UITableViewCell
                else {return}
            guard let indexPath = tableView.indexPath(for: cell)
                else {return}
            guard let viewDetailMemoVC = segue.destination as? detailViewController else {return}
            
            viewDetailMemoVC.item = items[indexPath.row]
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let vc = segue.destination as! detailViewController
            vc.item = items[indexPath.row]
     
    }
     */
    

}
