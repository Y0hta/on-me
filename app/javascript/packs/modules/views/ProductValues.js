import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import LayoutBody from '../components/LayoutBody';
import Typography from '../components/Typography';

import curvy_lines from '../../static/productCurvyLines.png';
import logo_values_1 from '../../static/productValues1.svg';
import logo_values_2 from '../../static/productValues2.svg';
import logo_values_3 from '../../static/productValues3.svg';

const styles = theme => ({
  root: {
    display: 'flex',
    overflow: 'hidden',
    backgroundColor: theme.palette.secondary.main,
  },
  layoutBody: {
    marginTop: theme.spacing.unit*15,
    marginBottom: theme.spacing.unit*30,
    display: 'flex',
    position: 'relative',
  },
  item: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    padding: theme.spacing.unit*5,
  },
  image: {
    height: 55,
  },
  title: {
    marginTop: theme.spacing.unit*5,
    marginBottom: theme.spacing.unit*5,
  },
  curvyLines: {
    pointerEvents: 'none',
    position: 'absolute',
    top: -180,
  },
});

function ProductValues(props) {
  const { classes } = props;

  return (
    <section className={classes.root}>
      <LayoutBody className={classes.layoutBody} width="large">
        <img
          src={curvy_lines}
          className={classes.curvyLines}
          alt="curvy lines"
        />
        <Grid container spacing={5}>
          <Grid item xs={12} md={4}>
            <div className={classes.item}>
              <img
                className={classes.image}
                src={logo_values_1}
                alt="suitcase"
              />
              <Typography variant="h6" className={classes.title}>
                奢って感謝の気持ちを
              </Typography>
              <Typography variant="h5">
                {'何かを奢ることで応援しているクリエイターをサポートすることができます'}
              </Typography>
            </div>
          </Grid>
          <Grid item xs={12} md={4}>
            <div className={classes.item}>
              <img
                className={classes.image}
                src={logo_values_2}
                alt="graph"
              />
              <Typography variant="h6" className={classes.title}>
                新たなクリエイターを
              </Typography>
              <Typography variant="h5">
                {'Give Me a Treatでは新たなクリエイターを探すこともできます。お気に入りのクリエイターを見つけて、サポートしましょう！'}
              </Typography>
            </div>
          </Grid>
          <Grid item xs={12} md={4}>
            <div className={classes.item}>
              <img
                className={classes.image}
                src={logo_values_3}
                alt="clock"
              />
              <Typography variant="h6" className={classes.title}>
                面倒な手続きなし
              </Typography>
              <Typography variant="h5">
                {'何かを奢るベストなタイミングはそう思った時です。簡単なステップでクリエイターに奢ることができます'}
              </Typography>
            </div>
          </Grid>
        </Grid>
      </LayoutBody>
    </section>
  );
}

ProductValues.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(ProductValues);
