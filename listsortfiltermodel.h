#ifndef LISTSORTFILTERMODEL_H
#define LISTSORTFILTERMODEL_H

#include <QSortFilterProxyModel>

class ListSortFilterModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    explicit ListSortFilterModel(QObject *parent = 0);

protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const;

signals:

public slots:

};

#endif // LISTSORTFILTERMODEL_H
