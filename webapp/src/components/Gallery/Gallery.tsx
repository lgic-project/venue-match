import { Grid } from '@mantine/core';

export function Gallery() {
  return (
    <Grid grow>
      <Grid.Col span={4}> <img src="../src/assets/images/waterfront.png"/></Grid.Col>
      <Grid.Col span={4}><img src="../src/assets/images/pokharaGrande2.png"/></Grid.Col>
      <Grid.Col span={4}><img src="../src/assets/images/galaxybanquet2.png"/></Grid.Col>
      <Grid.Col span={4}><img src="../src/assets/images/banner-img2.png"/></Grid.Col>
      <Grid.Col span={4}><img src="../src/assets/images/banner-img2.png"/></Grid.Col>
    </Grid>
  );
}