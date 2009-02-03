//
// This file is part of the Marble Desktop Globe.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2006-2007 Torsten Rahn <tackat@kde.org>"
// Copyright 2007      Inge Wallin  <ingwa@kde.org>"
//

//
// The Tiny Web Browser is a web browser based on QTextBrowser.
//
// Author: Torsten Rahn
//

#include <qglobal.h>

#ifndef TINYWEBBROWSER_H
#define TINYWEBBROWSER_H

// namespace Marble
// {

#if QT_VERSION < 0x040400

#include <QtCore/QString>
#include <QtCore/QVariant>
#include <QtGui/QTextBrowser>

class QUrl;
class HttpDownloadManager;
class CacheStoragePolicy;

class TinyWebBrowser : public QTextBrowser
{
        Q_OBJECT

    public:
        explicit TinyWebBrowser ( QWidget* parent = 0 );
        ~TinyWebBrowser();

    public Q_SLOTS:
        void setSource ( const QString& urlString );
        void print();

    Q_SIGNALS:
        void backwardAvailable ( bool );
        void statusMessage ( QString );

    protected:
        virtual QVariant loadResource ( int type, const QUrl & name );

    private Q_SLOTS:
        void slotDownloadFinished ( const QString&, const QString& );

        void linkClicked ( const QUrl &url );

    private:
        void setContentHtml ( const QString& );
        Q_DISABLE_COPY ( TinyWebBrowser )
        CacheStoragePolicy *m_storagePolicy;
        HttpDownloadManager *m_downloadManager;
        QString         m_source;
};

#else

#include <QtWebKit/QWebView>
#include <QtGui/QDesktopServices>

class TinyWebBrowser : public QWebView
{
    Q_OBJECT

 public:
    TinyWebBrowser( QWidget* parent = 0 );
    ~TinyWebBrowser();

 public Q_SLOTS:
    void setSource( const QString& relativeUrl );
    void print();

 Q_SIGNALS:
    void statusMessage( QString );

 private Q_SLOTS:
    void openExternalLink( QUrl );

 private:
    QString         m_source;
};
#endif

// }

#endif // TINYWEBBROWSER_H
