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
           
	   Item{
	   Rectangle {
           border.width: 4
           id: rec_battery  
	   Image{
	       id: battery
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/quitbattery_128.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/usr/share/quitbattery-1.0.0/start.sh")
                      scriptLauncher.launchScript(mainwin.str,"/usr/share/quitbattery-1.0.0 ./QUItBattery &")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: battery.width+2*border.width
           height: battery.height+2*border.width
           color: "transparent"
	   }
       Text{id: text_battery; height:15; color: "yellow"; text: "QT Demo"; anchors.top: rec_battery.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_battery.horizontalCenter}
       width: {rec_battery.width > text_battery.width ? rec_battery.width : text_battery.width}
       height: {rec_battery.height + text_battery.height}
	   
       }
	   
	   
       Item{
       Rectangle {
            border.width: 4
            id: rec_touch
	   Image{
	       id: touch
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/touch-icon.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/usr/share/qt5/examples/touch/fingerpaint/start.sh")
                      scriptLauncher.launchScript(mainwin.str,"/usr/share/qt5/examples/touch/fingerpaint/ ./fingerpaint &")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: touch.width+2*border.width
           height: touch.height+2*border.width
           color: "transparent"
	   }
       Text{id: text_touch; height:15; color: "yellow"; text: "Touch Demo"; anchors.top: rec_touch.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_touch.horizontalCenter}
       width: {rec_touch.width > text_touch.width ? rec_touch.width : text_touch.width}
       height: {rec_touch.height + text_touch.height}
       }


       Item{
	   Rectangle {
           border.width: 4
           id: rec_camera
	   Image{
	       id: camera
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/Camera.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/home/root/start.sh")
                      scriptLauncher.launchScript(mainwin.str, "/home/root/oglcamdemo ./oglcamdemo & -d /dev/video0")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: camera.width+2*border.width
           height: camera.height+2*border.width
           color: "transparent"
       }
       Text{id: text_camera; height:15; color: "yellow"; text: "Camera Demo"; anchors.top: rec_camera.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_camera.horizontalCenter}
       width: {rec_camera.width > text_camera.width ? rec_camera.width : text_camera.width}
       height: {rec_camera.height + text_camera.height}
       }


       Item{
	   Rectangle {
           border.width: 4  
           id: rec_helloegl
	   Image{
	       id: helloegl
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/3d.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("3d")
                      scriptLauncher.launchScript(mainwin.str, "/usr/share/qt5/examples/qt3d/anaglyph-rendering/ ./anaglyph-rendering &")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: helloegl.width+2*border.width
           height: helloegl.height+2*border.width
           color: "transparent"
       }
       Text{id: text_helloegl; height:15; color: "yellow"; text: "EGL Demo"; anchors.top: rec_helloegl.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_helloegl.horizontalCenter}
       width: {rec_helloegl.width > text_helloegl.width ? rec_helloegl.width : text_helloegl.width}
       height: {rec_helloegl.height + text_helloegl.height}
       }


       Item{
	   Rectangle {
           border.width: 4
           id: rec_browser
	   Image{
	       id: browser
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/Browser.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/usr/share/qt5/examples/webkitwidgets/browser/start.sh")
                      scriptLauncher.launchScript(mainwin.str, "/usr/share/qt5/examples/webkitwidgets/browser/ ./browser www.renesas.com")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: browser.width+2*border.width
           height: browser.height+2*border.width
           color: "transparent"
	   }
       Text{id: text_browser; height:15; color: "yellow"; text: "Internet Demo"; anchors.top: rec_browser.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_browser.horizontalCenter}
       width: {rec_browser.width > text_browser.width ? rec_browser.width : text_browser.width}
       height: {rec_browser.height + text_browser.height}
       }


       Item{
	   Rectangle {
           border.width: 4  
           id: rec_opencv
	   Image{
	       id: opencv
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/OpenCV.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/home/root/data/opencv.sh")
                      scriptLauncher.launchScript(mainwin.str, "/home/root/data/ delaunay &")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: opencv.width+2*border.width
           height: opencv.height+2*border.width
           color: "transparent"
	   }
       Text{id: text_opencv; height:15; color: "yellow"; text: "OpenCV Demo"; anchors.top: rec_opencv.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_opencv.horizontalCenter}
       width: {rec_opencv.width > text_opencv.width ? rec_opencv.width : text_opencv.width}
       height: {rec_opencv.height + text_opencv.height}
       }

      Item{
	   Rectangle {
           border.width: 4  
           id: rec_opencv_cam
	   Image{
	       id: opencv_cam
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/OpenCV_cam.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
			console.log("/home/root/data/opencv_cam.sh")
                      scriptLauncher.launchScript(mainwin.str, "/home/root/data/ facedetect --cascade=/usr/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml")
                   }
               }
           }
	   radius: 8
           border.color: "yellow"
           width: opencv_cam.width+2*border.width
           height: opencv_cam.height+2*border.width
           color: "transparent"
	   }
       Text{id: text_opencv_cam; height:15; color: "yellow"; text: "OpenCV Demo"; anchors.top: rec_opencv_cam.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_opencv_cam.horizontalCenter}
       width: {rec_opencv_cam.width > text_opencv_cam.width ? rec_opencv_cam.width : text_opencv_cam.width}
       height: {rec_opencv_cam.height + text_opencv_cam.height}
       }

       Item{
       Rectangle {
           border.width: 4
           id: rec_media
       Image{
           id: media
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/multimedia.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
            console.log("/home/root/avbplayer/player.sh")
                      scriptLauncher.launchScript(mainwin.str, "/home/root/avbplayer/ ./media-player ./test_video.mp4 &")
                   }
               }
           }
       radius: 8
           border.color: "yellow"
           width: media.width+2*border.width
           height: media.height+2*border.width
           color: "transparent"
       }
       Text{id: text_media; height:15; color: "yellow"; text: "Media Demo"; anchors.top: rec_media.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_media.horizontalCenter}
       width: {rec_media.width > text_media.width ? rec_media.width : text_media.width}
       height: {rec_media.height + text_media.height}
       }



       Item{
       Rectangle {
           border.width: 4
           id: rec_mic
       Image{
           id: mic
               x: parent.border.width
               y: parent.border.width
               source: "/usr/share/pixmaps/microphone.png"
               MouseArea {
                  anchors.fill: parent
                  onClicked: {
                      console.log("/home/root/recorder/recorder.sh")
                      scriptLauncher.launchScript(mainwin.str, "/home/root/recorder ./recorder &")
                   }
               }
           }
       radius: 8
           border.color: "yellow"
           width: mic.width+2*border.width
           height: mic.height+2*border.width
           color: "transparent"
       }
       Text{id: text_mic; height:15; color: "yellow"; text: "Microphone Demo"; anchors.top: rec_mic.bottom; font.pixelSize: 26; anchors.horizontalCenter: rec_mic.horizontalCenter}
       width: {rec_mic.width > text_mic.width ? rec_mic.width : text_mic.width}
       height: {rec_mic.height + text_mic.height}
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
