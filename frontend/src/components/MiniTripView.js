import React, {useState} from 'react';



function MiniTripView()
{
    var trip = '';
    var search = '';

    const [message,setMessage] = useState('');
    const [searchResults,setResults] = useState('');
    const [cardList,setCardList] = useState('');

    const addTrip = async event => 
    {
	    event.preventDefault();

	    alert('addTrip() ' + trip.value);

    };

    const searchTrip = async event => 
    {
        event.preventDefault();
        
	   alert('searchTrip' + search.value);
    };

    return(
      <div id="accessUIDiv">
       <br />
       <input type="text" id="searchText" placeholder="Card To Search For" />
       <button type="button" id="searchCardButton" class="buttons" 
           onkeyup={searchTrip}> Search Trip </button><br />
       <span id="cardSearchResult"></span>
       <p id="cardList"></p><br /><br />
       <input type="text" id="cardText" placeholder="Card To Add" />
       <button type="button" id="addCardButton" class="buttons" 
          onClick={addTrip}> Add Trip </button><br />
       <span id="cardAddResult"></span>
     </div>
    );
}

export default MiniTripView;