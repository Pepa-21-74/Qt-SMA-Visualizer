#ifndef SMAGENERATOR_H
#define SMAGENERATOR_H

#include <QList>
#include <QObject>
#include <QPointF>

class SMAgenerator : public QObject {
    Q_OBJECT
public:
    explicit SMAgenerator(QObject *parent = nullptr);

    Q_INVOKABLE void processSMA(int count, int windowsize);
    Q_INVOKABLE QList<QPointF> getRawPoints();
    Q_INVOKABLE QList<QPointF> getSmaPoints();

private:
    QList<QPointF> m_rawPoints;
    QList<QPointF> m_smaPoints;
};

#endif // SMAGENERATOR_H
