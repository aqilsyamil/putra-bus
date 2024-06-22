import React from 'react';
import { View, TextInput } from 'react-native';
import { Feather } from '@expo/vector-icons';

interface SearchBarProps {
  placeholder?: string;
  width?: number;
  height?: number;
}

const SearchBar: React.FC<SearchBarProps> = ({ placeholder = 'Search...', width = 350, height = 40 }) => {
  return (
    <View style={{ flexDirection: 'row', 
      alignItems: 'center', 
      justifyContent: 'center', 
      borderWidth: 1, 
      borderColor: '#ccc', 
      borderRadius: 20, 
      paddingHorizontal: 12, 
      paddingVertical: 8, 
      backgroundColor: '#fff', 
      width: width, 
      height: height
    }}>
      <Feather name="search" size={20} color="#999" style={{ marginRight: 8 }} />
      <TextInput
        placeholder={placeholder}
        style={{ flex: 1, fontSize: 16, color: '#666' }}
        placeholderTextColor="#999"
        underlineColorAndroid="transparent"
      />
    </View>
  );
};

export default SearchBar;
