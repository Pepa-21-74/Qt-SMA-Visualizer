#include "SMAgenerator.h"
#include <QRandomGenerator>
#include <QDebug>

    SMAgenerator::SMAgenerator(QObject *parent) : QObject(parent) {}

    void SMAgenerator::processSMA(int count, int windowsize){
        m_rawPoints.clear();
        m_smaPoints.clear();

        double value = 0.0;
        for (int i = 0; i < count; i++){
            double noise = QRandomGenerator::global()->bounded(20.0) - 10;
            value += noise;
            m_rawPoints.append(QPointF(i, value));
        }

        if (count < windowsize) return;

        double currentSum = 0.0;
        for (int i = 0; i < windowsize; i++){
            currentSum += m_rawPoints[i].y();
        }

        m_smaPoints.append(QPointF(windowsize - 1, currentSum / windowsize));

        for (int i = windowsize; i < count; i++){

            currentSum += m_rawPoints[i].y();
            currentSum -= m_rawPoints[i-windowsize].y();

            m_smaPoints.append(QPointF(i, currentSum / windowsize));
        }
    }

QList<QPointF> SMAgenerator::getRawPoints() {
    return m_rawPoints;
}

 QList<QPointF> SMAgenerator::getSmaPoints() {
    return m_smaPoints;
 }
