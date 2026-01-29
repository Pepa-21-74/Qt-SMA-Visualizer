#include <QApplication>
#include <QQmlApplicationEngine>
#include "SMAgenerator.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<SMAgenerator>("SmaLogic", 1, 0, "SMAgenerator");

    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule(QString("SMAA"), QString("Main"));

    return app.exec();
}
