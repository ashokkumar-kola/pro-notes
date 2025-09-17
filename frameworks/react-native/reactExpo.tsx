
// Create New React Native Expo Project

    // npx create-expo-app@latest my-app

// Run Project

    // npm start

    // npx expo startw
    // npx expo start --web
    // npx expo start --android
    // npx expo start --ios


// Reset Project

    // npm run reset-project

// INSTALL
//  npm install nativewind tailwindcss react-native-reanimated react-natve-safe-area-context

// npx tailwind css init



// COMPONENTS

    // Core Components / Built In Components
    // Native Components
    // Community Components 

    // Functional Components
    // Class Components


// Basic Components
    // View
    // Text
    // Image
    // TextInput
    // ScrollView
    // StyleSheet


// User Interface
    // Button
    // Switch


// List Views
    // FlatList
    // SectionList


// Android-specific
    // BackHandler
    // DrawerLayoutAndroid
    // PermissionAndroid
    // ToastAndroid


// iOS-specific
    // ActionSheetIOS


// Others
    // ActivityIndicator
    // Alert
    // Animated
    // Dimensions
    // KeyboardAvoidingView
    // Linking
    // Modal
    // PixelRatio
    // RefreshControl
    // StatusBar





    // graph TD
    // A[Component Renders] --> B{Is this the initial render?}
    // B -- Yes --> C[Initialize state with useState]
    // C --> D[Render UI with initial state]
    // D --> E[Run useEffect (if no dependencies or dependencies have changed)]
    // E --> F[Complete Render Cycle]
    // B -- No --> G{State updated via setState?}
    // G -- Yes --> H[Update state with new value]
    // H --> I[Re-render UI with updated state]
    // I --> J{Are dependencies in useEffect changed?}
    // J -- Yes --> K[Run useEffect with new dependencies]
    // K --> F
    // J -- No --> F
    // G -- No --> L{Props changed?}
    // L -- Yes --> I
    // L -- No --> F
    
    // style A fill:#f9f,stroke:#333,stroke-width:2px
    // style F fill:#ccf,stroke:#333,stroke-width:2px



// -------------------------------------------------------------------------- //

// IMPORTS

import {
    ActivityIndicator,
    Alert,
    Button,
    Dimensions,
    Image,
    ImageBackground,
    Modal,
    Platform,
    Pressable,
    SafeAreaView,
    StatusBar,
    StyleSheet,
    Text,
    View,
    useWindowDimensions,
} from "react-native";

 
import { useEffect, useState } from "react";



// MODAL

    // visible
    // transparent
    // animationType
    // onRequestClose
    // onDismiss
    // onShow
    // supportedOrientations
    // hardwareAccelerated
    // presentationStyle
    // statusBarTranslucent





// STATUS BAR

    // barStyle
    // backgroundColor
    // hidden
    // translucent
    // networkActivityIndicatorVisible
    // showHideTransition
    // animated
    // setNetworkActivityIndicatorVisible




// ACTIVITY INDICATOR




// ALERT




// STYLE SHEET




// DYNAMIC USER INTERFACE
    // app.js > orientation > default | portrait | landscape




// -------------------------------------------------------------------------- //

const logoImg = require("./assets/aaptive-icon.png")

export default function App() {
    return(
        // View : Default flex
        <View style={{ flex: 1, backgroundColor: "blue", padding: 60 }}>

        {/* TEXT */}
        <Text>Hello World!</Text>


        {/* IMAGE */}
        <Image source = {logoImg} style={{width: 300, height: 300}} />

        <Image source={require('./logo.png')} style={{ width: 100, height: 100 }} />

        <Image 
            source = {{ uri: "https://picsum.photos/300" }} 
            style={{width: 300, height: 300}} 
        />


        {/* IMAGE BACKGROUND */}
        <ImageBackground source={logoImg} style={{flex: 1}}>
            <Text>Image Text</Text>
        </ImageBackground>

        <Button 
            title="press" 
            onPress={() => console.log("Button Pressed") }
            color = "midnightblue"
            disabled
            // disabled={state} 
        />

    </View> 

    // <View style={{ flex: 1, backgroundColor: "blue", padding: 60>
    //     <ScrollView>
    //         <Text>Hello World!</Text>
    //         <Image source = {logoImg} style={{width: 300, height: 300}} />
    //     </ScrollView>
    // </View>
    );
}


// -------------------------------------------------------------------------- //



// Pressable
    // onPress
    // onLongPress
    // onPressIn
    // onPressOut
    // onPressChange

const PressableExample = () => {    
    return (
        <View>
            <Text>Pressable Example</Text>
            <Pressable onPress={() => console.log("Text Pressed")}> 
                <Text>Press Me</Text>
            </Pressable>
            <Pressable onPress={() => console.log("Image Pressed")}> 
                <Image
                    source={{ uri: "https://picsum.photos/300" }}
                    style={{ width: 300, height: 300 }}
                />
            </Pressable>
        </View>
    );
};

const ModalExample = () => {    
    const [modalVisible, setModalVisible] = useState(false);

    return (
        <View>
            <Button title="Show Modal" onPress={() => setModalVisible(true)} />
            <Modal
                animationType="slide" // fade slide none
                presentationStyle="overFullScreen" // (IOS) : fullScreen pageSheet formSheet overFullScreen
                transparent={true}
                visible={modalVisible}
                onRequestClose={() => setModalVisible(false)}
            >
                <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
                    <View style={{ width: 300, height: 300, backgroundColor: "white", borderRadius: 10 }}>
                        <Text>Modal Content</Text>
                        <Button title="Close Modal" onPress={() => setModalVisible(false)} />
                    </View>
                </View>
            </Modal>
        </View>
    );
}

const statusBarExample = () => {    
    return (
        <View>
            <StatusBar 
                barStyle="light-content"  // default light-content dark-content
                backgroundColor="blue"  // (Android)
                hidden          
            />
            <Text>Status Bar Example</Text>
        </View>
    );
};

const ActivityIndicatorExample = () => {
    return(
        <View
            style = {{ flex: 1, backgroundColor: 'plum', padding: 60 }}
        >
            <ActivityIndicator />
            <ActivityIndicator 
                size='large' // small large
                color='midnightblue'
                animating={false}
            /> 
        </View>
    );
};

const AlertExample = () => {
    return(
        <View style={{}}>
            <Button title='Alert' onPress={
                () => Alert.alert('Invalid Data', 'DOB Incorrect', 
                [
                    {
                        text: 'Cancel',
                        onPress: () => console.log('Cancel Pressed'),
                    },
                    {
                        text: 'OK',
                        onPress: () => console.log('OK Pressed'),
                    }
                ] 
            )} />
        </View>
    );
};

const stylesApp = () => {
    return(
        <View style={styles.container}>
        <Text style={styles.title}>Hello World!</Text>
        <View style={[styles.box, styles.blueBox]}>
            <Text>Box</Text>
        </View>
    </View>
    );
};

const styles = StyleSheet.create({
    container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      backgroundColor: '#f5f5f5',
    },
    title: {
      fontSize: 20,
      fontWeight: 'bold',
      color: 'blue',
    },
    box: {
        width: 100,
        height: 100,
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 10,
    },
    blueBox: {
        backgroundColor: 'blue',
    },
    padding: {
        // PADDING
        padding: 10,
        paddingHorizontal: 10,
        paddingVertical: 10,
    },
    margin: {
        // MARGIN
        margin: 10,
        marginHorizontal: 10,
        marginVertical: 10,
    },
    border: {
        // BORDER
        borderWidth: 1,
        borderColor: 'black',
        borderStyle: 'solid',
        borderRadius: 10, // ✅ (Android) : Text
    },
    shadow: { // IOS
        // SHADOW
        shadowColor: 'black', // ✅ (IOS) & (Android)
        shadowOffset: { width: 0, height: 2 },
        shadowOpacity: 0.8,
        shadowRadius: 2,
    },
    elevation: { // ANDROID
        // ELEVATION
        elevation: 5,
    },
    text: {
        // TEXT
        fontSize: 20,
        color: 'black',
        textAlign: 'center', // left center right justify
        textDecorationLine: 'underline', // none underline line-through
        textTransform: 'uppercase', // none uppercase lowercase capitalize
        textAlignVertical: 'center', // top center bottom
        textShadowColor: 'black',
        textShadowOffset: { width: 0, height: 2 },
        textShadowRadius: 2,
    },
    flex: {
        // FLEX
        flex: 0, // 0 - 1 | number
        flexDirection: 'column', // row column column-reverse row-reverse 
        justifyContent: 'flex-start', // flex-start flex-end center space-between space-around space-evenly
        alignItems: 'stretch', // flex-start flex-end center stretch baseline
        alignSelf: 'auto', // auto flex-start flex-end center baseline stretch
        flexWrap: 'nowrap', // wrap nowrap wrap-reverse
        alignContent: 'flex-start', // flex-start flex-end center stretch space-between space-around space-evenly
        flexBasis: 100, // number | string
        flexGrow: 0, // number
        flexShrink: 0, // number
    },
    gap: {
        rowGap: 10, 
        columnGap: 10, 
        gap: 10, 
    },
    position: {
        // POSITION
        position: 'absolute', // absolute relative fixed sticky
        top: 0,
        right: 0,
        bottom: 0,
        left: 0,
        zIndex: 1, // number
    },
    // INHERITENCE
        // ❌ View > Text
        // ✅ Text > Text 
    darkMode: {
        backgroundColor: 'black',
    },
    darkModeText: {
        color: 'white',
    },
    boldText: {
        fontWeight: 'bold',
    },
});



// -------------------------------------------------------------------------- //

// import { Dimensions } from 'react-native';

const { width: windowWidth, height: windowHeight } = Dimensions.get('window'); // screen window

const dynamicStyles = StyleSheet.create({
    container: {
        width: windowWidth > 500 ? "70%" : "90%",
        height: windowHeight > 600 ? "60%" : "90%",
        backgroundColor: 'blue',
    },
    text: {
        fontSize: windowWidth > 500 ? 20 : 16,
        color: 'white',
    },
});

const DynamicUserInterface = () => {
    return (
        <View style={dynamicStyles.container}>
            <Text style={dynamicStyles.text}>Dynamic User Interface</Text>
        </View>
    );
}
// Drawback: Need to restart app to apply styles to dynamic screen sizes




// -------------------------------------------------------------------------- //


// import { useState, useEffect } from "react";


const DynamicUserInterface2 = () => {
    
    const [windowDimensions, setWindowDimensions] = useState(Dimensions.get('window'));

    useEffect(() => {
        const subscription = Dimensions.addEventListener('change', ({ window }) => {
            setWindowDimensions(window);
        });

        return () => {
            subscription?.remove();
        };
    }, []);

    const { width, height } = windowDimensions;
    

    return(
        <View
            style={{
                width: width > 500 ? "70%" : "90%",
                height: height > 600 ? "60%" : "90%",
                backgroundColor: 'blue',
            }}
        >
            <Text style={{ fontSize: windowWidth > 500 ? 20 : 16 }}>Welcome!</Text>
        </View>
    )
}


// import { useWindowDimensions } from "react-native";

const SimpleDynamicUserInterface = () => {
    const { width: windowWidth, height: windowHeight } = useWindowDimensions();

    return(
        <View
            style={{
                width: windowWidth > 500 ? "70%" : "90%",
                height: windowHeight > 600 ? "60%" : "90%",
                backgroundColor: 'blue',
            }}
        >
            <Text style={{ fontSize: windowWidth > 500 ? 20 : 16 }}>Welcome!</Text>
        </View>
    )
}


// -------------------------------------------------------------------------- //



// SAFE AREA VIEW

// import { SafeAreaView } from "react-native";

const SafeAreaViewExample = () => {
    return(
        <SafeAreaView style={{ flex: 1, backgroundColor: 'blue' }}>
            <View>
                <Text>Safe Area View Example</Text>
            </View>
        </SafeAreaView>
    )
}



// -------------------------------------------------------------------------- //


// PLATFORM SPECIFIC CODE

// import { Platform } from "react-native";

const PlatformSpecificCodeExample = () => {
    if (Platform.OS === 'ios') {
        // iOS specific code
    } else if (Platform.OS === 'android') {
        // Android specific code
    } else {
        // Other platforms
    }
};

const PlatformSpecificCodeExample2 = () => {
    return (
        <View
            style={{ 
                flex: 1, 
                backgroundColor: 'blue', 
                padding: Platform.OS === 'android' ? 20 : 0, // ios
            }}
        >
            {Platform.select({
                ios: <Text>iOS</Text>,
                android: <Text>Android</Text>,
                default: <Text>Other</Text>,
            })}
        </View>
    );
}

const platformStylesSheet = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: Platform.select({
            ios: 'blue',
            android: 'green',
            default: 'red',
        }),
    },
    text: {
        fontSize: Platform.select({
            ios: 20,
            android: 16,
            default: 14,
        }),
    },
    textPlatform: {
        ...Platform.select({
            ios: {
                padding: 20,
            },
            android: {
                padding: 10,
            },
        })
    },
});

// Components
    // CustomButton
        // CustomButton.ios.js
        // CustomButton.android.js


const CustomButton = ({onPress, title}) => {
    return (
        <Pressable onPress={onPress}>
            <Text>{title}</Text>
        </Pressable>
    );
}

{/* 
<CustomButton
    onPress={() => console.log("Button Pressed")}
    title="Press Me"
/> 
*/}





// -------------------------------------------------------------------------- //



// STATE MANAGEMENT

// import { useState } from "react";

const [name, setName] = useState("John Doe");
let user = "Michelangelo";

function updateName(name) {
    setName(name);      // ✅
    user = "Alex";      // ❌
}


// -------------------------------------------------------------------------- //


// PROPS

const ParentComponent = () => { 
    return (
        <View>
            <Text>Parent Component</Text>
            <ChildComponent name="John Doe" age={25} /> {/* {"Alex"} */}
        </View>
    );
};

const ChildComponent = ({ name, age }) => { 
    return (
        <View>
            <Text>Child Component</Text>
            <Text>Name: {name}</Text>
            <Text>Age: {age}</Text>
        </View>
    );
}; 






// -------------------------------------------------------------------------- //




// -------------------------------------------------------------------------- //




// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //



// -------------------------------------------------------------------------- //









// -------------------------------------------------------------------------- //


module.exports = { 
    PressableExample, 
    ModalExample, 
    statusBarExample, 
    ActivityIndicatorExample, 
    AlertExample, 
    stylesApp, 
    dynamicStyles, 
    DynamicUserInterface,
    DynamicUserInterface2,
    SimpleDynamicUserInterface,
    SafeAreaViewExample, 
    PlatformSpecificCodeExample,
    PlatformSpecificCodeExample2,
    platformStylesSheet,
};