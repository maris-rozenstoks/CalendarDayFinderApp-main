import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultBox: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    var yourDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        findButton.setTitle("Find", for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func findWeekDay() {
#warning("find day of the year on Find tap")
        
        //Calendar
        //DateCompontes
        //DateFormatter -> dateFormat
        
        //Logic Calculation, it can't be 0
        //present alert if something went wrong
        
        //Result is for presenting the Day of week
        
        //Title Find to Clear(clear all text filed to "")
      
        
        guard let dayString = dayTextField.text,
              let monthString = monthTextField.text,
              let yearString = yearTextField.text,
              !dayString.isEmpty, !monthString.isEmpty, !yearString.isEmpty,
              let day = Int(dayString), let month = Int(monthString), let year = Int(yearString) else {
            print("Input is invalid")
           
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" //Format for input
        
        if let date = dateFormatter.date(from: "\(day)/\(month)/\(year)") {
           
            let calendar = Calendar.current
            let weekday = calendar.component(.weekday, from: date)
            
            let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            
            let weekdayName = weekdays[weekday - 1] //index
            
            resultBox.text = weekdayName
            yourDate = dateFormatter.string(from: date)
        } else {
            print("Invalid date format")
        }
        findButton.setTitle("Clear text", for: .normal)
        dayTextField.text = ""
            monthTextField.text = ""
            yearTextField.text = ""//clear text
    }
    
    @IBAction func findButtonTapped(_ sender: Any) {
        if findButton.currentTitle == "Find" {
                findWeekDay()
            } else {
                // If the button title is "Clear text," clear the input fields and reset the button title
                dayTextField.text = ""
                monthTextField.text = ""
                yearTextField.text = ""
                resultBox.text = ""
                findButton.setTitle("Find", for: .normal)
            }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            // Get the new view controller using segue.destination.
            guard let vc = segue.destination as? InfoViewController else { return }
            
            // Pass the selected object to the new view controller.
            vc.info = resultBox.text
            vc.yourDateShown = yourDate
        }
    }
}
