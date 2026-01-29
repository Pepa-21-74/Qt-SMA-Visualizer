import QtQuick
import SmaLogic 1.0
import QtCharts
import QtQuick.Controls 2.15

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("SMA Project")

    SMAgenerator {
        id: mySma
    }

    Column {
        anchors.fill: parent
        spacing: 10

        ChartView {
            id: chartView
            width: parent.width
            height: parent.height - 60
            antialiasing: true

            // 1. ВКЛЮЧАЕМ СИНЮЮ ТЕМУ
            theme: ChartView.ChartThemeBlueCerulean

            // 2. НАСТРАИВАЕМ ОСИ (чтобы видеть данные около 100)
            ValueAxis {
                id: axisX
                min: 0
                max: 100
            }
            ValueAxis {
                id: axisY
                min: -100   // Нижняя граница
                max: 100 // Верхняя граница (цена гуляет около 100)
            }

            LineSeries {
                id: rawSeries
                name: "Random Data"
                // Привязываем оси к сериям
                axisX: axisX
                axisY: axisY
                color: "lightgray"
                width: 2
            }

            LineSeries {
                id: smaSeries
                name: "SMA Line"
                axisX: axisX
                axisY: axisY
                color: "red"
                width: 3
            }
        }

        Button {
            id: control
            text: "Generate & Calculate SMA"
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: 200
            implicitHeight: 50

            contentItem: Text {
                text: control.text
                font.pixelSize: 14
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                color: control.pressed ? "#154a7a" : "red"
                radius: 10
                border.color: "black"
                border.width: 2
            }

            onClicked: {
                // Генерация
                mySma.processSMA(100, 10);

                // Получение данных
                var rawData = mySma.getRawPoints();
                var smaData = mySma.getSmaPoints();

                // Отрисовка
                rawSeries.clear();
                for (var i = 0; i < rawData.length; i++) {
                    rawSeries.append(rawData[i].x, rawData[i].y);
                }

                smaSeries.clear();
                for (var j = 0; j < smaData.length; j++) {
                    smaSeries.append(smaData[j].x, smaData[j].y);
                }
            }
        }
    }
}
