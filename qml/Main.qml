import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.8
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.12

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    NavigationStack {
        Page {
            id: page
            width: 60
            height: -44
            title: qsTr("Vidoe Tool")

            FileDialog {
                id: fileDialog
                title: "Please choose a file"
                folder: shortcuts.home
                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrls)
                    //Qt.quit()
                }
                onRejected: {
                    console.log("Canceled")
                    Qt.quit()
                }
                //Component.onCompleted: visible = true
            }


            MediaPlayer {
                    id: player
                    source: fileDialog.fileUrl
                    autoPlay: false
                  }

                Column {
                    spacing: dp(20)
                    anchors.centerIn: parent

                    VideoOutput {
                      id: videoOutput
                      source: player
                      width: page.width
                      fillMode: VideoOutput.PreserveAspectFit
                    }

                    Row {
                      anchors.horizontalCenter: parent.horizontalCenter

                      AppButton{
                          //anchors.horizontalCenter: parent.horizontalCenter
                          text: "Select file"
                          onClicked: {
                            fileDialog.open()
                          }
                      }

                      AppButton {
                        text: "Play"
                        flat: false
                        onClicked: {
                          player.play()
                        }
                      }

                      AppButton {
                        text: "Pause"
                        flat: false
                        onClicked: {
                          player.pause()
                        }
                      }

                      AppButton {
                        text: "Stop"
                        flat: false
                        onClicked: {
                          player.stop()
                        }
                      }

                    }
                  }
            }
        }





/*
            MediaPlayer {
              id: mediaplayer
              autoPlay: false
              loops: MediaPlayer.Infinite
              source: fileDialog.fileUrl

            }

            VideoOutput {
              anchors.fill: parent
              source: mediaplayer
            }

            AlphaVideo{
                id: aphvid
                anchors.fill: parent
                source: mediaplayer
            }
            */
/*
            Column{
                anchors.centerIn: parent

                Video {
                    id: video
                    width : 800
                    height : 600
                    source: fileDialog.fileUrl

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            video.play()
                        }
                    }

                    focus: true
                    Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
                    Keys.onLeftPressed: video.seek(video.position - 5000)
                    Keys.onRightPressed: video.seek(video.position + 5000)
                }

                AppButton{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Select file"
                    onClicked: {
                      fileDialog.open()
                    }
                }
                AppButton{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Play"
                    onClicked: {
                      video.play()
                    }
                }
                AppButton{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Pause"
                    onClicked: {
                      video.pause()
                    }
                }
            }
        }
        */
        /*
        Page {
               title: "Audio"

               Column {
                 anchors.centerIn: parent
                 AppButton {
                   anchors.horizontalCenter: parent.horizontalCenter
                   text: "Play Audio"
                   onClicked: {
                     audio.play()
                   }
                 }
               }

               Audio {
                 id: audio
                 //source: "https://felgo.com/web-assets/beep.mp3"
                 source: "/home/ms/Music/0/0.mp3"
               }
          }

        */

/*
        Page {
          title: "Video" // Is displayed in the title bar

          MediaPlayer {
            id: mediaplayer
            autoPlay: true
            loops: MediaPlayer.Infinite
            source: "/home/ms/Videos/shrfi/ali.mp4"
          }

          VideoOutput {
            anchors.fill: parent
            source: mediaplayer
          }
        }
*/
/*
        FileDialog {
            id: fileDialog
            title: "Please choose a file"
            folder: shortcuts.home
            onAccepted: {
                console.log("You chose: " + fileDialog.fileUrls)
                Qt.quit()
            }
            onRejected: {
                console.log("Canceled")
                Qt.quit()
            }
            Component.onCompleted: visible = true
        }
        }
        }
*/
}
