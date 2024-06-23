import React from 'react';
import { View, TextInput } from 'react-native';
import SearchIcon from '@/icons/SearchIcon';

interface SearchBarProps {
  placeholder?: string;
  width?: number;
  height?: number;
}
const SearchBar: React.FC<SearchBarProps> = ({ placeholder = 'Search...', width = 350, height = 40 }) => {
  return (
    <View className="flex-row items-center justify-center border rounded-2xl bg-white px-3 py-2"  style={{ width, height }}>
      <SearchIcon color="#999" size={20} style="mr-2"/>
      <TextInput
        placeholder={placeholder}
        className="flex-1 text-base text-gray-600"
        placeholderTextColor="#999"
        underlineColorAndroid="transparent"
      />
    </View>
  );
};


export default SearchBar;
