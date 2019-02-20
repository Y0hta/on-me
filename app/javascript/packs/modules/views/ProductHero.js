import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Link from '@material-ui/core/Link';
import Button from '../components/Button';
import Typography from '../components/Typography';
import ProductHeroLayout from './ProductHeroLayout';

import backgroundImage from '../../static/productBackground.jpg';

const styles = theme => ({
  background: {
    backgroundImage: `url(${backgroundImage})`,
    backgroundColor: '#7fc7d9',
    backgroundPosition: 'center',
  },
  button: {
    minWidth: 100,
  },
  h5: {
    marginBottom: theme.spacing.unit*4,
    marginTop: theme.spacing.unit*4,
    [theme.breakpoints.up('sm')]: {
      arginTop: theme.spacing.unit*10,
    },
  },
  more: {
    marginTop: theme.spacing.unit*2,
  },
});

function ProductHero(props) {
  const { classes } = props;

  return (
    <ProductHeroLayout backgroundClassName={classes.background}>
      {/* Increase the network loading priority of the background image. */}
      <img style={{ display: 'none' }} src={backgroundImage} alt="" />
      <Typography color="inherit" align="center" variant="h2" marked="center">
        クリエイターにコーヒーを奢ろう
      </Typography>
      <Typography color="inherit" align="center" variant="h5" className={classes.h5}>
        コーヒーを奢って、お気に入りのクリエイターに感謝の気持ちを示しませんか
      </Typography>
      <Button
        color="secondary"
        variant="contained"
        size="large"
        className={classes.button}
        component={linkProps => (
          <Link {...linkProps} href="/users/sign_up" variant="button" />
        )}
      >
        登録する
      </Button>
      <Typography variant="body2" color="inherit" className={classes.more}>
        <Link href="/explore" color="inherit">
          クリエイターを探す
        </Link>
      </Typography>
    </ProductHeroLayout>
  );
}

ProductHero.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(ProductHero);
