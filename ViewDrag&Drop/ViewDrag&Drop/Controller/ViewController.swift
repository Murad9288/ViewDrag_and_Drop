//
//  ViewController.swift
//  ViewDrag&Drop
//
//  Created by Md Murad Hossain on 21/11/22.


import UIKit



class ViewController: UIViewController {



    let myView = UIView(frame: CGRect(x: 0,
                                      y: 0,
                                      width: 380,
                                      height: 380)
    )

    let myView2 = UIView(frame: CGRect(x: 0,
                                       y: 0,
                                       width: 150,
                                       height: 150)
    )


    //let imageView = UIImageView(image: UIImage(named: "m2")!)

    var isDraging =  false

    override func viewDidLoad() {
        super.viewDidLoad()

        myViewConfig()
        view2Config()

    }

//    MARK: View Configuration

    func myViewConfig() {

        myView.backgroundColor = .cyan
        myView.center = view.center
        view.addSubview(myView)
    }


    func view2Config() {

        myView2.backgroundColor = .orange
        myView2.center = view.center
        view.addSubview(myView2)

    }

}

// MARK: View Drag and Drop setup

extension ViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: myView2)
        if myView2.bounds.contains(location) {
            isDraging = true
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDraging, let touch = touches.first else {
            return
        }
        let location = touch.location(in: view)

        myView2.frame.origin.x = location.x - (myView2.frame.size.width/2)
        myView2.frame.origin.y = location.y - (myView2.frame.size.height/2)

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDraging = false


    }
}






// MARK: Second Step

//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var view11: UIView!
//
//    let movableView = UIView(frame: CGRect(x: 0, y: 0 , width: 200, height: 200))
//
//    var beginningPosition: CGPoint = .zero
//    var initialMovableViewPosition: CGPoint = .zero
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        addMovableViews()
//
//    }
//
//    private func addMovableViews() {
//
//        movableView.backgroundColor = .green
//        movableView.center = view11.center
//        view.addSubview(movableView)
//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(touched(_:)))
//        movableView.addGestureRecognizer(gestureRecognizer)
//    }
//
//
//
//    @objc private func touched(_ gestureRecognizer: UIGestureRecognizer) {
//        if let touchedView = gestureRecognizer.view {
//            if gestureRecognizer.state == .began {
//                beginningPosition = gestureRecognizer.location(in: touchedView)
//                initialMovableViewPosition = view11.frame.origin
//            } else if gestureRecognizer.state == .ended {
//                touchedView.frame.origin = touchedView.frame.origin
//            } else if gestureRecognizer.state == .changed {
//                let location = gestureRecognizer.location(in: view)
//                movableView.frame.origin.x = location.x - (movableView.frame.size.width/2)
//                movableView.frame.origin.y = location.y - (movableView.frame.size.height/2)
//
//            }
//        }
//    }
//
//}
