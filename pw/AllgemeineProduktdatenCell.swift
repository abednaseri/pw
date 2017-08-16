//
//  Allgemeine Produktdaten.swift
//  pw
//
//  Created by Abed Naseri Douraki on 11.08.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

import UIKit
import Alamofire

class AllgemeineProduktdatenCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource{

    let array = ["Babymöbel", "ASSsd", "dsfg", "fvergewr"]
    let bereich_array = ["Babymöbel", "Badezimmermöbel", "Couchtische/Beistelltische", "Dielenmöbel", "Esstische/Essgruppen", "Flecht-/Rattanmöbel", "Gartenmöbel", "Jugendzimmermöbel", "Kinderzubehör", "Kinderzimmermöbel", "Konsolen", "Lampen/Leuchten", "Phono-Möbel", "Regale", "Schränke", "Sekretäre", "Sideboard/Anrichten", "Spiegel", "Stühle", "Teppiche", "Vitrinen", "Wohnwände", "Sonstiges"]
    //var addEditVC_instance = AddEditVC()
    
    
    //
    // MARK: - Outlets
    
    @IBOutlet weak var AngebotsnameTextF: UITextField!
    @IBOutlet weak var Referenznummer: UITextField!
    @IBOutlet weak var modelTextF: UITextField!
    @IBOutlet weak var bemerkungTextF: UITextView!
    @IBOutlet weak var extrasTextF: UITextView!
    @IBOutlet weak var ursprLadenPreisEuroTextF: UITextField!
    @IBOutlet weak var ursprLadenPreisCentTextF: UITextField!
    @IBOutlet weak var AngebotsPreisEuroTextF: UITextField!
    @IBOutlet weak var AngebotsPreisCentTextF: UITextField!
    
    // Bereich Möbel
    @IBOutlet weak var bereichMoebelLabel: UILabel!
    @IBOutlet weak var bereichMoebelPicker: UIPickerView!
    @IBAction func showHideBereichMoebelPicker(_ sender: Any) {
        if bereichMoebelPicker.isHidden{
            bereichMoebelPicker.isHidden = false
        } else{
            bereichMoebelPicker.isHidden = true
        }
    }
    
    // Hersteller
    @IBOutlet weak var chosenHerstellerLabel: UILabel!
    @IBOutlet weak var herstellerPickerView: UIPickerView!
    @IBAction func showHideHerstellerPicker(_ sender: UIButton) {
        if herstellerPickerView.isHidden{
            herstellerPickerView.isHidden = false
        } else{
            herstellerPickerView.isHidden = true
        }
    }
    
    // Anzeigen auch auf eigener Webseite
    @IBOutlet weak var anzeigenAuchAufEigenerWebseiteSwitch: UISwitch!
    @IBAction func anzeigenAufWebsiteSwitch(_ sender: Any) {
    }
    
    // Start des Angebot
    @IBOutlet weak var startDesAngebotChosenDateLabel: UILabel!
    @IBOutlet weak var startDesAngebotDatePicker: UIDatePicker!
    @IBAction func hideShowStartDesAngebotDP(_ sender: Any) {
        if startDesAngebotDatePicker.isHidden{
            startDesAngebotDatePicker.isHidden = false
        } else{
            startDesAngebotDatePicker.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        herstellerPickerView.delegate = self
        herstellerPickerView.dataSource = self
        bereichMoebelPicker.delegate = self
        bereichMoebelPicker.dataSource = self
        super.awakeFromNib()
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView{
        case herstellerPickerView:
            return array.count
        case bereichMoebelPicker:
            return bereich_array.count
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView{
        case herstellerPickerView:
            return array[row]
        case bereichMoebelPicker:
            return bereich_array[row]
        default:
            return "Default"
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView{
        case herstellerPickerView:
            chosenHerstellerLabel.text = array[row]
            herstellerPickerView.isHidden = true
        case bereichMoebelPicker:
            bereichMoebelLabel.text = bereich_array[row]
            bereichMoebelPicker.isHidden = true
        default:
            herstellerPickerView.isHidden = true
            bereichMoebelPicker.isHidden = true
        }

    }
    
    
    
    @IBAction func valueDatePickerChanged(_ sender: Any) {
        startDesAngebotChosenDateLabel.text = String(describing: startDesAngebotDatePicker.date) 
    }
    
    
    
    func setUpAllgemeineFields(product: ItemsClass){
        AngebotsnameTextF.text = "ABED"//product.title
        Referenznummer.text = product.artikel_nummer
        modelTextF.text = product.typ_kategorie
    }


}
