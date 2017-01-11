//
//  GraphicController.swift
//  Calc
//
//  Created by Dmytro on 1/8/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit
import QuartzCore

class GraphicController: UIViewController, LineChartDelegate {
    var label = UILabel()
    var lineChart: Graphic!
    var inputController: InputController? = nil
    var data: [[CGFloat]] = []
    var function: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var views: [String: AnyObject] = [:]
        
        label.text = "..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        let xLabels = [String](repeating: "ww", count: 71)
        
        lineChart = Graphic()
        if data.isEmpty {
            lineChart.clearAll()
            return
        }
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 7
        lineChart.y.grid.count = 7
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        for i in 0..<data.count{
            lineChart.addLine(data[i])
        }
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "x: \(x)     y: \(yValues)"
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }
    
}
