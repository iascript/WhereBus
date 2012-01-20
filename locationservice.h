#ifndef LOCATIONSERVICE_H
#define LOCATIONSERVICE_H

#include <QObject>
#include <QPointer>
#include <QGeoPositionInfo>
#include <QGeoPositionInfoSource>

using namespace QtMobility;

class LocationService : public QObject
{
    Q_OBJECT
public:
    explicit LocationService(QObject *parent = 0);

    //Q_PROPERTY(bool updating READ updating W)

    Q_INVOKABLE void getMyPosition();

signals:
    void positionUpdated(qreal latitude, qreal longtitude);

public slots:
    void posUpdated(QGeoPositionInfo geoPositionInfo);

private:
    bool _updating;
    bool updating();
    QPointer<QGeoPositionInfoSource> locationDataSource;
    QGeoPositionInfo myPositionInfo;
};

#endif // LOCATIONSERVICE_H
