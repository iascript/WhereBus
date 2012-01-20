#include "locationservice.h"

LocationService::LocationService(QObject *parent) :
    QObject(parent)
{
}

void LocationService::getMyPosition()
{
    if (!locationDataSource)
    {
        locationDataSource =
                QGeoPositionInfoSource::createDefaultSource(this);

        connect(locationDataSource, SIGNAL(positionUpdated(QGeoPositionInfo)),
                this, SLOT(posUpdated(QGeoPositionInfo)));

    }

    locationDataSource->startUpdates();
    _updating = true;
}

void LocationService::posUpdated(QtMobility::QGeoPositionInfo geoPositionInfo)
{
    if (geoPositionInfo.isValid())
    {
        locationDataSource->stopUpdates();

        myPositionInfo = geoPositionInfo;

        QGeoCoordinate geoCoordinate = geoPositionInfo.coordinate();

        emit positionUpdated(geoCoordinate.latitude(), geoCoordinate.longitude());
    }
    _updating = false;
}

bool LocationService::updating()
{
    return _updating;
}
