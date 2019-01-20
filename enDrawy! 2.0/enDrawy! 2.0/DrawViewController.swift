//
//  DrawViewController.swift
//  enDrawy! 2.0
//
//  Created by WENNAN SHI on 4/26/18.
//  Copyright © 2018 WENNAN SHI. All rights reserved.
//

import UIKit
import AudioToolbox

class DrawViewController: UIViewController
{
    var startPoint: CGPoint = CGPoint.zero
    var endPoint: CGPoint = CGPoint.zero
    var customPath: UIBezierPath?
    var layer: CAShapeLayer?
    var lineCap: String = kCALineCapRound
    var selectedShape = ShapeSelect.oval
    var selectedColor: UIColor = UIColor.black
    var width: CGFloat = 1
    var opacity: Float = 0.5
    let shapeArray = [ShapeSelect.oval, ShapeSelect.rectangle, ShapeSelect.roundedRect,
                      ShapeSelect.triangle, ShapeSelect.line, ShapeSelect.freeStyle]
    
    @IBOutlet weak var ViewDraw: UIView!
    @IBOutlet weak var BottonMore: UIButton!
    @IBOutlet weak var ViewSlider: UIView!
    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var ViewShape: UIView!
    @IBOutlet weak var ViewBottom: UIView!
    @IBOutlet weak var ViewOutsideSlider: UIView!
    @IBOutlet weak var LabelWidth: UILabel!
    @IBOutlet weak var LabelOpacity: UILabel!
    @IBOutlet weak var ViewTop: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ViewSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        ViewTop.isHidden = true
        ViewTop.isUserInteractionEnabled = false
        ViewOutsideSlider.isHidden = true
        ViewOutsideSlider.isUserInteractionEnabled = false
        ViewSlider.isHidden = true
        ViewSlider.isUserInteractionEnabled = false
        ViewColor.isHidden = true
        ViewColor.isUserInteractionEnabled = false
        ViewShape.isHidden = true
        ViewShape.isUserInteractionEnabled = false
        
        ViewDraw.layer.zPosition = 1
        BottonMore.layer.zPosition = 2
        ViewTop.layer.zPosition = 2
        ViewOutsideSlider.layer.zPosition = 2
        ViewSlider.layer.zPosition = 3
        ViewColor.layer.zPosition = 2
        ViewShape.layer.zPosition = 3
        ViewBottom.layer.zPosition = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonMore(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        ViewTop.isHidden = !ViewTop.isHidden
        ViewTop.isUserInteractionEnabled = !ViewTop.isUserInteractionEnabled
    }
    
    @IBAction func logout(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forum(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
    }
    
    @IBAction func share(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        let image = UIImage(view: ViewDraw)
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func widthSlider(_ sender: UISlider)
    {
        width = CGFloat(sender.value)
        let widthValue = Int(round(sender.value))
        LabelWidth.text = "\(widthValue)"
    }
    
    @IBAction func opacitySlider(_ sender: UISlider)
    {
        opacity = sender.value
        let opacityValue = NSString(format:"%.1f",(sender.value))
        LabelOpacity.text = "\(opacityValue)"
    }
    
    @IBAction func viewColorHidden(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        ViewShape.isHidden = true
        ViewShape.isUserInteractionEnabled = false
        ViewColor.isHidden = !ViewColor.isHidden
        ViewColor.isUserInteractionEnabled = !ViewColor.isUserInteractionEnabled
    }
    
    @IBAction func viewShapeHidden(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        ViewColor.isHidden = true
        ViewColor.isUserInteractionEnabled = false
        ViewShape.isHidden = !ViewShape.isHidden
        ViewShape.isUserInteractionEnabled = !ViewShape.isUserInteractionEnabled
    }
    
    @IBAction func viewSliderHidden(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        ViewOutsideSlider.isHidden = !ViewOutsideSlider.isHidden
        ViewOutsideSlider.isUserInteractionEnabled = !ViewOutsideSlider.isUserInteractionEnabled
        ViewSlider.isHidden = !ViewSlider.isHidden
        ViewSlider.isUserInteractionEnabled = !ViewSlider.isUserInteractionEnabled
    }
    
    @IBAction func deleteAll(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        let alertVC = UIAlertController(title: "Notice", message: "All Drawing Will be Deleted", preferredStyle: .alert)
        let acSure = UIAlertAction(title: "Delete", style: .destructive)
        {
            (UIAlertAction) -> Void in self.ViewDraw.layer.sublayers = nil
        }
        let acCancel = UIAlertAction(title: "Cancel", style: .cancel)
        {
            (UIAlertAction) -> Void in print("Cancel")
        }
        alertVC.addAction(acSure)
        alertVC.addAction(acCancel)
        self.present(alertVC, animated: true)
    }
    
    @IBAction func saveImage(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        let image = UIImage(view: ViewDraw)
        let alertVC = UIAlertController(title: "Notice", message: "Your Drawing Will be Saved", preferredStyle: .alert)
        let acSure = UIAlertAction(title: "Save", style: .destructive)
        {
            (UIAlertAction) -> Void in UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        let acCancel = UIAlertAction(title: "Cancel", style: .cancel)
        {
            (UIAlertAction) -> Void in print("Cancel")
        }
        alertVC.addAction(acSure)
        alertVC.addAction(acCancel)
        self.present(alertVC, animated: true)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        else {
            let ac = UIAlertController(title: "Success!", message: "", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func colorSelect(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        let tag = sender.tag
        switch tag
        {
        case ColorSelect.red.rawValue: selectedColor = UIColor.red
        case ColorSelect.yellow.rawValue: selectedColor = UIColor.yellow
        case ColorSelect.green.rawValue: selectedColor = UIColor.green
        case ColorSelect.blue.rawValue: selectedColor = UIColor.blue
        case ColorSelect.purple.rawValue: selectedColor = UIColor.purple
        case ColorSelect.black.rawValue: selectedColor = UIColor.black
        default: selectedColor = UIColor.black
        }
    }
    
    @IBAction func shapeSelect(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        selectedShape = shapeArray[sender.tag]
    }

    @IBAction func didDraw(_ sender: UIPanGestureRecognizer)
    {
        if sender.state == .began
        {
            customPath = UIBezierPath()
            startPoint = sender.location(in: sender.view)
            layer = CAShapeLayer()
            layer?.lineCap = lineCap
            layer?.lineWidth = width
            layer?.opacity = opacity
            layer?.strokeColor = UIColor.black.cgColor
            layer?.fillColor = selectedColor.cgColor
            self.ViewDraw.layer.addSublayer(layer!)
        }
            
        else if sender.state == .changed
        {
            switch selectedShape
            {
            case ShapeSelect.oval:
                let translation = sender.translation(in: sender.view)
                layer?.path = ShapePath().oval(startPoint: startPoint, translationPoint: translation).cgPath
                
            case ShapeSelect.rectangle:
                let translation = sender.translation(in: sender.view)
                layer?.path = ShapePath().rectangle(startPoint: startPoint, translationPoint: translation).cgPath
                
            case ShapeSelect.roundedRect:
                let translation = sender.translation(in: sender.view)
                layer?.path = ShapePath().roundedRect(startPoint: startPoint, translationPoint: translation).cgPath
                
            case ShapeSelect.triangle:
                endPoint = sender.location(in: sender.view)
                layer?.path = ShapePath().triangle(startPoint: startPoint, endPoint: endPoint).cgPath
                
            case ShapeSelect.line:
                layer?.strokeColor = selectedColor.cgColor
                endPoint = sender.location(in: sender.view)
                layer?.path = ShapePath().line(startPoint: startPoint, endPoint: endPoint).cgPath
                
            case ShapeSelect.freeStyle:
                layer?.strokeColor = selectedColor.cgColor
                endPoint = sender.location(in: sender.view)
                customPath?.move(to: startPoint)
                customPath?.addLine(to: endPoint)
                startPoint = endPoint
                layer?.path = customPath?.cgPath
                
            case ShapeSelect.eraser:
                layer?.strokeColor = UIColor.white.cgColor
                layer?.opacity = 1
                layer?.lineWidth = 30
                endPoint = sender.location(in: sender.view)
                customPath?.move(to: startPoint)
                customPath?.addLine(to: endPoint)
                startPoint = endPoint
                layer?.path = customPath?.cgPath
            }
        }
    }
    
    @IBAction func eraser(_ sender: UIButton)
    {
        AudioServicesPlaySystemSound(1104)
        selectedShape = ShapeSelect.eraser
    }
}

extension UIImage
{
    convenience init(view: UIView)
    {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
