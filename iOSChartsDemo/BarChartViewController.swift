//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet var barChartView: BarChartView!
    
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        barChartView.delegate = self
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(months, values: unitsSold)
        
        barChartView.noDataTextDescription = "GIVE REASON"
        barChartView.descriptionText = ""
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        ll.lineColor = UIColor(red: 30/255, green: 26/255, blue: 34/255, alpha: 1)
        barChartView.rightAxis.addLimitLine(ll)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        
        chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
//        chartDataSet.colors = ChartColorTemplates.joyful()
        
        barChartView.data = chartData
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        print("\(entry.value) in \(months[entry.xIndex])")
    }

}

