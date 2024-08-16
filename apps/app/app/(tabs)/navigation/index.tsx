import { Text, View } from "react-native";

import { createStyleSheet, useStyles } from 'react-native-unistyles';

export default function NavigationPage() {

  // Added test comment
  // Added test comment 2
  const { styles } = useStyles(stylesheet);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Navigation</Text>
    </View>
  );
};

const stylesheet = createStyleSheet(theme => ({
  container : {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 40,
  }
}))
