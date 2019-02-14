import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Link from '@material-ui/core/Link';
import Typography from '../components/Typography';
import TextField from '../components/TextField';
import LayoutBody from '../components/LayoutBody';
import compose from '../utils/compose';

import logo_facebook from '../../static/001-facebook.png';
import logo_twitter from '../../static/002-twitter.png';

const styles = theme => ({
  root: {
    display: 'flex',
    backgroundColor: theme.palette.secondary.light,
  },
  layoutBody: {
    marginTop: theme.spacing.unit*7,
    marginBottom: theme.spacing.unit,
    display: 'flex',
  },
  iconsWrapper: {
    height: 100,
  },
  icons: {
    display: 'flex',
  },
  icon: {
    width: 48,
    height: 48,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: theme.palette.secondary.light,
    marginRight: theme.spacing.unit,
    '&:hover': {
      backgroundColor: theme.palette.secondary.light,
    },
  },
  list: {
    margin: 0,
    listStyle: 'none',
    paddingLeft: 0,
  },
  listItem: {
    paddingTop: theme.spacing.unit*0.5,
    paddingBottom: theme.spacing.unit*0.5,
  },
});

function AppFooter(props) {
  const { classes } = props;

  return (
    <Typography component="footer" className={classes.root}>
      <LayoutBody className={classes.layoutBody} width="large">
        <Grid container spacing={5}>
          <Grid item xs={6} sm={4} md={2}>
            <Grid
              container
              direction="column"
              justify="flex-center"
              className={classes.iconsWrapper}
              spacing={1}
            >
              <Grid item className={classes.icons}>
                <a href="#" className={classes.icon}>
                  <img src={logo_facebook} alt="Facebook" />
                </a>
                <a href="#" className={classes.icon}>
                  <img src={logo_twitter} alt="Twitter" />
                </a>
              </Grid>
            </Grid>
          </Grid>
          <Grid item xs={6} sm={6} md={6}>
            {'© 2019 '}
            <ul className={classes.list}>
              <li className={classes.listItem}>
                <Link href="/terms">Credits</Link>
              </li>
            </ul>
          </Grid>
          {/*
          <Grid item xs={6} sm={4} md={2}>
            <Typography variant="h6" marked="left" gutterBottom>
              Legal
            </Typography>
            <ul className={classes.list}>
              <li className={classes.listItem}>
                <Link href="/premium-themes/onepirate/terms">Terms</Link>
              </li>
              <li className={classes.listItem}>
                <Link href="/premium-themes/onepirate/privacy">Privacy</Link>
              </li>
            </ul>
          </Grid>
          <Grid item xs={6} sm={8} md={4}>
            <Typography variant="h6" marked="left" gutterBottom>
              Language
            </Typography>
            <TextField
              select
              SelectProps={{
                native: true,
              }}
              className={classes.language}
            >
              {LANGUAGES.map(language => (
                <option value={language.code} key={language.code}>
                  {language.name}
                </option>
              ))}
            </TextField>
          </Grid>
          */}
          <Grid item>
            <Typography variant="caption">
              {'Icons made by '}
              <Link href="http://www.freepik.com" title="Freepik">
                Freepik
              </Link>
              {' from '}
              <Link href="https://www.flaticon.com/" title="Flaticon">
                www.flaticon.com
              </Link>
              {' is licensed by '}
              <Link
                href="http://creativecommons.org/licenses/by/3.0/"
                title="Creative Commons BY 3.0"
                target="_blank"
                rel="noopener noreferrer"
              >
                CC 3.0 BY
              </Link>
            </Typography>
          </Grid>
        </Grid>
      </LayoutBody>
    </Typography>
  );
}

AppFooter.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default compose(
  React.memo,
  withStyles(styles),
)(AppFooter);
