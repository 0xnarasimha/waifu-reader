import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    anchors.fill: parent

    property string currentImageUrl: ""
    property string category: "sfw/waifu"

    function fetchWaifu() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "https://api.waifu.pics/" + category);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                root.currentImageUrl = response.url;
            }
        };
        xhr.send();
    }

    Component.onCompleted: fetchWaifu()

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 12
            color: "#1e1e2e"
            clip: true

            Image {
                id: waifuImage
                anchors.fill: parent
                source: root.currentImageUrl
                fillMode: Image.PreserveAspectFit
                asynchronous: true
                cache: true

                BusyIndicator {
                    anchors.centerIn: parent
                    running: waifuImage.status === Image.Loading
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Button {
                text: "Refresh / Next"
                Layout.fillWidth: true
                onClicked: root.fetchWaifu()
            }
        }
    }
}
