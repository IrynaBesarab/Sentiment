import UIKit
import Charts

class SecondStatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var secondStatsPieChart: PieChartView!
    
    var statsCellDefaultValue = StatsCellDefaultValue()
    
    func createChart() {
      
        statsCellDefaultValue.chartValueCreating()
        var numberOfElements = [PieChartDataEntry]()
        var oneMood = PieChartDataEntry(value: Double(statsCellDefaultValue.chartsDefaultValueOne))
        var twoMood = PieChartDataEntry(value: Double(statsCellDefaultValue.chartsDefaultValueTwo))
        var threeMood = PieChartDataEntry(value: Double(statsCellDefaultValue.chartsDefaultValueThree))
        var fourMood = PieChartDataEntry(value: Double(statsCellDefaultValue.chartsDefaultValueFour))
        var fiveMood = PieChartDataEntry(value: Double(statsCellDefaultValue.chartsDefaultValueFive))

        numberOfElements = [oneMood, twoMood, threeMood, fourMood, fiveMood]
        
        let pieChartDataSet = PieChartDataSet(entries: numberOfElements, label: "Mood Distribution")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        pieChartDataSet.colors = ChartColorTemplates.joyful()
        
        pieChartData.setValueTextColor(NSUIColor.clear)

        secondStatsPieChart.data = pieChartData
    }
}
