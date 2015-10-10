//
//  ViewController.swift
//  NSOperationQuene
//
//  Created by 徐继垚 on 15/10/10.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    let url1 = "http://img01.liwushuo.com/image/151008/0584rt896.jpg-w720"
    let url2 = "http://img01.liwushuo.com/image/150930/016juzqey.jpg-w720"
    let url3 = "http://img03.liwushuo.com/image/150803/j4dnzs8eq.jpg-w720"
    let url4 = "http://img02.liwushuo.com/image/151007/f1jhrg45p.jpg-w720"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
       let operationBlock1 = NSBlockOperation { () -> Void in
          self.image1.image =   self.loadImageData(self.url1)
        }
        
        let operationBlock2 = NSBlockOperation { () -> Void in
        self.image2.image = self.loadImageData(self.url2)
        }
        let operationBlock3 = NSBlockOperation { () -> Void in
        self.image3.image =    self.loadImageData(self.url3)
        }
        let operationBlock4 = NSBlockOperation { () -> Void in
        self.image4.image =     self.loadImageData(self.url4)
        }
        
        let quene = NSOperationQueue.mainQueue()
   
        quene.addOperation(operationBlock1)
        quene.addOperation(operationBlock2)
        quene.addOperation(operationBlock3)
        quene.addOperation(operationBlock4)
    
        
               // Do any additional setup after loading the view, typically from a nib.
    }
    func loadImageData(urlStr: String ) -> UIImage{
        
        let url = NSURL(string: urlStr)
        let data = NSData(contentsOfURL: url!)
        if data != nil {
             let image = UIImage(data: data!)
            return image!
           
        }
       
    
       return UIImage()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

