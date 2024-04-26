import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DashBoard extends StatefulWidget {
  final double previousDaySale;
  final String loggedInUserRole;
  final String currentuser;
  const DashBoard({
    Key? key,
    required this.loggedInUserRole,
    required this.currentuser,
    required this.previousDaySale,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double todaysale = 0.0;
  List<BillMaster> billMasters = [];
  List<String>? savedBillList;
  List<Map<String, dynamic>>? savedBillMasters;
  List<dynamic>? billMastersJson;

  @override
  void initState() {
    super.initState();
    tracetodays();
  }

  tracetodays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedBillList = prefs.getStringList('billDetails') ?? [];
    final savedBillMasters = prefs.getString('billMasters');

    if (savedBillMasters != null) {
      billMastersJson = jsonDecode(savedBillMasters);
      billMasters =
          billMastersJson!.map((data) => BillMaster.fromJson(data)).toList();

      filterByUserRole(widget.currentuser);
    }

    setState(() {});
  }

  void filterByUserRole(String usersName) {
    final today = DateTime.now().toString().split(' ')[0];
    if (widget.loggedInUserRole == 'biller') {
      todaysale = billMasters
          .where((billMaster) =>
              billMaster.billDate == today && billMaster.userName == usersName)
          .fold<double>(
              0.0, (total, billMaster) => total + billMaster.totalBillAmount);
    } else if (widget.loggedInUserRole == 'manager') {
      if (usersName.isNotEmpty) {
        todaysale = billMasters
            .where((billMaster) => billMaster.billDate == today)
            .fold<double>(
                0.0, (total, billMaster) => total + billMaster.totalBillAmount);
      }
    }
    setState(() {});
  }

  double calculateInventoryValue() {
    double inventoryValue = 0.0;
    for (var item in stock) {
      inventoryValue += item.quantity * item.unitprice;
    }
    return inventoryValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.loggedInUserRole == 'biller'
          ? Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "DASHBOARD",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Card(
                        elevation: 20.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Your Today sales",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "RS.${todaysale.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                if (todaysale != 0.0)
                                  Row(
                                    children: [
                                      Icon(
                                        todaysale >= widget.previousDaySale
                                            ? Icons.arrow_upward
                                            : Icons.arrow_downward,
                                        color:
                                            todaysale >= widget.previousDaySale
                                                ? Colors.green
                                                : Colors.red,
                                      ),
                                      if (widget.previousDaySale != 0)
                                        Text(
                                          '${(((todaysale - widget.previousDaySale) / widget.previousDaySale) * 100).toStringAsFixed(0)}%',
                                          style: TextStyle(
                                            color: todaysale >=
                                                    widget.previousDaySale
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : widget.loggedInUserRole == 'manager'
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: ListView(
                      children: [
                        const Text(
                          "DASHBOARD",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Card(
                            elevation: 20.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Today sales",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text("RS.$todaysale",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Card(
                            elevation: 10.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Current Inventory Value",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                    "RS.${calculateInventoryValue().toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.90,
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Card(
                            elevation: 10.0,
                            child: billMastersJson != null
                                ? DashboardCharts(
                                    billMasters: billMasters,
                                    savedBillMasters: billMastersJson!,
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
    );
  }
}

class ChartSampleData {
  final String username;
  final double amount;

  ChartSampleData(this.username, this.amount);
}

class BillerPerformancePieChart extends StatefulWidget {
  final List<BillMaster> billMasters;

  const BillerPerformancePieChart({super.key, required this.billMasters});

  @override
  // ignore: library_private_types_in_public_api
  _BillerPerformancePieChartState createState() =>
      _BillerPerformancePieChartState();
}

class _BillerPerformancePieChartState extends State<BillerPerformancePieChart> {
  late Map<String, double> billerPerformance;

  @override
  void initState() {
    super.initState();
    calculateBillerPerformance();
  }

  void calculateBillerPerformance() {
    billerPerformance = {};

    for (var biller in widget.billMasters) {
      if (billerPerformance.containsKey(biller.userName)) {
        billerPerformance[biller.userName] =
            (billerPerformance[biller.userName] ?? 0) + biller.totalBillAmount;
      } else {
        billerPerformance[biller.userName] = biller.totalBillAmount;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: billerPerformance.isEmpty
            ? const CircularProgressIndicator()
            : SfCircularChart(
                legend: const Legend(
                    isResponsive: true,
                    isVisible: true,
                    position: LegendPosition.top,
                    iconHeight: 40.0,
                    iconWidth: 40.0,
                    height: "100"),
                series: <CircularSeries>[
                  RadialBarSeries<ChartSampleData, String>(
                    animationDuration: 0.0,
                    dataSource: billerPerformance.entries
                        .map((entry) => ChartSampleData(entry.key, entry.value))
                        .toList(),
                    xValueMapper: (ChartSampleData data, _) => data.username,
                    yValueMapper: (ChartSampleData data, _) => data.amount,
                    dataLabelMapper: (ChartSampleData data, _) =>
                        data.username,
                    dataLabelSettings: const DataLabelSettings(
                        textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 21, 21, 21)),
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        labelAlignment: ChartDataLabelAlignment.outer),
                  ),
                ],
              ),
      ),
    );
  }
}

class WeeklyLineChart extends StatefulWidget {
  final List<dynamic> savedBillMaster;

  const WeeklyLineChart({super.key, required this.savedBillMaster});

  @override
  // ignore: library_private_types_in_public_api
  _WeeklyLineChartState createState() => _WeeklyLineChartState();
}

class _WeeklyLineChartState extends State<WeeklyLineChart> {
  List<ChartData> chartData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    updateChartData(widget.savedBillMaster);
  }

  void updateChartData(List<dynamic> data) {
    Map<String, double> weeklySales = {
      'Mon': 0,
      'Tue': 0,
      'Wed': 0,
      'Thu': 0,
      'Fri': 0,
      'Sat': 0,
      'Sun': 0,
    };

    for (var entry in data) {
      DateTime date = DateTime.parse(entry['billDate']);
      String day = DateFormat('E').format(date);
      double totalBillAmount = entry['totalBillAmount'].toDouble();

      weeklySales.update(day, (value) => value + totalBillAmount);
    }

    List<ChartData> updatedData = [];
    for (var entry in weeklySales.entries) {
      updatedData.add(ChartData(entry.key, entry.value));
    }

    setState(() {
      chartData = updatedData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<ChartData, String>>[
                  LineSeries<ChartData, String>(
                      dataSource: chartData,
                      animationDuration: 0.0,
                      xValueMapper: (ChartData sales, _) => sales.day,
                      yValueMapper: (ChartData sales, _) => sales.value,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      )),
                ],
              ),
      ),
    );
  }
}

class ChartData {
  final String day;
  final double value;

  ChartData(this.day, this.value);
}

class MonthlyLineChart extends StatefulWidget {
  final List<dynamic> savedBillMaster;

  const MonthlyLineChart({super.key, required this.savedBillMaster});

  @override
  // ignore: library_private_types_in_public_api
  _MonthlyLineChartState createState() => _MonthlyLineChartState();
}

class _MonthlyLineChartState extends State<MonthlyLineChart> {
  List<ChartDatas> chartDatas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    updateChartData(widget.savedBillMaster);
  }

  void updateChartData(List<dynamic> data) {
    // Map<int, double> monthlySales = Map<int, double>.fromIterable(
    //   List.generate(12, (index) => index + 1),
    //   key: (item) => item,
    //   value: (_) => 0,
    // );
    Map<int, double> monthlySales = { for (var item in List.generate(12, (index) => index + 1)) item : 0 };

    for (var entry in data) {
      DateTime date = DateTime.parse(entry['billDate']);
      int month = date.month;
      double totalBillAmount = entry['totalBillAmount'].toDouble();

      monthlySales.update(month, (value) => value + totalBillAmount);
    }

    List<ChartDatas> updatedData = [];
    for (var entry in monthlySales.entries) {
      updatedData.add(ChartDatas(_getMonthName(entry.key), entry.value));
    }

    setState(() {
      chartDatas = updatedData;
      isLoading = false;
    });
  }

  String _getMonthName(int month) {
    return DateFormat('MMM').format(DateTime(2023, month));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<ChartDatas, String>>[
                  LineSeries<ChartDatas, String>(
                    dataSource: chartDatas,
                    animationDuration: 0.0,
                    xValueMapper: (ChartDatas sales, _) => sales.month,
                    yValueMapper: (ChartDatas sales, _) => sales.value,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ChartDatas {
  final String month;
  final double value;

  ChartDatas(this.month, this.value);
}

class MonthlyBillerPerformanceBarChart extends StatefulWidget {
  final List<BillMaster> billMasters;

  const MonthlyBillerPerformanceBarChart({super.key, required this.billMasters});

  @override
  // ignore: library_private_types_in_public_api
  _MonthlyBillerPerformanceBarChartState createState() =>
      _MonthlyBillerPerformanceBarChartState();
}

class _MonthlyBillerPerformanceBarChartState
    extends State<MonthlyBillerPerformanceBarChart> {
  late Map<String, double> billerPerformance;

  @override
  void initState() {
    super.initState();
    calculateMonthlyBillerPerformance();
  }

  void calculateMonthlyBillerPerformance() {
    billerPerformance = {};

    final currentMonth = DateTime.now().month;

    for (var biller in widget.billMasters) {
      final billDate = DateTime.parse(biller.billDate);
      if (billDate.month == currentMonth) {
        if (billerPerformance.containsKey(biller.userName)) {
          billerPerformance[biller.userName] =
              (billerPerformance[biller.userName] ?? 0) +
                  biller.totalBillAmount;
        } else {
          billerPerformance[biller.userName] = biller.totalBillAmount;
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: billerPerformance.isEmpty
            ? const CircularProgressIndicator()
            : SfCartesianChart(
            
                primaryXAxis: CategoryAxis(),
                series: <ColumnSeries<ChartSampleDatas, String>>[
                  ColumnSeries<ChartSampleDatas, String>(
                    animationDuration: 0.0,
                    dataSource: billerPerformance.entries
                        .map(
                            (entry) => ChartSampleDatas(entry.key, entry.value))
                        .toList(),
                    xValueMapper: (ChartSampleDatas data, _) => data.username,
                    yValueMapper: (ChartSampleDatas data, _) => data.amount,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  
                  ),
                ],
              ),
      ),
    );
  }
}

class ChartSampleDatas {
  final String username;
  final double amount;

  ChartSampleDatas(this.username, this.amount);
}

class DashboardCharts extends StatelessWidget {
  final List<BillMaster> billMasters;
  final List<dynamic> savedBillMasters;

  const DashboardCharts({super.key, required this.billMasters, required this.savedBillMasters});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Sales Reports'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'DailySales'),
              Tab(text: 'MonthlySales'),
              Tab(text: 'Biller Performance'),
              Tab(text: 'Monthly Sales for biller'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WeeklyLineChart(savedBillMaster: savedBillMasters),
            MonthlyLineChart(savedBillMaster: savedBillMasters),
            BillerPerformancePieChart(billMasters: billMasters),
            MonthlyBillerPerformanceBarChart(billMasters: billMasters),
          ],
        ),
      ),
    );
  }
}
