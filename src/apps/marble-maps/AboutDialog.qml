//
// This file is part of the Marble Virtual Globe.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2016      Dennis Nienhüser <nienhueser@kde.org>
//

import QtQuick 2.3
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

import org.kde.marble 0.20

Item {
    id: root

    SystemPalette {
        id: palette
        colorGroup: SystemPalette.Active
    }

    Rectangle {
        anchors.fill: parent
        color: palette.base
    }

    SwipeView {
        id: tabView
        currentIndex: pageIndicator.currentIndex
        anchors.fill: parent

        Item {
            Text {
                id: marbleText
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: marbleLogo.left
                anchors.margins: Screen.pixelDensity * 1
                anchors.leftMargin: Screen.pixelDensity * 2

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: qsTr("<h3>Marble Maps</h3><p>Find your way! Marble Maps brings the highly detailed OpenStreetMap to your mobile devices. It features a crisp, beautiful map with an intuitive user interface. It's open source, entirely based on free data and open standards and respects your privacy.</p>")
                onLinkActivated: Qt.openUrlExternally(link)
            }

            Image {
                id: marbleLogo
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: Screen.pixelDensity * 2

                fillMode: Image.PreserveAspectFit
                source: "qrc:/konqi/globe.png"
            }
        }
        Item {
            Text {
                id: groupText
                anchors.left: parent.left
                anchors.right: groupKonqi.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: Screen.pixelDensity * 1
                anchors.leftMargin: Screen.pixelDensity * 2

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: qsTr("<h3>Support</h3><p>Do you have a question? Want to file a suggestion for improvement? Please use the <a href=\"https://forum.kde.org/viewforum.php?f=217\">Marble forum</a> to get in touch with fellow Marble users and developers. Further support channels are listed at <a href=\"https://marble.kde.org/support.php\">marble.kde.org</a>. We are looking forward to your feedback!</p>")
                onLinkActivated: Qt.openUrlExternally(link)
            }

            Image {
                id: groupKonqi
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: Screen.pixelDensity * 3
                anchors.bottomMargin: Screen.pixelDensity * 3
                anchors.rightMargin: Screen.pixelDensity * 2

                fillMode: Image.PreserveAspectFit
                source: "qrc:/konqi/group.png"
            }
        }
        Item {
            Text {
                id: devText
                anchors.left: parent.left
                anchors.right: devKonqi.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: Screen.pixelDensity * 1
                anchors.leftMargin: Screen.pixelDensity * 2

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: qsTr("<h3>Development Team</h3><p>More than 200 developers have already contributed to Marble. The main developers of this app are Dennis Nienhüser, Torsten Rahn, Sanjiban Bairagya, Friedrich W. H. Kossebau, Gábor Péterffy and Mikhail Ivchenko. Contact us via <a href=\"https://mail.kde.org/mailman/listinfo/marble-devel\">marble-devel@kde.org</a>.</p>")
                onLinkActivated: Qt.openUrlExternally(link)
            }

            Image {
                id: devKonqi
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: Screen.pixelDensity * 3
                anchors.bottomMargin: Screen.pixelDensity * 3
                anchors.rightMargin: Screen.pixelDensity * 2

                fillMode: Image.PreserveAspectFit
                source: "qrc:/konqi/app-dev.png"
            }
        }
        Item {

            Text {
                id: attributionText
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: devQtKonqi.left
                anchors.bottom: parent.bottom
                anchors.margins: Screen.pixelDensity * 1
                anchors.leftMargin: Screen.pixelDensity * 2

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                width: parent.width
                text: qsTr("<h3>Attribution</h3><p>The map uses public domain data from the <a href=\"http://www.naturalearthdata.com/\">Natural Earth</a> project. Additionally data from the <a href=\"https://www.openstreetmap.org\">OpenStreetMap</a> project is used, available under the <a href=\"http://opendatacommons.org/licenses/odbl/\">Open Database License</a>. The map style is influenced by and uses icons from <a href=\"https://github.com/gravitystorm/openstreetmap-carto\">OpenStreetMap Carto</a> (<a href=\"http://creativecommons.org/publicdomain/zero/1.0/\">CC0 Public Domain)</a>.</p>")
                onLinkActivated: Qt.openUrlExternally(link)
            }

            Image {
                id: devQtKonqi
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: Screen.pixelDensity * 3
                anchors.bottomMargin: Screen.pixelDensity * 3
                anchors.rightMargin: Screen.pixelDensity * 2
                fillMode: Image.PreserveAspectFit
                source: "qrc:/konqi/dev-qt.png"
            }
        }
    }

    PageIndicator {
        id: pageIndicator
        interactive: true
        count: tabView.count
        currentIndex: tabView.currentIndex

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
