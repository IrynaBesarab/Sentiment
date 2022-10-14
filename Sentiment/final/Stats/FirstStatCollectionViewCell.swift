import UIKit
import Charts

class FirstStatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var barChartView: BarChartView!
    var statsCellDefaultValue = StatsCellDefaultValue()
    
    func createChart() {
      
        statsCellDefaultValue.chartValueCreating()
        
        let XAxis = barChartView.xAxis
        XAxis.labelTextColor = .clear
        let YAxisLeft = barChartView.rightAxis
        YAxisLeft.labelTextColor = .clear
        let YAxisRight = barChartView.leftAxis
        YAxisRight.labelTextColor = .clear

        var entries = [BarChartDataEntry]()
        for i in 0..<statsCellDefaultValue.mood.count {
            entries.append(
                BarChartDataEntry(
                    x: Double(i),
                    y: Double(statsCellDefaultValue.moodCountArreyCreating()[i])!
                )
            )
        }
        
        let set = BarChartDataSet(entries: entries, label: "Mood Chart")
        let data = BarChartData(dataSet: set)
        
        set.colors = ChartColorTemplates.joyful()
        
        barChartView.data = data
    }
}
