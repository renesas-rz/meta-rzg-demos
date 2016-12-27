import QtQuick 2.1
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0

Window {
    id: mainwin
    visible: true
    visibility: Window.FullScreen 
    color: "black"

    property var margin_w: Screen.width / 10
    property var margin_h: Screen.height / 10
    property var str: "/home/root/start.sh"


    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, mainwin.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "black" }
        }
    }

    Grid {
           columns: 6
	   id: grid
           width: parent.width - mainwin.margin_w * 2
           height: parent.height - mainwin.margin_h * 4 - 128 /*exit button*/
           anchors.horizontalCenter: parent.hrizontalcenter
           flow: Grid.LeftToRight
           anchors.top: parent.top
	   anchors.left: parent.left
           anchors.topMargin: mainwin.margin_h
	   anchors.bottomMargin: mainwin.margin_h
	   anchors.leftMargin: mainwin.margin_w
	   anchors.rightMargin: mainwin.margin_w
           columnSpacing: mainwin.margin_w
           rowSpacing: mainwin.margin_h

      Item {
        Rectangle {
          border.width: 4  
            id: rec_qt_cinematic
            Image {
              id: qt_cinematic
              x: parent.border.width
              y: parent.border.width
              source: "/usr/share/pixmaps/Qt5_CinematicExperience.png"
              MouseArea {
              anchors.fill: parent
              onClicked: {
                  console.log("/usr/share/cinematicexperience-1.0/ Qt5_CinematicExperience")
                  scriptLauncher.launchScript(mainwin.str, "/usr/share/cinematicexperience-1.0/ ./Qt5_CinematicExperience --fullscreen &")
                }
              }
            }
        radius: 8
          border.color: "yellow"
          width: qt_cinematic.width+2*border.width
          height: qt_cinematic.height+2*border.width
          color: "transparent"
        }
        Text{id: text_qt_cinematic; height:15; color: "yellow"; text: "         QT Demo\nCinematicExperience"; anchors.top: rec_qt_cinematic.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_qt_cinematic.horizontalCenter}
        width: {rec_qt_cinematic.width > text_qt_cinematic.width ? rec_qt_cinematic.width : text_qt_cinematic.width}
        height: {rec_qt_cinematic.height + text_qt_cinematic.height}
      }

      Item {
        Rectangle {
          border.width: 4
            id: rec_qt_everywhere
            Image {
              id: qt_everywhere
              x: parent.border.width
              y: parent.border.width
              source: "/usr/share/pixmaps/Qt5everywheredemo.png"
              MouseArea {
              anchors.fill: parent
              onClicked: {
                  console.log("/usr/share/qt5everywheredemo-1.0/ QtDemo")
                  scriptLauncher.launchScript(mainwin.str, "/usr/share/qt5everywheredemo-1.0/ ./QtDemo  &")
                }
              }
            }
        radius: 8
          border.color: "yellow"
          width: qt_everywhere.width+2*border.width
          height: qt_everywhere.height+2*border.width
          color: "transparent"
        }
        Text{id: text_qt_everywhere; height:15; color: "yellow"; text: "QtEverywhere"; anchors.top: rec_qt_everywhere.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_qt_everywhere.horizontalCenter}
        width: {rec_qt_everywhere.width > text_qt_everywhere.width ? rec_qt_everywhere.width : text_qt_everywhere.width}
        height: {rec_qt_everywhere.height + text_qt_everywhere.height}
      }

      Item {
        Rectangle {
          border.width: 4
            id: rec_qt_launch
            Image {
              id: qt_launch
              x: parent.border.width
              y: parent.border.width
              source: "/usr/share/pixmaps/Qt5_Launch_Demo.png"
              MouseArea {
              anchors.fill: parent
              onClicked: {
                  console.log("/usr/share/qt5-launch-demo/ main.qml")
                  scriptLauncher.launchScript(mainwin.str, "/usr/share/qt5-launch-demo/ /usr/bin/qt5/qmlscene main.qml &")
                }
              }
            }
        radius: 8
          border.color: "yellow"
          width: qt_launch.width+2*border.width
          height: qt_launch.height+2*border.width
          color: "transparent"
        }
        Text{id: text_qt_launch; height:15; color: "yellow"; text: "Qt launch Demo"; anchors.top: rec_qt_launch.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_qt_launch.horizontalCenter}
        width: {rec_qt_launch.width > text_qt_launch.width ? rec_qt_launch.width : text_qt_launch.width}
        height: {rec_qt_launch.height + text_qt_launch.height}
      }

      Item {
        Rectangle {
          border.width: 4
            id: rec_qmlvideo
            Image {
              id: qt_qmlvideo
              x: parent.border.width
              y: parent.border.width
              source: "/usr/share/pixmaps/qmlvideo.png"
              MouseArea {
              anchors.fill: parent
              onClicked: {
                  console.log("/usr/share/qt5/examples/multimedia/video/qmlvideo/ qmlvideo")
                  scriptLauncher.launchScript(mainwin.str, "/home/root/ ./qmlvideo.sh &")
                }
              }
            }
        radius: 8
          border.color: "yellow"
          width: qt_qmlvideo.width+2*border.width
          height: qt_qmlvideo.height+2*border.width
          color: "transparent"
        }
        Text{id: text_qmlvideo; height:15; color: "yellow"; text: "Qmlvideo Demo"; anchors.top: rec_qmlvideo.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_qmlvideo.horizontalCenter}
        width: {rec_qmlvideo.width > text_qmlvideo.width ? rec_qmlvideo.width : text_qmlvideo.width}
        height: {rec_qmlvideo.height + text_qmlvideo.height}
      }

      Item {
        Rectangle {
          border.width: 4
            id: rec_qmlvideofx
            Image {
              id: qt_qmlvideofx
              x: parent.border.width
              y: parent.border.width
              source: "/usr/share/pixmaps/qmlvideofx.png"
              MouseArea {
              anchors.fill: parent
              onClicked: {
                  console.log("/usr/share/qt5/examples/multimedia/video/qmlvideofx/ qmlvideofx")
                  scriptLauncher.launchScript(mainwin.str, "/usr/share/qt5/examples/multimedia/video/qmlvideofx/ ./qmlvideofx &")
                }
              }
            }
        radius: 8
          border.color: "yellow"
          width: qt_qmlvideofx.width+2*border.width
          height: qt_qmlvideofx.height+2*border.width
          color: "transparent"
        }
        Text{id: text_qmlvideofx; height:15; color: "yellow"; text: "Qmlvideofx Demo"; anchors.top: rec_qmlvideofx.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_qmlvideofx.horizontalCenter}
        width: {rec_qmlvideofx.width > text_qmlvideofx.width ? rec_qmlvideofx.width : text_qmlvideofx.width}
        height: {rec_qmlvideofx.height + text_qmlvideofx.height}
      }

       Item{
	   Rectangle {
           border.width: 4  
           id: rec_help
	   Image{
	       id: help
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/help.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/usr/share/qt5/examples/webkitwidgets/browser/start.sh")
                      scriptLauncher.launchScript(mainwin.str, "/usr/share/qt5/examples/webkitwidgets/browser/ ./browser  /home/root/start.html")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: help.width+2*border.width
           height: help.height+2*border.width
           color: "transparent"
	   }
       Text{id: text_help; height:15; color: "yellow"; text: "Help"; anchors.top: rec_help.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_help.horizontalCenter}
       width: {rec_help.width > text_help.width ? rec_help.width : text_help.width}
       height: {rec_help.height + text_help.height}
       }



       }
           




	Rectangle {
        border.width: 4 
	anchors.bottom: parent.bottom 
	anchors.right: parent.right
        anchors.topMargin: mainwin.margin_h
	anchors.bottomMargin: mainwin.margin_h
	anchors.leftMargin: mainwin.margin_w
	anchors.rightMargin: mainwin.margin_w
	Image{
	    id: exit
            x: parent.border.width
            y: parent.border.width
            source: "/usr/share/pixmaps/exit.png"
            MouseArea {
               anchors.fill: parent
               onClicked: {
		   mainwin.close();
                }
            }
        }
	radius: 8
        border.color: "yellow"
        width: exit.width+2*border.width
        height: exit.height+2*border.width
        color: "transparent"
	}	   


}
