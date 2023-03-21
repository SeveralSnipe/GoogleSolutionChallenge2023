import React, { Component } from 'react';
import { View, SafeAreaView, Text, Image, StyleSheet, FlatList, TextInput, TouchableOpacity ,Animated, Easing } from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
import Cards from './Components/Card';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';


const Tab = createBottomTabNavigator();

const Gallery = (props) => {
    
    const styles = StyleSheet.create({

        container: {
            flexDirection: "column",
            width: 360,
            backgroundColor: "#350825",
            padding: 15,
            alignItems: "center"


        },
        topbar: {
            flexDirection: "row",
            width: "100%",
            justifyContent: "space-between",


        },
        topbarsub: {
            flexDirection: "row",
            alignItems: "center",

        },

        topbarx: {
            resizeMode: "contain",
            height: 45,
        },
        Iconbg: {
            height: 40,
            width: 40,
            borderRadius: 20,
            backgroundColor: "#5f0941",
            justifyContent: "center",
            alignItems: "center"
        },
        // topbar1: {
        //     position: "relative",
        //     left: 190,
        //     bottom: 5
        // },
        // topbar2: {
        //     height: 40,
        //     width: 40,
        //     position: "relative",
        //     left: 70,
        //     top: 20
        // },
        // topbar3: {
        //     position: "relative",
        //     right: 190,
        //     bottom: 5

        // },

        searchcontainer: {
            width: "100%",
            height: 45,
            borderRadius: 40,
            backgroundColor: "#5f0941",
            flexDirection: 'row',
            justifyContent: 'center',
            alignItems: 'center',
            marginVertical: 15,
        },
        thebar: {
            flex: 1,
            width: 340,
            borderRadius: 40,
            margin: 10,
            justifyContent: "center",
            alignItems: "center",
            padding: 0,

        },
        Gallery: {
            fontSize: 30,
            alignSelf: "flex-start",
            fontFamily: "Poppins",
            fontWeight: "bold",
            marginTop: 10
        },
        list: {
            // backgroundColor:"red",
            flex: 1,
            marginTop: 10,
            justifyContent: "center",
            alignContent: "center",
            alignItems: "center",
            position: "relative",

        },
        searchIcon: {
            marginLeft: 20
        },

    });
    const DATA = [
        {
            id: '1',
            card: <Cards
                title="Dance Monkey"
                date="12-01-22"
                source={require("../Gallery/ImagesGallery/Rectangle50.png")}
            />
        },
        {
            id: '2',
            card: <Cards

                title="Dance Monkey"
                date="12-01-22"
                source={require("../Gallery/ImagesGallery/Rectangle50.png")}
            />
        },
        {
            id: '3',
            card: <Cards
                title="Dance Monkey"
                date="12-01-22"
                source={require("../Gallery/ImagesGallery/Rectangle50.png")}
            />,
        },
        {
            id: '4',
            card: <Cards
                title="Dance Monkey"
                date="12-01-22"
                source={require("../Gallery/ImagesGallery/Rectangle50.png")}
            />,
        }
    ];
    const [searchText, setSearchText] = React.useState('');
    const renderItem = ({ item }) => (
        <Text>{item.card}</Text>
    );
    return (
        // <View style={styles.container}>
        <LinearGradient
            colors={["#350825", "#090005"]} //
            style={styles.container}
        >
            
            <View style={styles.topbar}>
                {/* <Example/> */}
                <View style={styles.Iconbg}>
                    <TouchableOpacity><Image style={styles.topbarx} source={require('./ImagesGallery/Back.png')}></Image></TouchableOpacity>
                </View>
                <View style={styles.topbarsub}>
                    <TouchableOpacity styles={{ marginHorizontal: 15 }}><Image style={styles.topbarx} source={require('./ImagesGallery/Bell.png')}></Image></TouchableOpacity>
                    <View style={styles.Iconbg}>
                        <TouchableOpacity><Image style={styles.topbarx} source={require('./ImagesGallery/UserIcon.png')}></Image></TouchableOpacity>
                    </View>
                </View>

            </View>

            <Text style={styles.Gallery}>Gallery</Text>


            <View style={styles.searchcontainer}>
                <Image style={styles.searchIcon} source={require('./ImagesGallery/Search.png')}></Image>
                <TextInput
                    placeholder='Search Gallery...'
                    style={styles.thebar}
                    value={searchText}
                    onChangeText={(val) => setSearchText(val)}
                />
            </View>
            
            {/* <View style={styles.list}> */}
            <FlatList
                style={styles.FlatList}
                data={DATA}
                renderItem={renderItem}
                keyExtractor={item => item.id}
                ItemSeparatorComponent={() => <View style={{ height: 20 }} />}
            />
            
            {/* </View> */}
            {/* If Bottom Navigator needed use Bnav here */}
        </LinearGradient>

    );
}

export default Gallery;