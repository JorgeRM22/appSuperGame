//
//  SplashController.swift
//  appSuperGame1
//
//  Created by Jorge Reyes on 20/11/23.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Esperar 2 segundos para cambiar de pantalla
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3 ){
            self.performSegue(withIdentifier: "OpenGame", sender: nil)
        }
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
