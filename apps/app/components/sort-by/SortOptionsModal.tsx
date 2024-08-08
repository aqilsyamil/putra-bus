import React from 'react';
import { View, Text, Modal, TouchableOpacity, StyleSheet } from 'react-native';

interface SortOptionsModalProps {
  isVisible: boolean;
  selectedOption: string;
  onOptionSelect: (option: string) => void;
  onCancel: () => void;
}

const SortOptionsModal: React.FC<SortOptionsModalProps> = ({ isVisible, selectedOption, onOptionSelect, onCancel }) => {
  const options = [
    'Favorited bus stop',
    'Bus stop name: A-Z',
    'Bus stop name: Z-A',
    'Number of routes: High to Low',
    'Number of routes: Low to High',
  ];

  return (
    <Modal visible={isVisible} transparent={true} animationType="slide">
      <View style={styles.modalContainer}>
        <View style={styles.modalContent}>
          <Text style={styles.modalTitle}>Sort by</Text>
          {options.map((option) => (
            <TouchableOpacity
              key={option}
              onPress={() => onOptionSelect(option)}
              style={styles.option}
            >
              <Text style={styles.optionText}>{option}</Text>
              <View
                style={[
                  styles.checkbox,
                  selectedOption === option && styles.checkboxChecked,
                ]}
              />
            </TouchableOpacity>
          ))}
          <TouchableOpacity onPress={onCancel} style={styles.cancelButton}>
            <Text style={styles.cancelText}>Cancel</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  modalContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
  },
  modalContent: {
    width: 300,
    backgroundColor: 'white',
    borderRadius: 10,
    padding: 20,
  },
  modalTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  option: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 10,
    justifyContent: 'space-between',
  },
  optionText: {
    fontSize: 16,
    flex: 1,
  },
  checkbox: {
    width: 20,
    height: 20,
    borderRadius: 10,
    borderWidth: 2,
    borderColor: '#5C5B5A',
    backgroundColor: 'transparent',
  },
  checkboxChecked: {
    backgroundColor: 'red',
    borderColor: 'red',
  },
  cancelButton: {
    alignItems: 'center',
    paddingVertical: 10,
  },
  cancelText: {
    fontSize: 16,
    color: 'blue',
  },
});

export default SortOptionsModal;
