import withRoot from './modules/withRoot';
// --- Post bootstrap -----
import React from 'react';
import Markdown from 'markdown-to-jsx';
import Typography from './modules/components/Typography';
import LayoutBody from './modules/components/LayoutBody';
import AppAppBar from './modules/views/AppAppBar';
import AppFooter from './modules/views/AppFooter';

const md = `
###This site is built with <a href="https://material-ui.com/">Material-UI</a>.

###Design based on [Onepirate theme](https://github.com/mui-org/material-ui/tree/master/docs/src/pages/premium-themes/onepirate) for Material-UI.

### (c)2019 Yohta Ito
`;

function Terms() {
  return (
    <React.Fragment>
    {/*
    <AppAppBar />
    */}
    <LayoutBody margin marginBottom>
    <Typography variant="h3" gutterBottom marked="center" align="center">
    Site Credits
    </Typography>
    <Markdown children={md} />
    </LayoutBody>
    <AppFooter />
    </React.Fragment>
  );
}

export default withRoot(Terms);
