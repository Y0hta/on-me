import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import LayoutBody from '../components/LayoutBody';
import Paper from '../components/Paper';

import curvy_lines from '../../static/appCurvyLines.png';

const styles = theme => ({
  root: {
    display: 'flex',
    backgroundImage: curvy_lines,
    backgroundRepeat: 'no-repeat',
  },
  paper: {
    padding: theme.spacing.unit*4,
    [theme.breakpoints.up('md')]: {
      padding: theme.spacing.unit*10,
    },
  },
});

function AppForm(props) {
  const { children, classes } = props;

  return (
    <div className={classes.root}>
      <LayoutBody margin marginBottom width="small">
        <Paper className={classes.paper}>{children}</Paper>
      </LayoutBody>
    </div>
  );
}

AppForm.propTypes = {
  children: PropTypes.node.isRequired,
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(AppForm);
