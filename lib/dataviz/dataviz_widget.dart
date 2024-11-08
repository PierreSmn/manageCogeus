import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'dataviz_model.dart';
export 'dataviz_model.dart';

class DatavizWidget extends StatefulWidget {
  const DatavizWidget({super.key});

  @override
  State<DatavizWidget> createState() => _DatavizWidgetState();
}

class _DatavizWidgetState extends State<DatavizWidget> {
  late DatavizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatavizModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'dataviz',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowWebView(
                    content:
                        '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Bar Chart Demo</title>\n    <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\n    <style>\n        body {\n            font-family: Arial, sans-serif;\n            display: flex;\n            justify-content: center;\n            align-items: center;\n            height: 100vh;\n            margin: 0;\n        }\n        #chart-container {\n            width: 80%;\n            max-width: 600px;\n        }\n    </style>\n</head>\n<body>\n    <div id=\"chart-container\">\n        <canvas id=\"myBarChart\"></canvas>\n    </div>\n\n    <script>\n        document.addEventListener(\'DOMContentLoaded\', function () {\n            const data = {\n                labels: [\'Sunny\', \'Snowy\', \'Cloudy\', \'Rainy\', \'Foggy\'],\n                datasets: [{\n                    label: \'Classmates\',\n                    data: [10, 5, 4, 2, 1],\n                    backgroundColor: \'rgba(75, 192, 192, 0.2)\',\n                    borderColor: \'rgba(75, 192, 192, 1)\',\n                    borderWidth: 1\n                }]\n            };\n\n            const config = {\n                type: \'bar\',\n                data: data,\n                options: {\n                    scales: {\n                        y: {\n                            beginAtZero: true\n                        }\n                    }\n                }\n            };\n\n            new Chart(document.getElementById(\'myBarChart\'), config);\n        });\n    </script>\n</body>\n</html>\n',
                    height: 500.0,
                    verticalScroll: false,
                    horizontalScroll: false,
                    html: true,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
