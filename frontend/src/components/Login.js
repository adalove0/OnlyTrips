import React, {useState} from 'react';
import App from '../App';
import logo from '../images/OnlyTrips.svg'
import SignUp from '../pages/SignUp.js'

function Login()
{
    
    var loginName;
    var loginPassword;

    const [message,setMessage] = useState('');

    const doLogin = async event => 
    {
        event.preventDefault();

        var obj = {login:loginName.value,password:loginPassword.value};
        var js = JSON.stringify(obj);

        try
        {    
            const response = await fetch('http://localhost:5000/api/login',
                {method:'POST',body:js,headers:{'Content-Type': 'application/json'}});

            var res = JSON.parse(await response.text());

            if( res.id <= 0 )
            {
                setMessage('User/Password combination incorrect');
            }
            else
            {
                var user = {firstName:res.firstName,lastName:res.lastName,id:res.id}
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

    return(
      <div id="loginDiv">
      <img src={logo} alt="OnlyTrips Logo" id="logo"></ img>
        <form id = "loginForm" onSubmit={doLogin}>
        <input type="text" id="loginName" placeholder="Username" ref={(c) => loginName = c} /><br />
        <input type="password" id="loginPassword" placeholder="Password" ref={(c) => loginPassword = c} /><br />
        <input type="submit" id="loginButton" class="buttons" value = "Do It"
          onClick={doLogin} />
        </form>
        <p id = "signUpLink"> Dont have an account?  <a href={SignUp} id = "signUpLink">Sign Up</a></p>
     </div>
    );
};

export default Login;

