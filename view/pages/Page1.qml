import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components"

Item {
    width: 1280
    height: 720

    RowLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        Frame {
            Layout.preferredWidth: 780
            Layout.alignment: Qt.AlignTop
            padding: 24
            background: Rectangle { color: "transparent"; border.color: "transparent" }

            ColumnLayout {
                spacing: 24

                ColumnLayout {
                    spacing: 12

                    Text {
                        text: "Create Order"
                        font.pixelSize: 28
                        
                        font.family: "Roboto"
                        
                        color: "#1A202C"
                        Layout.leftMargin: 4
                    }

                    Text {
                        text: "Choose and add recipes to the order here"
                        font.pixelSize: 18
                        
                        font.family: "Roboto"

                        color: "#1A202C"
                        Layout.leftMargin: 4
                    }
                }

                ScrollView {
                    
                    Layout.preferredHeight: 494
                    Layout.fillWidth: true
                    clip: true

                    GridLayout {
                        id: grid
                        columns: 3
                        rowSpacing: 16
                        columnSpacing: 16
                        Layout.fillWidth: true

                        CocktailCard {
                            status: "active"
                            recipeName: "Whiskey Sour"
                            ingredients: "Whiskey, Lemon Juice, Sugar Syrup"
                            mixers: "Ice"
                        }
                        CocktailCard {
                            status: "active"
                            recipeName: "Margarita"
                            ingredients: "Tequila, Triple Sec, Lime Juice"
                            mixers: "Salt Rim"
                        }
                        CocktailCard {
                            status: "disabled"
                            recipeName: "Cosmopolitan"
                            ingredients: "Vodka, Triple Sec, Cranberry Juice"
                            mixers: "Lime Wedge"
                        }
                        CocktailCard {
                            status: "active"
                            recipeName: "Negroni"
                            ingredients: "Gin, Campari, Vermouth Rosso"
                            mixers: "Orange Slice"
                        }
                        CocktailCard {
                            status: "error"
                            recipeName: "Espresso Martini"
                            ingredients: "Vodka, Espresso, Coffee Liqueur"
                            mixers: "Coffee Beans"
                        }
                        CocktailCard {
                            status: "active"
                            recipeName: "Mojito"
                            ingredients: "White Rum, Lime Juice, Sugar"
                            mixers: "Soda Water, Mint Leaves"
                        }
                    }
                }
            }
        }

        // 🧾 Right overview sidebar
        Rectangle {
            Layout.preferredWidth: 250
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            color: "#F5F5F7"
            radius: 8
            border.color: "#D9D9E0"
        }
    }
}