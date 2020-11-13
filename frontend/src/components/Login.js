import React, {useState} from 'react';
import App from '../App';
import logo from '../images/OnlyTrips.svg'
import SignUpPage from '../pages/SignUpPage.js'

function Login()
{
    
    var loginEmail;
    var loginPassword;

    const [message,setMessage] = useState('');

    const doLogin = async event => 
    {
        event.preventDefault();

        var data = {login:loginEmail.value,password:loginPassword.value};
        var js = JSON.stringify(data);

        var request = new XMLHttpRequest();
        request.open('POST', '../../../backend/routes/login.js', false);
        request.setRequestHeader('Content-Type', 'application/json; charset = UTF-8');


        try
        {           
            request.send(js);

            var response = JSON.parse(await request.text());
            var error = response["error"];

            if( response.id <= 0 )
            {
                setMessage('User/Password combination incorrect');
            }
            else
            {
                var user = {firstName:response.firstName,lastName:response.lastName,id:response.id}
                localStorage.setItem('user_data', JSON.stringify(user));

                setMessage('');
                window.location.href = '/onlytrips';
            }
        }
        catch(e)
        {
            alert(e.toString());
            return;
        }    
    };

        const goToSignUp = async event =>
        {   
                event.preventDefault();
                window.location.href='/SignUpPage';
        
        };

    return(
      <div id="loginDiv">
      <img src={logo} alt="OnlyTrips Logo" id="logo"></ img>
        <form id = "loginForm" onSubmit={doLogin}>
        <input type="text" id="textbox" placeholder="Username" ref={(c) => loginEmail = c} /><br />
        <input type="password" id="textbox" placeholder="Password" ref={(c) => loginPassword = c} /><br />
        <input type="submit" id="loginButton" class="buttons" value = "Do It"
          onClick={doLogin} style={{cursor:'pointer'}}/>
        </form>
        <p id = "signUpLink"> Dont have an account?  <a id='Link' onClick={goToSignUp} >Sign Up</a></p>
     </div>
    );
};

export default Login;

