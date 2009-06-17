//
// This file is part of the Marble Desktop Globe.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2008 Torsten Rahn <tackat@kde.org>"
// Copyright 2008 Inge Wallin  <inge@lysator.liu.se>"
//


#ifndef MARBLE_RENDER_PLUGIN_H
#define MARBLE_RENDER_PLUGIN_H

#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/Qt>
#include <QtGui/QStandardItem>

#include "RenderPluginInterface.h"
#include "marble_export.h"


class QAction;
class QStandardItem;

namespace Marble
{

class RenderPluginPrivate;
class MarbleDataFacade;

/**
 * @short The abstract class that creates an "empty" float item.
 *
 */

class MARBLE_EXPORT RenderPlugin : public QObject, public RenderPluginInterface
{
    Q_OBJECT
    Q_INTERFACES( Marble::RenderPluginInterface )

 public:
    /**
     * This enum contains the data roles for the QStandardItem that is returned by item().
     */
    enum ItemDataRole {
        NameId = Qt::UserRole + 2,       // a QString
        AboutDialogAvailable,            // a bool
        ConfigurationDialogAvailable,    // a bool
        BackendTypes                     // a QStringList
    };

    RenderPlugin();
    virtual ~RenderPlugin();

    MarbleDataFacade* dataFacade() const;
    void  setDataFacade( MarbleDataFacade* );

    QAction       *action() const;
    QStandardItem *item()   const;

    void applyItemState();
    void retrieveItemState();

    bool    enabled() const;
    bool    visible() const;
    
    /**
     * Function for getting a pointer to the about dialog of the plugin.
     *
     * @return: The about dialog or, if no about dialog exists, 0.
     */
    virtual QDialog *aboutDialog() const;
    /**
     * Function for getting a pointer to the configuration dialog of the plugin.
     *
     * @return: The configuration dialog or, if no configuration dialog exists, 0.
     */
    virtual QDialog *configDialog() const;

 public Q_SLOTS:
    void    setEnabled( bool enabled );
    void    setVisible( bool visible );

 Q_SIGNALS:
    void    valueChanged( QString nameId, bool visible );
    
 protected:
    bool eventFilter( QObject *, QEvent * );

 private:
    Q_DISABLE_COPY( RenderPlugin )
    RenderPluginPrivate * const d;
};

#define MARBLE_PLUGIN(T) public:\
    virtual RenderPlugin* pluginInstance() { return new T(); };
}

#endif // MARBLE_RENDER_PLUGIN_H
