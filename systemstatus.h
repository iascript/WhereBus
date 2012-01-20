#ifndef SYSTEMSTATUS_H
#define SYSTEMSTATUS_H

#include <QObject>
#include <QSystemInfo>

using namespace QtMobility;

class SystemStatus : public QObject
{
    Q_OBJECT
public:
    explicit SystemStatus(QObject *parent = 0);

    Q_INVOKABLE void batteryLevel();
signals:

public slots:

};

#endif // SYSTEMSTATUS_H
