import QtQuick
import QtQuick.Controls

Item {
    id: mangaRoot
    anchors.fill: parent

    property var pages: [] 

    ListView {
        id: pageList
        anchors.fill: parent
        model: mangaRoot.pages
        orientation: ListView.Vertical
        spacing: 0
        clip: true
        boundsBehavior: Flickable.StopAtBounds

        delegate: Image {
            width: pageList.width
            fillMode: Image.PreserveAspectFit
            source: modelData
            asynchronous: true
            cache: true
            sourceSize.width: pageList.width 
        }

        ScrollBar.vertical: ScrollBar {
            active: pageList.moving
        }
    }
}
