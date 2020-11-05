import React from 'react';

import PageTitle from '../components/PageTitle';
import LoggedInName from '../components/LoggedInName';
import CardUI from '../components/MiniTripView';
import MiniTripView from '../components/MiniTripView';

const tripView = () =>
{
    return(
        <div>
            <PageTitle />
            <LoggedInName />
            <MiniTripView />
        </div>
    );
}

export default tripView;
