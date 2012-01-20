#include "listsortfiltermodel.h"

ListSortFilterModel::ListSortFilterModel(QObject *parent) :
    QSortFilterProxyModel(parent)
{
    //this->setSourceModel();
}

bool ListSortFilterModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{

}
