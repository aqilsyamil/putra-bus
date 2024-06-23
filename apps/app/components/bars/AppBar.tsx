import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

interface AppBarProps {
  title: string;
  children?: JSX.Element
}

const AppBar = ({ title, children }: AppBarProps): JSX.Element => {


  return (
    <View style={styles.container}>
      <Text style={styles.title}>{title}</Text>
      {children}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#ffffff',
    height: 80,
    justifyContent: 'center',
    alignItems: 'flex-start', 
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
    paddingHorizontal: 16,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
     textAlign: 'left', 
  },
});

export default AppBar;
