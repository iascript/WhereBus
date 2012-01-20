#include <QtGui/QApplication>
#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"
#include "listsortfiltermodel.h"
#include "locationservice.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<ListSortFilterModel>("ListProxy", 1, 0, "ListProxyModel");
    qmlRegisterType<LocationService>("Location", 1, 0, "LocationService");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer.setMainQmlFile(QLatin1String("qml/WhereBus/main.qml"));
    viewer.showFullScreen();

    return app.exec();
}
