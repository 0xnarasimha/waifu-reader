import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 390
    height: 844
    title: "Anime Drop"
    color: "#11111b"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        SwipeView {
            id: view
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: navBar.currentIndex

            WaifuView {}
            MangaReader {
                pages: [
                    "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=800",
                    "https://images.unsplash.com/photo-1534447677768-be436bb09401?w=800"
                ]
            }
        }

        TabBar {
            id: navBar
            Layout.fillWidth: true
            currentIndex: view.currentIndex

            TabButton { text: "Waifu Drop" }
            TabButton { text: "Manga" }
        }
    }
}
