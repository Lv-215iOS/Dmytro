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
        
    func buttonGraphic(symbols: String) {
        
    }
    
    func graphProcess(symbols: String, num_x: Int) throws {
    }
        
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
//            data.append([0,0,0,0,0,0,0])
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
        
//        lineChart.addLine(data[1])
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
        
        //        var delta: Int64 = 4 * Int64(NSEC_PER_SEC)
        //        var time = dispatch_time(DISPATCH_TIME_NOW, delta)
        //
        //        dispatch_after(time, dispatch_get_main_queue(), {
        //            self.lineChart.clear()
        //            self.lineChart.addLine(data2)
        //        });
        
        //        var scale = LinearScale(domain: [0, 100], range: [0.0, 100.0])
        //        var linear = scale.scale()
        //        var invert = scale.invert()
        //        println(linear(x: 2.5)) // 50
        //        println(invert(x: 50)) // 2.5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "x: \(x)     y: \(yValues)"
    }
    
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }

}
