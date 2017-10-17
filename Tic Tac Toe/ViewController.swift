//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Pratik Anilkumar Parmar on 18/10/17.
//  Copyright © 2017 Pratik Anilkumar Parmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var noPlayer=1
    var boardState=[0,0,0,0,0,0,0,0,0]
    var isActive=true
    let WinSequences = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: AnyObject) {
        
            if(boardState[sender.tag-1]==0 && isActive==true)
            {
               // print("gameState[sender.tag-1]=\(gameState[sender.tag-1]) gameIsActive=\(gameIsActive)")
                boardState[sender.tag-1]=noPlayer
                if (noPlayer==1)
                {
                    sender.setImage(UIImage(named: "Cross.png"),for:UIControlState())
                    noPlayer=2 //change action player to Nought
                }
                else
                {
                    sender.setImage(UIImage(named: "Nought.png"),for:UIControlState())
                    noPlayer=1 //change action player to Cross
                }
            }
    
    
        for sequ in WinSequences
        {
            if boardState[sequ[0]] != 0 && boardState[sequ[0]] == boardState[sequ[1]] && boardState[sequ[1]] == boardState[sequ[2]]
            {
                isActive = false
                if boardState[sequ[0]]==1
                {
                     label.text = "Cross won!"
                }
                else
                {
                    label.text = "Nought won!"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        //to stop game and check it's draw or not?
        var count=1
        if isActive == true
        {
            for i in boardState
            {
                count = i*count
            }
            if count != 0
            {
                label.text = "It's Draw!"
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func PlayAgain(_ sender: AnyObject) {
        
        //chaging all state to default
        boardState=[0,0,0,0,0,0,0,0,0]
        isActive=true
        noPlayer=1
        
        playAgainButton.isHidden=true
        label.isHidden=true
        
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

